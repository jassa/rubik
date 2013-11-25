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

#inicializa una nueva dirección de memoria para una nueva variable
def new_memory_id(data_type)
  cont = instance_variable_get("@cont_#{data_type}")
  memory_id = "#{data_type[0]}:#{cont}"
  instance_variable_set("@cont_#{data_type}", cont + 1)
  memory_id
end

#crea un nuevo objeto cuadruplo, lo agrega a la pila e incrementa el contador de saltos
def pushCuadruplo(*args)
  q = Cuadruplo.new(*args)
  @quadruples.push(q)
  @saltos += 1
end

#redirige el primer cuadruplo al main en ejecución
def goto_main
  pushCuadruplo("goto", nil, nil, nil)
end

#agrega el end al final del programa
def statement_end
  pushCuadruplo("end", nil, nil, nil)
end

#rellena el primer cuadruplo con la casilla donde comienza el programa
def fill_main
  @quadruples[0].memory_id = @saltos
end

#Crea la nueva variable y verifica si la variable ya habia sido declarada antes.
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

#obtiene una variable de la lista o si no se encuentra regresa error undefined variable.
def get_variable(name, scope = @current_scope)
  name_with_scope = variable_with_scope(name, scope)
  @symbols[name_with_scope] || @symbols[name.to_sym] or
    raise "undefined variable '#{name}'"
end

#crea una constante nueva o obtiene la direccion de la constante
def get_constant(value, data_type)
  @constants[value.to_sym] ||= new_memory_id(data_type)
end

#verifica si una constante se encuentra declarada
def constant?(memory_id)
  @constants.has_value?(memory_id)
end

#se crea una variable de acuerdo al scope.
def variable_with_scope(name, scope)
  [scope, name].compact.join('.').to_sym
end

#asigna la direccion de momoria que traera el valor al asignar una variable
def assign(variable_name, index = nil)
  if index
    array1(variable_name, index)
  else
    variable = get_variable(variable_name)

    memory_id = variable[3]
    var_type = variable[1]

    @pila_operandos.push(memory_id)
    @pila_tipos.push(var_type)
  end
end

#arrays

#se obtiene la dirección de memoria para un array previamente declarado dependiendo del subindex
def array1(variable_name, subindex)
  puts "a1",@pila_operandos.to_s
  index_type = @pila_tipos.pop

  if index_type != 'int'
    raise "wrong index data type for array '#{variable_name}': expected int, got #{index_type}"
  end

  array = get_variable(variable_name)

  data_type = array[1]
  op1 = array[3]
  op2 = @pila_operandos.pop
  memory_id = new_memory_id(data_type)

  pushCuadruplo('+', "(#{op1})", op2, memory_id)

  @pila_operandos.push(memory_id)
  @pila_tipos.push(data_type)
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

#se introduce a pila de operandos la variable y a pila de tipos el tipo de la variable
def exp1(value, data_type)
  if data_type == "id"
    _name, data_type, _value, memory_id = get_variable(value)
  else
    memory_id = get_constant(value, data_type)
  end

  @pila_operandos.push(memory_id)
  @pila_tipos.push(data_type)
end

# Se usa para el paso 2, 3 y 8 introduce el operador a la pila de operadores
def exp2(operador)
  @pila_operadores.push(operador)
end

#compara los tipo para determinar si es una operación legal
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

# se genera el cuadruplo correspondiente a la operación si es que esta fué valida.
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

# se genera el cuadruplo correspondiente a la operación si es que esta fué valida.
def exp5
  exp4(['*','/','&&'])
end

#se introduce fondo falso para prioridad de operaciones
def exp6
  @pila_operadores.push("(")
end

#se extrae el fondo falso de la pila de operadores
def exp7
  @pila_operadores.pop
end

#se genra el cuadruplo correspondiente dependiendo de la operación o la asignacion
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

#verifica que el valor recibido de la expresion sea booleando y genera el jump en falso.
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

#se genera el goto en caso de haber sido ser verdadero salta hasta el final del estatuto.
def if2
  pushCuadruplo("goto",nil, nil, nil)
  jump_to_false = @pila_saltos.pop
  @quadruples[jump_to_false].memory_id = @saltos
  @pila_saltos.push(@saltos-1)
end

#se registra el final del estatuto y se rellenan el salto al cuadruplo correspondiente
def if3
  @inserta_fin = @pila_saltos.pop
  @quadruples[@inserta_fin].memory_id = @saltos
end

# times

#se crean cuadruplos de control que en ejecución se van decrementando 
#para controlar el numero de veces que se realiza el estatuto
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

#se genera el salto para volver a ejecutar el estatuto
def times2
  go_false = @pila_saltos.pop
  return_times = @pila_saltos.pop

  pushCuadruplo("goto", nil , nil, return_times)

  @quadruples[go_false].memory_id = @saltos
end

# Input/Output

#genera el cuadruplo para la función gets
def r_gets
  memory_id = new_memory_id('string')
  pushCuadruplo("gets", nil, nil, memory_id)
end

#genera el cuadruplo para la funcion print
def r_print
  memory_id = @pila_operandos.pop
  @pila_tipos.pop
  pushCuadruplo("print", memory_id, nil, nil)
end

#move

#genera el cuadruplo para la funcion move
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

#genera el cuadruplo para la funcion color
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


#genera el cuadruplo para la funcion pen_up
def pen_up
  pushCuadruplo("PENUP",'','','')
end


#genera el cuadruplo para la funcion pen_down
def pen_down
  pushCuadruplo("PENDOWN",'','','')
end

#draw figures

#genera el cuadruplo para las funciones que dibujan en el canvas
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


#genera el cuadruplo para la funcion talk
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


#genera el cuadruplo para la funcion Dir
def dir
  direccion = @pila_tipos.pop
  if direccion != "String"
    puts "dir method must recive String values"
  else
    mem = @pila_operandos.pop
    pushCuadruplo("Dir", mem, '','')
  end
end

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
