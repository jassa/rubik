def define_variable(name, type, scope='_')
  key = [scope, name].compact.join('.').to_sym
  if @symbols.has_key?(key)
    raise "'#{name}' has already been declared"
  else
    type_id = type[0]
    type_count = instance_variable_get("@cont_#{type_id}")
    memory_id = "#{scope}:#{type_id}:#{type_count}"
    @symbols[key] = [name, type, value, memory_id]
    instance_variable_set("@cont_#{type_id}", type_count + 1)
  end
end
