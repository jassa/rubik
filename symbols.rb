def define_variable(name, type)
  scope = @current_scope
  key = [scope, name].compact.join('.').to_sym

  if @symbols.has_key?(key)
    raise "'#{name}' has already been declared"
  else
    type_count = instance_variable_get("@cont_#{type}")
    memory_id = "#{type[0]}:#{type_count}"
    instance_variable_set("@cont_#{type}", type_count + 1)
    value = nil
    @symbols[key] = [name, type, value, memory_id]
  end
end
