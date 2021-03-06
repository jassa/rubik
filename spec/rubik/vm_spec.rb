require 'spec_helper'

describe Rubik::VM do

  it 'declares variables' do
    [1, 5.0, "hello", false].each do |expected_result|
      $stdout.should_receive(:print).with(expected_result)
    end

    program = <<-EOF
begin
  int i; float f; string s; boolean b;
  i = 1; f = 5.0; s = "hello"; b = false;

  print(i . f . s . b);
end
EOF
    Rubik::VM.new program
  end

  describe 'arrays' do
    it 'declares array' do
      $stdout.should_receive(:print).with(10)
      program = <<-EOF
begin
  int a[5];
  a[1] = 10;
  print(a[1]);
end
EOF
      Rubik::VM.new program
    end

    it 'assigns array value' do
      $stdout.should_receive(:print).with(45)
      program = <<-EOF
begin
  int a[3];
  int j;
  j = 2;
  a[j] = 45;
  print(a[2]);
end
EOF
      Rubik::VM.new program
    end

    it 'assigns array as array value' do
      $stdout.should_receive(:print).with(35)
      program = <<-EOF
begin
  int a[3];

  a[1] = 30;
  a[2] = a[1] + 5;

  print(a[2]);
end
EOF
      Rubik::VM.new program
    end

    it 'uses expressions as index' do
      $stdout.should_receive(:print).with(30)
      program = <<-EOF
begin
  int a[3];
  int b;

  b = 2;

  a[b-1] = 30;

  print(a[1]);
end
EOF
      Rubik::VM.new program
    end

    it 'uses arrays as index' do
      $stdout.should_receive(:print).with(30)
      program = <<-EOF
begin
  int a[3];
  int b[3];

  b[2] = 2;
  a[b[2]] = 30;

  print(a[2]);
end
EOF
      Rubik::VM.new program
    end
  end

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

    it 'calculates factorial of a given number' do
      $stdout.should_receive(:print).with(120)
      program = <<-EOF
def int factorial(int a) {
  int sum, cont;
  sum = 1;
  cont = a;

  do a times {
    sum = sum * cont;
    cont = cont - 1;
  }

  return sum;
}

begin
  print(factorial(5));
end
EOF
      Rubik::VM.new program
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
