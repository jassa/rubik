class Cuadruplo

  attr_accessor :operator, :op1, :op2, :memory_id

  def initialize(operator, op1, op2, memory_id)
    @operator = operator
    @op1 = op1
    @op2 = op2
    @memory_id = memory_id
  end

  def to_a
    [operator, op1, op2, memory_id]
  end

end

def new_memory_id(data_type)
  cont = instance_variable_get("@cont_#{data_type}")
  memory_id = "#{data_type[0]}:#{cont}"
  instance_variable_set("@cont_#{data_type}", cont + 1)
  memory_id
end

def pushCuadruplo(*args)
  q = Cuadruplo.new(*args)
  @quadruples.push(q)
  @saltos += 1
end

def goto_main
  pushCuadruplo("goto", nil, nil, nil)
end

def statement_end
  pushCuadruplo("end", nil, nil, nil)
end

def fill_main
  @quadruples[0].memory_id = @saltos
end

def define_variable(name, type, dimension=1)
  scope = @current_scope
  key = [scope, name].compact.join('.').to_sym

  if @symbols.has_key?(key)
    raise "'#{name}' has already been declared"
  else
    value = nil
    dimension.to_i.times do |i|
      new_key = i > 0 ? [key, i].join('.').to_sym : key
      memory_id = new_memory_id(type)
      @symbols[new_key] = [name, type, value, memory_id]
    end
  end
end

def get_variable(name, scope = @current_scope)
  name_with_scope = variable_with_scope(name, scope)
  @symbols[name_with_scope] || @symbols[name.to_sym] or
    raise "undefined variable '#{name}'"
end

def get_constant(value, data_type)
  @constants[value.to_sym] ||= new_memory_id(data_type)
end

def constant?(memory_id)
  @constants.has_value?(memory_id)
end

def variable_with_scope(name, scope)
  [scope, name].compact.join('.').to_sym
end

def assign(variable_name, sub = nil)
  variable_name = [variable_name, sub].compact.join('.')
  variable = get_variable(variable_name)

  memory_id = variable[3]
  var_type = variable[1]

  @pila_operandos.push(memory_id)
  @pila_tipos.push(var_type)
end

#arrays

def array1(value, subindex)
  memoria = @pila_operandos.pop
  tipo = @pila_tipos.pop
  if subindex != '0' && subindex.to_i == 0
    _name, data_type, _value, memory_id = get_variable(subindex)
    @pila_operandos.push(memory_id)
    @pila_tipos.push(data_type)
  else
    key = "_.#{value}.#{subindex.to_i}".to_sym
    variable = @symbols[key]
    @pila_operandos.push(variable[3])
    @pila_tipos.push(variable[1])
  end
end


def array1(value, subindex)
  @pila_operandos.pop
  @pila_tipos.pop
  key = "_.#{value}.#{subindex.to_i}".to_sym
  variable = @symbols[key]
  puts "#{value}[#{subindex}] :: #{variable[1]}"
  @pila_operandos.push(variable[3])
  @pila_tipos.push(variable[1])
end



def array1(value, subindex)
  memoria = @pila_operandos.pop
  tipo = @pila_tipos.pop
  if subindex != '0' && subindex.to_i == 0
    _name, data_type, _value, memory_id = get_variable(subindex)
    @pila_operandos.push(memory_id)
    @pila_tipos.push(data_type)
  else
    key = "_.#{value}.#{subindex.to_i}".to_sym
    variable = @symbols[key]
    @pila_operandos.push(variable[3])
    @pila_tipos.push(variable[1])
  end
end


# Functions

class Function

  attr_accessor :name, :index, :parameters, :return_type, :memory_id

  def initialize(name, return_type, index)
    @name = name
    @return_type = return_type
    @index = index
  end

  def add_parameter(param_id, param_type)
    parameters << [param_id, param_type]
  end

  def parameters
    @parameters ||= []
  end

  def void?
    return_type == 'void'
  end

end

def func1(return_type)
  if @functions.has_key?(@current_scope.to_sym)
    raise "function '#{@current_scope}' has already been declared"
  end

  function = Function.new(@current_scope, return_type, @saltos)
  @functions[@current_scope.to_sym] = function
end

def func2(param_id, param_type)
  @functions[@current_scope.to_sym].add_parameter(param_id, param_type)
  define_variable(param_id, param_type)
end

def func3(block_text)
  function = @functions[@current_scope.to_sym]
  has_return = !(String(block_text) =~ /return/).nil?

  if !function.void? && !has_return
    raise "missing return statement for '#{function.return_type}'"
  end

  pushCuadruplo('ret', nil, nil, nil)
