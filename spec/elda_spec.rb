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

  pending 'calculates the fibonacci sequence'

  it 'calculates the factorial of a given number' do
    $stdout.should_receive(:print).with(120)
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
  print(factorial(5));
end
EOF
    Rubik::VM.new program
  end

end
