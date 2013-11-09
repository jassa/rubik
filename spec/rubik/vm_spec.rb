require 'spec_helper'

describe Rubik::VM do

  describe 'performs arithmetic operations' do
    it 'for constants' do
      $stdout.should_receive(:print).with(10)
      Rubik::VM.new 'print(5+5)'
    end
  end

end
