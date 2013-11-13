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

def pushCuadruplo(cuadruplo)
  @quadruples.push(cuadruplo)
  @saltos += 1
end

def goto_main
  goto = Cuadruplo.new("GOTO","","","")
  pushCuadruplo(goto)
end

def statement_end
  st_end = Cuadruplo.new("END","","","")
  pushCuadruplo(st_end)
end

def fill_main
  @tabla_cuadruplos[0].mem = @saltos
end

def get_variable(name)
  name_with_scope = variable_with_scope(name)
  @symbols[name_with_scope] || @symbols[name.to_sym] or
    raise "undefined variable '#{name}'"
end

def get_constant(value, data_type)
  @constants[value.to_sym] ||= begin
    memory_id = "c:#{data_type[0]}:#{@cont_const}"
    @cont_const += 1
    memory_id
  end
end

def variable_with_scope(name)
  [@current_scope, name].compact.join('.').to_sym
end

def assign(variable_name)
  variable = get_variable(variable_name)

  memory_id = variable[3]
  var_type = variable[1]

  @pila_operandos.push(memory_id)
  @pila_tipos.push(var_type)
end

# Functions

class Function

  attr_accessor :name, :return_type, :parameters

  def initialize(name, return_type)
    @name = name
    @return_type = return_type
  end

  def add_parameter(param_name, type)
    if parameters[param_name.to_sym]
      raise "parameter #{param_name} has already been declared"
    end

    parameters[param_name] = type
  end

  def parameters
    @parameters ||= {}
  end

end

def func1(return_type)
  if @functions.has_key?(@current_scope.to_sym)
    raise "function '#{@current_scope}' has already been declared"
  end

  @functions[@current_scope.to_sym] = Function.new(@current_scope, return_type)
end

def func2(parameter, parameter_type)
  @functions[@current_scope.to_sym].add_parameter(parameter, parameter_type)
end

def func3(block_text)
  has_return = !(String(block_text) =~ /return/).nil?
  function = @functions[@current_scope.to_sym]

  if function.return_type == 'void'
    raise "'void' function should not have return statement" if has_return
  else
    raise "missing return statement for '#{function.return_type}'" unless has_return
  end
end

def call_func1(function_name)
  unless @functions.has_key?(function_name.to_sym)
    raise "undefined function '#{function_name}'"
  end

  @cont_params = 0
  @current_function = @functions[function_name.to_sym]

  quadruple = Cuadruplo.new('era', function_name, nil, nil)
  pushCuadruplo(quadruple)
end

def call_func2
  param_value = @pila_operandos.pop
  param_type = @pila_tipos.pop

  function = @current_function
  current_param = function.parameters.to_a[@cont_params]

  unless current_param
    raise "wrong number of arguments (must be #{function.parameters.size})"
  end

  unless current_param.type == param_type
    raise "wrong parameter type (expected #{current_param.type}, got #{param_type}"
  end

  quadruple = Cuadruplo.new('param', param_value, nil, @cont_params)
  pushCuadruplo(quadruple)

  @cont_params += 1
end

def call_func3
  quadruple = Cuadruplo.new('goSub', @current_function, nil, nil)
  pushCuadruplo(quadruple)
end

# Expressions

def exp1(value, data_type)
  puts value, data_type

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

  cont = instance_variable_get("@cont_#{result_type}")
  instance_variable_set("@cont_#{result_type}", cont + 1)
  memory_id = "t:#{result_type[0]}:#{cont}"

  cuadruplo = Cuadruplo.new(operator, op1, op2, memory_id)
  pushCuadruplo(cuadruplo)

  @pila_operandos.push(memory_id)
  @pila_tipos.push(result_type)
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
    cont = instance_variable_get("@cont_#{result_type}")
    instance_variable_set("@cont_#{result_type}", cont + 1)
    memory_id = "t:#{result_type[0]}:#{cont}"

    op2 = @pila_operandos.pop
    op1 = @pila_operandos.pop
  end

  cuadruplo = Cuadruplo.new(operator, op1, op2, memory_id)
  pushCuadruplo(cuadruplo)

  @pila_operandos.push(cuadruplo.memory_id)
  @pila_tipos.push(result_type)
end

# if

def if1
  check_bool = @pila_tipos.pop

  if check_bool != "Boolean"
    puts "If statemet must resturn a Boolean value"
    exit()
  else
    mem = @pila_operandos.pop
    cuadruplo = Cuadruplo.new("GOTOF", mem, '','')
    pushCuadruplo(cuadruplo)
    @pila_saltos.push(@saltos-1)
  end
