require_relative 'RubikParser.rb'

module Rubik
  class VM

    attr_accessor :parser, :quadruples, :constants, :pointer

    def initialize(input_stream)
      @parser = Parser.new(input_stream)

      process

      generate_memory_from_constants
      generate_memory_from_quadruples
    end

    def memory
      @memory ||= {}
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

      while @pointer < quadruples.size
        evaluate_quadruple(quadruples[pointer])
      end
    end

    def evaluate_quadruple(quadruple)
      operator, op1, op2, key = quadruple.to_a

      if @subPointer
        memory[op1] ||= memory[@params.pop]
        memory[op2] ||= memory[@params.pop]
      end

      case operator
      when '+', '-', '*', '/', '<', '>',
           '&&', '||', '>=', '<=', '==', '!='
        memory[key] = memory[op1].send(operator, memory[op2])
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
        return @pointer = key if !op1
      when 'param'
        @params << op1
      when 'ret'
        @pointer = @subPointer
        @subPointer = nil
        return
      when 'era'
        @params = []
      when 'goSub'
        @params.reverse!
        @subPointer = @pointer + 1
        return @pointer = key
      end

      @pointer += 1
    end

    def normalize(value, memory_id)
      var_type_id = memory_id[0]

      case var_type_id
      when 'i'
        value.to_i
      when 'f'
        value.to_f
      when 's'
        value[1..-2]
      when 'b'
        eval(value) if value =~ /true|false/
      end
    end

  end
end
