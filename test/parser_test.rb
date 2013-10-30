@test_dir = File.dirname(__FILE__)
$LOAD_PATH.unshift(@test_dir) unless $LOAD_PATH.include?(@test_dir)

require 'test_helper'
require File.join(root_dir, 'RubikParser.rb')

log 'RubikParser'

examples = Dir.glob(File.join(test_dir, "fixtures", "*.txt"))

class Dummy
  def write(*args)
    queue << [*args]
  end

  def puts(*args)
    write(*args)
  end

  def queue
    @queue ||= []
  end
end

error_count = 0
examples.each do |example|
  success = true
  begin
    $stdout = Dummy.new
    Rubik::Parser.main(example)
  rescue Exception => e
    if example.to_s =~ /.*\/f_.*/
      log_warn(File.read(example).each_line)
      log_success(e.message, 1)
    else
      success = false
      log_warn(File.read(example).each_line)
      log_error(e.message, 1)
      log_error(e.backtrace, 2)
      error_count += 1
    end
  else
    log_success("parsed without errors", 1)
  end

  queue = $stdout.queue
  $stdout = STDOUT
  logger = success ? :log_success : :log_error
  send(logger, example)
  queue.each { |msg| puts msg }

  puts nil
end

report_results(examples.size, error_count)
