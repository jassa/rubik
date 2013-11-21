require 'spec_helper'

describe Rubik::VM do

  describe 'times statement' do
    it 'runs block n times' do
      $stdout.should_receive(:print).with(5)
      program = <<-EOF
begin
  int a;
  a = 0;
  do 5 times {
    a = a + 1;
  }
  print(a);
end
EOF
      Rubik::VM.new program
    end

    it 'nests code block within multiple times statements' do
      $stdout.should_receive(:print).with(45)
      program = <<-EOF
begin
  int a;
  a = 0;
  do 3 times {
    do 5 times {
      do 3 times {
        a = a + 1;
      }
    }
  }
  print(a);
end
EOF
      Rubik::VM.new program
    end
  end

  describe 'if statement' do
    it 'if-then condition' do
      $stdout.should_receive(:print).with(9)
      program = <<-EOF
begin
  if (5 > 4) print(9);
end
EOF
      Rubik::VM.new program
    end

    it 'if-then-else condition evaluates to true' do
      $stdout.should_receive(:print).with(true)
      program = <<-EOF
begin
  if (5 > 4) {
    print(true);
  } else {
    print("this won't run");
  }
end
EOF
      Rubik::VM.new program
    end

    it 'if-then-else condition evaluates to false' do
      $stdout.should_receive(:print).with("this will run")
      program = <<-EOF
begin
  if (5 < 4) {
    print(true);
  } else {
    print("this will run");
  }
end
EOF
      Rubik::VM.new program
    end

    it 'nests if-conditions' do
      $stdout.should_receive(:print).with(9)
      program = <<-EOF
begin
  if (false) {
    print("this won't run");
  } else {
    if (true) {
      print(9);
    } else {
      print("you shouldn't be here");
    }
  }
end
EOF
      Rubik::VM.new program
    end
  end

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
      $stdout.should_receive(:print).with(96)
      program = <<-EOF
def int foo(int a, int b, int c, int d) {
  c = c + 100;
  return c - (a + b + d);
}

begin
  print(foo(1,2,3,4));
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

    pending 'recursively' do
      $stdout.should_receive(:print).with(120)
      program = <<-EOF
def int factorial(int a) {
  if (a == 1) return 1;
  else return a * factorial(a - 1);
}

begin
  print(factorial(5));
end
EOF
      Rubik::VM.new program
    end
  end

end
