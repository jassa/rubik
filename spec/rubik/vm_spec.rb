require 'spec_helper'

describe Rubik::VM do

  it 'performs arithmetic operations' do
    $stdout.should_receive(:print).with(10)
    Rubik::VM.new 'print(5+5)'
  end

end
