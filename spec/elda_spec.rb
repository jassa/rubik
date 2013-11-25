require 'spec_helper'

describe Rubik::VM do

  pending 'calculates the fibonacci sequence'

  it 'calculates the factorial of a given number' do
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

end
