@test_dir = File.dirname(__FILE__)
$LOAD_PATH.unshift(@test_dir) unless $LOAD_PATH.include?(@test_dir)

require 'test_helper'
require File.join(root_dir, 'RubikLexer.rb')

examples = Dir.glob(File.join(test_dir, "fixtures", "*.txt"))

error_count = 0
examples.each do |example|
  begin
    Rubik::Lexer.main(example)
  rescue Exception => e
    log_warn(File.read(example).each_line)
    log_error(e.message, 1)
    log_error(e.backtrace, 2)
  else
    log_success('Tokens identified without errors')
  end
  puts nil
end

report_results(examples.size, error_count)
