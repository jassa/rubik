def define_variable(name, value=nil, scope=nil)
  key = [scope, name].compact.join('.').to_sym
  if @symbols.has_key?(key)
    raise "'#{name}' has already been declared"
  else
    @symbols[key] = value
  end
end
