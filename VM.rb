require './RubikParser.rb'
require './demo/turtle.rb'

module Rubik
  class VM

    attr_accessor :parser, :quadruples, :constants, :pointer

    def initialize(app = nil, input_stream)
      if app.nil?
        stub = Class.new do
          def method_missing(*args)
            # do nothing
          end
        end.new
        @app = @turtle = stub
      else
        @app = app
        drawings = @app.instance_variable_get("@drawings")
        turtle = @app.instance_variable_get("@turtle")
        @turtle = Turtle.new(@app, turtle, drawings)
      end

      @parser = Parser.new(input_stream)

      process

      generate_memory_from_constants
      generate_memory_from_quadruples

      debug
    end

    def memory
      @memory ||= {}
    end

    def debug
      puts # start with new line
      @quadruples.each_with_index { |q, i| puts "#{i} #{q.to_a}" }
    end

    private

    def process
      parser.program
      @quadruples, @constants = parser.instance_variable_get('@quadruples'),
        parser.instance_variable_get('@constants')
    end

    def generate_memory_from_constants
      constants.each do |value, memory_id|
        memory[memory_id] = normalize(value.to_s, memory_id)
      end
    end

    def generate_memory_from_quadruples
      @pointer = 0
      @pointers = []
      @returns = []

      while @pointer < quadruples.size
        evaluate_quadruple(quadruples[pointer])
      end
    end

    def evaluate_quadruple(quadruple)
      operator, op1, op2, key = quadruple.to_a

      case operator
      when '+', '-', '*', '/', '<', '>',
           '&&', '||', '>=', '<=', '==', '!='
        if op1[0] == '('
          index = op1.match(/\d+/)[0].to_i + memory[op2]
          memory_id = "i:#{index}"
          replace_memory(key, memory_id)
        else
          memory[key] = memory[op1].send(operator, memory[op2])
        end
      when '='
        memory[key] = memory[op1]
      when 'print'
        $stdout.print memory[op1]
      when 'gets'
        value = $stdin.gets.chomp
        memory[key] = normalize(key, value)
      when 'goto'
        return @pointer = key
      when 'gotoF'
        return @pointer = key if !memory[op1]
      when 'param'
        memory[op1] = memory[key]
      when 'return'
        @returns.push(op1)
      when 'ret'
        @pointer = @pointers.pop
        @quadruples[@pointer].op1 = @returns.pop
        return
      when 'era'
      when 'goSub'
        @pointers.push(@pointer + 1)
        return @pointer = key
      when 'change_direction', 'change_color'
        @turtle.send(operator.to_sym, memory[op1])
      when 'draw_circle', 'draw_square', 'talk', 'move'
        @turtle.send(operator.to_sym, memory[op1])
      when 'draw_rectangle'
        @turtle.draw_rectangle(memory[op1], memory[op2])
      when 'pen_down', 'pen_up'
        @turtle.send(operator.to_sym)
      end

      @pointer += 1
    end

    private

    def normalize(value, memory_id)
      var_type_id = memory_id[0]

      case var_type_id
      when 'i'
        value.to_i
      when 'f'
        value.to_f
      when 's'
        value[0] == '"' ? value[1..-2] : value
      when 'b'
        eval(value) if value =~ /true|false/
      end
    end

    def replace_memory(memory_id, replacement_id)
      @quadruples.each do |quad|
        [:op1, :op2, :memory_id].each do |method|
          quad.send("#{method}=", replacement_id) if quad.send(method) == memory_id
        end
      end
    end

  end
end