end

def if2
  cuadruplo = Cuadruplo.new("GOTO", '','','')
  pushCuadruplo(cuadruplo)
  falso = @pila_saltos.pop
  @tabla_cuadruplos[falso].mem = @saltos
  @pila_saltos.push(@saltos-1)
end

def if3
  inserta_fin = @pila_saltos.pop
  @tabla_cuadruplos[inserta_fin].mem = @saltos
end

# times

def times1
  @pila_saltos.push(@saltos)
end

def times2
  check_int = @pila_tipos.pop
  if check_int != "Integer"
    puts "Times expression must recive Integer values"
  else
    mem = @pila_operandos.pop
    cuadruplo = Cuadruplo.new("GOTOF", mem, '','')
    pushCuadruplo(cuadruplo)
    @pila_saltos.push(@saltos-1)
  end
end

def times3
  falso = @pila_saltos.pop
  ret = @pila_saltos.pop
  cuadruplo = Cuadruplo.new("GOTO", '' , '', ret)
  pushCuadruplo(cuadruplo)
  @tabla_cuadruplos[falso].mem = @saltos
end

# Input/Output

def r_gets
  memory_id = "t:s:#{@cont_string}"
  @cont_string += 1
  cuadruplo = Cuadruplo.new("gets", nil, nil, memory_id)
  pushCuadruplo(cuadruplo)
end

def r_print
  memory_id = @pila_operandos.pop
  @pila_tipos.pop
  cuadruplo = Cuadruplo.new("print", memory_id, '', '')
  pushCuadruplo(cuadruplo)
end

#move
def move
  check_int = @pila_tipos.pop
  if check_int != "Integer"
    puts "Move expression must recive Integer values"
  else
    mem = @pila_operandos.pop
    cuadruplo = Cuadruplo.new("MOVE", mem, '','')
    pushCuadruplo(cuadruplo)
  end
end

#color

def color
  color = @pila_tipos.pop
  if color != "String"
    puts "Color method must recive String values"
  else
    mem = @pila_operandos.pop
    cuadruplo = Cuadruplo.new("Color", mem, '','')
    pushCuadruplo(cuadruplo)
  end
end

#pen_up pen_down
def pen_up
  cuadruplo = Cuadruplo.new("PENUP",'','','')
end

def pen_down
  cuadruplo = Cuadruplo.new("PENDOWN",'','','')
end

#draw figures

def draw_circle
  check_int = @pila_tipos.pop
  if check_int != "Integer"
    puts "Draw_circle method must recive Integer values"
  else
    mem = @pila_operandos.pop
    cuadruplo = Cuadruplo.new("DrawC", mem, '','')
    pushCuadruplo(cuadruplo)
  end
end

def draw_triangle
  check_int = @pila_tipos.pop
  if check_int != "Integer"
    puts "Draw_triangle method must recive Integer values"
  else
    mem = @pila_operandos.pop
    cuadruplo = Cuadruplo.new("DrawT", mem, '','')
    pushCuadruplo(cuadruplo)
  end
end

def draw_square
  check_int = @pila_tipos.pop
  if check_int != "Integer"
    puts "Draw_square method must recive Integer values"
  else
    mem = @pila_operandos.pop
    cuadruplo = Cuadruplo.new("DrawS", mem, '','')
    pushCuadruplo(cuadruplo)
  end
end

# talk

def talk
  frase = @pila_tipos.pop
  if frase != "String"
    puts "talk method must recive String values"
  else
    mem = @pila_operandos.pop
    cuadruplo = Cuadruplo.new("Talk", mem, '','')
    pushCuadruplo(cuadruplo)
  end
end

# Direccion
def dir
  direccion = @pila_tipos.pop
  if direccion != "String"
    puts "talk method must recive String values"
  else
    mem = @pila_operandos.pop
    cuadruplo = Cuadruplo.new("Dir", mem, '','')
    pushCuadruplo(cuadruplo)
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
  cuadruplo = Cuadruplo.new("ERA", nombre, '','')
  pushCuadruplo(cuadruplo)
end

def parametros(param, agr, tipo)
  if param.tipo_dato == tipo
    cuadruplo = Cuadruplo.new("PARAM", arg, "", param.nombre)
    pushCuadruplo(cuadruplo)
  else
    puts "Incompatible types in argument #{arg}"
    exit()
  end
end

def call_gosub(nombre, dir)
  cuadruplo = Cuadruplo("GOSUB", nombre, dir, '')
  pushCuadruplo(cuadruplo)
end
