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
      constants.each do |constant|
        key, value = constant
        memory[key] = normalize(key, value)
      end
    end

    def generate_memory_from_quadruples
      @pointer = 0

      while pointer < quadruples.size
        evaluate_quadruple(quadruples[pointer])
      end
    end

    def evaluate_quadruple(quadruple)
      operator, op1, op2, key = quadruple

      case operator
      when '+', '-', '*', '/', '<', '>'
           '&&', '||', '>=', '<=', '==', '!='
        memory[key] = op1.send(operator, op2)
      when 'print'
        print op1
      when 'gets'
        value = gets.chomp
        memory[key] = normalize(key, value)
      when 'goto'
        return pointer = key
      when 'gotoF'
        return pointer = key if !op1
      end

      pointer += 1
    end

    def normalize(key, value)
      var_id = key[2]

      case var_id
      when 'i'
        value.to_i
      when 'f'
        value.to_f
      when 's'
        value[1..-2]
      when 'b'
        eval(value)
      end
    end

  end
end
