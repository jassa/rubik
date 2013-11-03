require 'spec_helper'

describe Rubik::Parser do

  describe 'variables' do

    context 'when declaring a variable' do
      before do
        @parser = Rubik::Parser.new('int foo')
      end

      it 'adds variable to symbols hash' do
        @parser.block
        symbols = @parser.instance_variable_get('@symbols')

        expect(symbols).to have_key(:foo)
      end

      it 'throws error if variable is already declared' do
        @parser = Rubik::Parser.new("int foo\nint bar\nint foo")

        expect{ @parser.program }.to raise_error(RuntimeError,
          "'foo' has already been declared")
      end

	    context 'on multiple lines' do
	      it 'adds multiple variables to symbols hash' do
	        symbols = Rubik::Parser.new('int foo, bar, baz').tap do |parser|
	          parser.block
	        end.instance_variable_get('@symbols')

	        [:foo, :bar, :baz].each do |var|
	          expect(symbols).to have_key(var)
	        end
	      end

	      it 'throws error if variable is already declared' do
	        parser = Rubik::Parser.new('int foo, bar, foo')
	        expect{ parser.block }.to raise_error(RuntimeError,
	          "'foo' has already been declared")
	      end
	    end
    end

    context 'and assigning value' do
      before do
        @parser = Rubik::Parser.new('int foo = 10')
      end

      it 'adds variable and value to symbols hash' do
        @parser.block
        symbols = @parser.instance_variable_get('@symbols')

        expect(symbols).to have_key(:foo)
        expect(symbols[:foo].to_i).to eq(10)
      end

      it 'throws error if variable is already declared' do
        @parser = Rubik::Parser.new("int foo = 10\nint bar = 100\nint foo = 300")

        expect{ @parser.program }.to raise_error(RuntimeError,
          "'foo' has already been declared")
      end

	    context 'on multiple lines' do
	      it 'adds multiple variables and values to symbols hash' do
	        symbols = Rubik::Parser.new('int foo = 9, bar = 2, baz = 3').tap do |parser|
	          parser.block
	        end.instance_variable_get('@symbols')

	        {:foo => 9, :bar => 2, :baz => 3}.each do |k, v|
	          expect(symbols).to have_key(k)
            expect(symbols[k].to_i).to eq(v)
	        end
	      end

	      it 'throws error if variable is already declared' do
	        parser = Rubik::Parser.new('int foo = 10, bar = 5, foo = 1')
	        expect{ parser.block }.to raise_error(RuntimeError,
	          "'foo' has already been declared")
	      end
	    end
    end
  end

end
