require 'spec_helper'

describe Rubik::VM do

  it 'calculates the factorial of a given number' do
    program = <<-EOF
def int factorial(int a) {
  int sum, cont;
  sum = 1; cont = a;

  do a times {
    sum = sum * cont;
    cont = cont - 1;
  }

  return sum;
}

begin
  print(factorial(8));
end
EOF
    Rubik::VM.new program
  end

  it 'calculates the fibonacci of a given number' do
    program = <<-EOF
def int fibo(int a) {
  int i, j, cur, k;

  i = 0;
  j = 1;
  cur = 1;

  do a times{
    k = i;
    i = j;
    j = k + i;
    cur = cur + 1;
  }

  return i;
}

begin
  print(fibo(20));
end
EOF
    Rubik::VM.new program
  end
end
