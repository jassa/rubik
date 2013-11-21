def define_variable(name, type, dim)
  scope = @current_scope
  name = name[0, (name =~ /\[/ || name.size)]

  key = [scope, name].compact.join('.').to_sym
  if @symbols.has_key?(key)
    raise "'#{name}' has already been declared"
  else
    type_count = instance_variable_get("@cont_#{type}")
    value = nil
    dim.to_i.times do |i|
      k = "#{key}.#{i}".to_sym if i > 0
      k ||= key
      memory_id = "#{type[0]}:#{type_count}"
      @symbols[k] = [name, type, value, memory_id] 
      type_count += 1
    end
    instance_variable_set("@cont_#{type}", type_count)
      puts @symbols

  end
end
