module Logger
	def log(msg, level=0, color=nil)
	  if msg.respond_to?(:each)
	    msg.each { |m| log(m.inspect, level + 1, color) }
	  else
	    puts('  ' * level + (color ? msg.send(color) : msg))
	  end
	end

	def log_success(msg, level=0, color='green')
	  log(msg, level, color)
	end

	def log_error(msg, level=0, color='red')
	  log(msg, level, color)
	end

	def log_warn(msg, level=0, color='yellow')
	  log(msg, level, color)
	end

	def report_results(examples, errors)
	  logger = errors > 0 ? :log_error : :log_success
	  send(logger, "#{examples} examples, #{errors} failures")
	end
end

extend Logger
