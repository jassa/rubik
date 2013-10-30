require 'debugger'

def test_dir
  @test_dir ||= File.dirname(__FILE__)
end

def root_dir
  @root_dir ||= File.expand_path('..', test_dir)
end

[root_dir, test_dir].each do |dir|
  $LOAD_PATH.unshift(dir) unless $LOAD_PATH.include?(dir)
end

Dir[File.join(test_dir, "support/**/*.rb")].each { |f| require f }
