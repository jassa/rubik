require 'spec_helper'

describe Rubik::VM do

  describe 'performs arithmetic operations' do
    it 'on constants' do
      $stdout.should_receive(:print).with(10)
      Rubik::VM.new 'print(5+5)'
    end

    it 'on variables' do
      $stdout.should_receive(:print).with(15)
      program = <<-EOF
begin
  int a;
  a = 10;
  print(a + 5);
end
EOF
      Rubik::VM.new program
    end

    describe 'with priority' do
      it 'of operators' do
        $stdout.should_receive(:print).with(25)
        Rubik::VM.new 'print(10 + 5 * 3);'
      end

      it 'of parenthesis' do
        $stdout.should_receive(:print).with(45)
        Rubik::VM.new 'print((10 + 5) * 3);'
      end
    end
  end

  describe 'compares objects' do
    it 'constants' do
      $stdout.should_receive(:print).with(true)
      Rubik::VM.new 'print(3 < 5)'
    end

    it 'variables' do
      $stdout.should_receive(:print).with(false)
      program = <<-EOF
begin
  int a, b;
  a = 10, b = 15;
  print(a == b);
end
EOF
      Rubik::VM.new program
    end
  end

  describe 'performs input/output operations' do
    it 'prints expressions' do
      $stdout.should_receive(:print).with('Hello world')
      Rubik::VM.new 'print("Hello world");'
    end

    it 'takes input' do
      $stdin.should_receive(:gets).and_return('Hello')
      Rubik::VM.new 'gets()'
    end
  end

  describe 'performs functions operations' do
    it 'with single function' do
      $stdout.should_receive(:print).with(8)
      program = <<-EOF
def int foo(int a, int b) {
  return a * b;
}

begin
  print(foo(2,4));
end
EOF
      Rubik::VM.new program
    end

    describe 'with multiple functions' do
      it 'one call' do
        $stdout.should_receive(:print).with(8)
        program = <<-EOF
def int foo(int a, int b) {
  return a * b;
}

def int bar(int a, int b) {
  return a * b;
}

begin
  print(foo(2,4));
end
EOF
        Rubik::VM.new program
      end

      it 'multiple calls' do
        $stdout.should_receive(:print).with(9.0)
        program = <<-EOF
def int foo(int a, int b) {
  return a * b;
}

def float bar(float a, float b) {
  return a / b;
}

begin
  print(foo(2,4) + bar(3.0,3.0));
end
EOF
        Rubik::VM.new program
      end


    end
  end

end