end

def return_expression
  function = @functions[@current_scope.to_sym]

  if function.return_type == 'void'
    raise "'void' function should not have return statement"
  end

  result_type = @pila_tipos.pop

  unless result_type == function.return_type
    raise "wrong return type in function '#{function.name}': " +
      "expected #{function.return_type}, got #{result_type}"
  end

  result = @pila_operandos.pop
  pushCuadruplo('return', result, nil, nil)
end

def call_func1(function_name)
  unless @functions.has_key?(function_name.to_sym)
    raise "undefined function '#{function_name}'"
  end

  @cont_params = 0
  @current_function = @functions[function_name.to_sym]

  pushCuadruplo('era', function_name, nil, nil)
end

def call_func2
  param_value = @pila_operandos.pop
  param_type = @pila_tipos.pop

  function = @current_function
  func_param_id, func_param_type = function.parameters[@cont_params]

  begin
    _name, param_type, _value, param_memory_id = get_variable(param_value)
  rescue
    param_memory_id = param_value
  end

  unless func_param_type
    raise "wrong number of arguments (must be #{function.parameters.size})"
  end

  unless func_param_type == param_type
    raise "wrong parameter type: expected #{func_param_type}, got #{param_type}"
  end

  func_var = get_variable(func_param_id, function.name)
  func_var_memory_id = func_var[3]

  pushCuadruplo('param', func_var_memory_id, nil, param_memory_id)

  @cont_params += 1
end

def call_func3
  function = @current_function
  pushCuadruplo('goSub', function.name, nil, function.index)

  if return_type = function.return_type
    memory_id = new_memory_id(return_type)
    @pila_tipos.push(return_type)
    @pila_operandos.push(memory_id)
    pushCuadruplo('=', nil, nil, memory_id)
  end
end

# Expressions

def exp1(value, data_type)
  if data_type == "id"
    _name, data_type, _value, memory_id = get_variable(value)
  else
    memory_id = get_constant(value, data_type)
  end

  @pila_operandos.push(memory_id)
  @pila_tipos.push(data_type)
end

# Se usa para el paso 2, 3 y 8
def exp2(operador)
  @pila_operadores.push(operador)
end

def get_result_type(operator, op1_type, op2_type)
  result_type = cubo_semantico[op1_type][op2_type][operator]

  case result_type
  when "int", "float", "string", "boolean"
    # do nothing
  else
    raise "illegal operation #{operator} between #{op1_type} and #{op2_type}"
  end

  result_type
end

def exp4(operators=['+','-','||'])
  return unless operators.include?(operator = @pila_operadores.last)

  @pila_operadores.pop
  op2_type = @pila_tipos.pop
  op1_type = @pila_tipos.pop

  result_type = get_result_type(operator, op1_type, op2_type)

  op2 = @pila_operandos.pop
  op1 = @pila_operandos.pop

  memory_id = new_memory_id(result_type)

  @pila_operandos.push(memory_id)
  @pila_tipos.push(result_type)

  pushCuadruplo(operator, op1, op2, memory_id)
end

def exp5
  exp4(['*','/','&&'])
end

def exp6
  @pila_operadores.push("(")
end

def exp7
  @pila_operadores.pop
end

def exp9(operators=['=', '==', '>', '<', '<=', '>=', '!='])
  return unless operators.include?(operator = @pila_operadores.last)

  @pila_operadores.pop
  op2_type = @pila_tipos.pop
  op1_type = @pila_tipos.pop

  result_type = get_result_type(operator, op1_type, op2_type)

  if operator == '='
    op1 = @pila_operandos.pop
    op2 = nil
    memory_id = @pila_operandos.pop
  else
    op2 = @pila_operandos.pop
    op1 = @pila_operandos.pop
    memory_id = new_memory_id(result_type)
  end

  pushCuadruplo(operator, op1, op2, memory_id)

  @pila_operandos.push(memory_id)
  @pila_tipos.push(result_type)
end

# if


def if1
  @check_bool = @pila_tipos.pop

  if @check_bool != "boolean"
    raise "If statement should recive a boolean value not a #{@check_bool}"
  else
    cuadruplo_jump = @pila_operandos.pop
    pushCuadruplo("gotoF", cuadruplo_jump, nil , nil)
    @pila_saltos.push(@saltos-1)
  end
end

def if2
  pushCuadruplo("goto",nil, nil, nil)
  jump_to_false = @pila_saltos.pop
  @quadruples[jump_to_false].memory_id = @saltos
  @pila_saltos.push(@saltos-1)
