def define_variable(name, value=nil)
  name = name.to_sym
  if @symbols.has_key?(name)
    raise "'#{name}' has already been declared"
  else
    @symbols[name] = value
  end
end
