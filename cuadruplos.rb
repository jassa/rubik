class Cuadruplo
  def initialize(operador, operando1, operando2, memoria)
    @op = operador
    @o1 = operando1
    @o2 = operando2
    @mem = memoria
  end
end

def pushCuadruplo(cuadruplo)
  @tabla_cuadruplos.push(cuadruplo)
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

#Expresiones

def exp1(variable_name, scope)
  key = [scope, variable_name].compact.join('.').to_sym
  _name, type, _value, memory_id = @symbols[key]

  @pila_operandos.push(memory_id)
  @pila_tipos.push(type)
end

#se usa para el paso 2 ,3 y 8
def exp2(operador)
  @pila_operadores.push(operador)
end

def exp4
  if @pila_operadores.last == '+' || @pila_operadores.last == '-' || @pila_operadores.last == '||'
    tipo_resultado = cubo_semantico[@pila_tipos.last][@pila_tipos[-2]][@pila_operadores.last]
    case tipo_resultado
    when "Integer"
      mem = @temporalInt
      @temporalInt += 1
    when "Float"
      mem = @temporalFlt
      @temporalFlt += 1
    when "String"
      mem = @temporalStr
      @temporalStr += 1
    when "Boolean"
      mem = @temporalBoo
      @temporalBoo +=1
    when "Char"
      mem = @temporalChr
      @temporalChr +=1
    when "Error"
      puts "Error, tipos no compatibles"
      exit()
    end

    if tipo_resultado != "Error"
      @pila_tipos.pop
      @pila_tipos.pop
      op = @pila_operadores.pop
      op2 = @pila_operandos.pop
      op1 = @pila_operandos.pop
      cuadruplo = Cuadruplo.new(op,op1,op2, mem )
      pushCuadruplo(cuadruplo)
      @pila_operandos.push(cuadruplo.memoria)
      @pila_tipos.push(tipo_resultado)
    end
  end
end

def exp5
  if @pila_operadores.last == '*' or @pila_operadores.last == '/' or @pila_operadores.last == '&&'
    tipo_resultado = cubo_semantico[@pila_tipos.last][@pila_tipos[-2]][@pila_operadores.last]
    case tipo_resultado
    when "Integer"
      mem = @temporalInt
      @temporalInt += 1
    when "Float"
      mem = @temporalFlt
      @temporalFlt += 1
    when "String"
      mem = @temporalStr
      @temporalStr += 1
    when "Boolean"
      mem = @temporalBoo
      @temporalBoo +=1
    when "Char"
      mem = @temporalChr
      @temporalChr +=1
    when "Error"
      puts "Error, tipos no compatibles"
      exit()
    end

    if tipo_resultado != "Error"
      @pila_tipos.pop
      @pila_tipos.pop
      op = @pila_operadores.pop
      op2 = @pila_operandos.pop
      op1 = @pila_operandos.pop
      cuadruplo = Cuadruplo.new(op,op1,op2, mem )
      pushCuadruplo(cuadruplo)
      @pila_operandos.push(cuadruplo.memoria)
      @pila_tipos.push(tipo_resultado)
    end
  end
end

def exp6
  @pila_operadores.push("(")
end

def exp7
  @pila_operadores.pop
end

def exp9
  if @pila_operadores.last == '=' or @pila_operadores.last == '<=' or @pila_operadores.last == '>=' or @pila_operadores.last == '>' or @pila_operadores.last == '<' or @pila_operadores.last == '<>'
    tipo_resultado = cubo_semantico[@pila_tipos.last][@pila_tipos[-2]][@pila_operadores.last]
    case tipo_resultado
    when "Integer"
      mem = @temporalInt
      @temporalInt += 1
    when "Float"
      mem = @temporalFlt
      @temporalFlt += 1
    when "String"
      mem = @temporalStr
      @temporalStr += 1
    when "Boolean"
      mem = @temporalBoo
      @temporalBoo +=1
    when "Char"
      mem = @temporalChr
      @temporalChr +=1
    when "Error"
      puts "Error, tipos no compatibles"
      exit()
    end

    @pila_tipos.pop
    @pila_tipos.pop

    if tipo_resultado != "Error" and @pila_operadores.last != '='
      op = @pila_operadores.pop
      op2 = @pila_operandos.pop
      op1 = @pila_operandos.pop
      cuadruplo = Cuadruplo.new(op,op1,op2, mem )
      pushCuadruplo(cuadruplo)
      @pila_operandos.push(cuadruplo.memoria)
      @pila_tipos.push(tipo_resultado)
    else
      mem = @pila_operandos.pop
      op1 = @pila_operandos.pop
      op = @pila_operadores.pop
      cuadruplo = Cuadruplo.new(op, op1, "", mem)
      pushCuadruplo(cuadruplo)
    end
  end
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

# puts

def r_print
  imprime = @pila_operandos.pop
  @pila_tipos.pop
  cuadruplo = Cuadruplo.new("PUTS", imprime, '','')
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