end

def if3
  @inserta_fin = @pila_saltos.pop
  @quadruples[@inserta_fin].memory_id = @saltos
end

# times

def times1
  check_int = @pila_tipos.pop
  if check_int != "int"
    raise "Times expression must recive int value not #{check_int}"
  else
    init_id = @pila_operandos.pop
    memory_id = "t:i:#{@cont_int}"
    @cont_int += 1
    op_1_memory_id = get_constant('1', 'int')
    op_2_memory_id = get_constant('0', 'int')

    pushCuadruplo('=', init_id, nil ,memory_id)
    @pila_saltos.push(@saltos)

    pushCuadruplo('-', memory_id, op_1_memory_id , memory_id)
    pushCuadruplo('>=', memory_id, op_2_memory_id,"c:b:#{@cont_boolean}")
    pushCuadruplo("gotoF", "c:b:#{@cont_boolean}", nil, nil)
    @pila_saltos.push(@saltos-1)

    @cont_boolean += 1
  end
end

def times2
  go_false = @pila_saltos.pop
  return_times = @pila_saltos.pop

  pushCuadruplo("goto", nil , nil, return_times)

  @quadruples[go_false].memory_id = @saltos
end


# Input/Output

def r_gets
  memory_id = new_memory_id('string')
  pushCuadruplo("gets", nil, nil, memory_id)
end

def r_print
  memory_id = @pila_operandos.pop
  @pila_tipos.pop
  pushCuadruplo("print", memory_id, nil, nil)
end

#move
def move
  check_int = @pila_tipos.pop
  if check_int != "Integer"
    puts "Move expression must recive Integer values"
  else
    mem = @pila_operandos.pop
    pushCuadruplo("MOVE", mem, '','')
  end
end

#color

def color
  color = @pila_tipos.pop
  if color != "String"
    puts "Color method must recive String values"
  else
    mem = @pila_operandos.pop
    pushCuadruplo("Color", mem, '','')
  end
end

#pen_up pen_down
def pen_up
  pushCuadruplo("PENUP",'','','')
end

def pen_down
  pushCuadruplo("PENDOWN",'','','')
end

#draw figures

def draw_circle
  check_int = @pila_tipos.pop
  if check_int != "Integer"
    puts "Draw_circle method must recive Integer values"
  else
    mem = @pila_operandos.pop
    pushCuadruplo("DrawC", mem, '','')
  end
end

def draw_triangle
  check_int = @pila_tipos.pop
  if check_int != "Integer"
    puts "Draw_triangle method must recive Integer values"
  else
    mem = @pila_operandos.pop
    pushCuadruplo("DrawT", mem, '','')
  end
end

def draw_square
  check_int = @pila_tipos.pop
  if check_int != "Integer"
    puts "Draw_square method must recive Integer values"
  else
    mem = @pila_operandos.pop
    pushCuadruplo("DrawS", mem, '','')
  end
end

# talk

def talk
  frase = @pila_tipos.pop
  if frase != "String"
    puts "talk method must recive String values"
  else
    mem = @pila_operandos.pop
    pushCuadruplo("Talk", mem, '','')
  end
end

# Direccion
def dir
  direccion = @pila_tipos.pop
  if direccion != "String"
    puts "talk method must recive String values"
  else
    mem = @pila_operandos.pop
    pushCuadruplo("Dir", mem, '','')
  end
end


# return
#
#def r_return(func, tabla_procedimientos)
 # for proc in tabla_procedimientos
  #  if proc.nombre == func
   #   tipo = proc.retorno
    #  r_retorno = @pila_tipos.pop
     # if tipo == r_retorno
      #  mem = @pila_operadores.pop
       # cuadruplo = Cuadruplo.new("RETURN", mem, '','')
        #pushCuadruplo(cuadruplo)
        #break
      #else
       # puts "Function #{func} must return #{tipo} not #{r_retorno}"
        #exit()
#end

# modulos
def verifica_funcion(noexiste, nombre)
  if noexiste
    puts "The function #{nombre} has not been declared"
    exit()
  end
end

def expande(nombre)
  pushCuadruplo("ERA", nombre, '','')
end

def parametros(param, agr, tipo)
  if param.tipo_dato == tipo
    pushCuadruplo("PARAM", arg, "", param.nombre)
  else
    puts "Incompatible types in argument #{arg}"
    exit()
  end
end

def call_gosub(nombre, dir)
  pushCuadruplo("GOSUB", nombre, dir, '')
end
