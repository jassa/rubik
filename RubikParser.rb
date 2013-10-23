#!/usr/bin/env ruby
#
# Rubik.g
# --
# Generated using ANTLR version: 3.5
# Ruby runtime library version: 1.10.0
# Input grammar file: Rubik.g
# Generated at: 2013-10-23 12:11:41
#

# ~~~> start load path setup
this_directory = File.expand_path( File.dirname( __FILE__ ) )
$LOAD_PATH.unshift( this_directory ) unless $LOAD_PATH.include?( this_directory )

antlr_load_failed = proc do
  load_path = $LOAD_PATH.map { |dir| '  - ' << dir }.join( $/ )
  raise LoadError, <<-END.strip!

Failed to load the ANTLR3 runtime library (version 1.10.0):

Ensure the library has been installed on your system and is available
on the load path. If rubygems is available on your system, this can
be done with the command:

  gem install antlr3

Current load path:
#{ load_path }

  END
end

defined?( ANTLR3 ) or begin

  # 1: try to load the ruby antlr3 runtime library from the system path
  require 'antlr3'

rescue LoadError

  # 2: try to load rubygems if it isn't already loaded
  defined?( Gem ) or begin
    require 'rubygems'
  rescue LoadError
    antlr_load_failed.call
  end

  # 3: try to activate the antlr3 gem
  begin
    defined?( gem ) and gem( 'antlr3', '~> 1.10.0' )
  rescue Gem::LoadError
    antlr_load_failed.call
  end

  require 'antlr3'

end
# <~~~ end load path setup

module Rubik
  # TokenData defines all of the token type integer values
  # as constants, which will be included in all
  # ANTLR-generated recognizers.
  const_defined?( :TokenData ) or TokenData = ANTLR3::TokenScheme.new

  module TokenData

    # define the token constants
    define_tokens( :EOF => -1, :T__60 => 60, :T__61 => 61, :AND => 4, :ASGN => 5, 
                   :BLOCK => 6, :BOOLEAN => 7, :BREAK => 8, :CHANGE_COLOR => 9, 
                   :CHANGE_DIR => 10, :CHAR => 11, :COLOR => 12, :COMMA => 13, 
                   :DEF => 14, :DIR => 15, :DIV => 16, :DO => 17, :DOT => 18, 
                   :DRAW_CIRCLE => 19, :DRAW_SQUARE => 20, :DRAW_TRIANGLE => 21, 
                   :ELSE => 22, :EQ => 23, :FLOAT => 24, :GEQ => 25, :GREATER => 26, 
                   :ID => 27, :IF => 28, :INT => 29, :LBRACE => 30, :LBRAK => 31, 
                   :LEQ => 32, :LESS => 33, :LPAREN => 34, :MINUS => 35, 
                   :NEG => 36, :NEQ => 37, :NEWLINE => 38, :NULL => 39, 
                   :OR => 40, :PEN_DOWN => 41, :PEN_UP => 42, :PLUS => 43, 
                   :RBRACE => 44, :RBRAK => 45, :RPAREN => 46, :R_BEGIN => 47, 
                   :R_END => 48, :R_MOVE => 49, :R_RESET => 50, :R_RETURN => 51, 
                   :SEMI => 52, :STAR => 53, :STRING => 54, :TIMES => 55, 
                   :TLK => 56, :VAR => 57, :VAR_TYPE => 58, :WS => 59 )


    # register the proper human-readable name or literal value
    # for each token type
    #
    # this is necessary because anonymous tokens, which are
    # created from literal values in the grammar, do not
    # have descriptive names
    register_names( "AND", "ASGN", "BLOCK", "BOOLEAN", "BREAK", "CHANGE_COLOR", 
                    "CHANGE_DIR", "CHAR", "COLOR", "COMMA", "DEF", "DIR", 
                    "DIV", "DO", "DOT", "DRAW_CIRCLE", "DRAW_SQUARE", "DRAW_TRIANGLE", 
                    "ELSE", "EQ", "FLOAT", "GEQ", "GREATER", "ID", "IF", 
                    "INT", "LBRACE", "LBRAK", "LEQ", "LESS", "LPAREN", "MINUS", 
                    "NEG", "NEQ", "NEWLINE", "NULL", "OR", "PEN_DOWN", "PEN_UP", 
                    "PLUS", "RBRACE", "RBRAK", "RPAREN", "R_BEGIN", "R_END", 
                    "R_MOVE", "R_RESET", "R_RETURN", "SEMI", "STAR", "STRING", 
                    "TIMES", "TLK", "VAR", "VAR_TYPE", "WS", "'change_direction'", 
                    "'print'" )


  end


  class Parser < ANTLR3::Parser
    @grammar_home = Rubik
    include ANTLR3::ASTBuilder

    RULE_METHODS = [ :program, :block, :statement_block, :statement, :statement_end, 
                     :return_statement, :variable_statement, :variable_declaration_list, 
                     :variable_declaration, :declaration_target, :assignment_statement, 
                     :condition_statement, :expression, :relation_op, :exp, 
                     :term, :factor, :expression_list, :write_statement, 
                     :write_expression, :loop_statement, :function, :function_parameters, 
                     :parameters, :robot, :variable_name, :primary, :synpred1_Rubik ].freeze

    @@block = Scope("symbols" )

    include TokenData

    begin
      generated_using( "Rubik.g", "3.5", "1.10.0" )
    rescue NoMethodError => error
      # ignore
    end

    def initialize( input, options = {} )
      super( input, options )
    @block_stack = []

    end
    # - - - - - - - - - - - - Rules - - - - - - - - - - - - -
    ProgramReturnValue = define_return_scope

    #
    # parser rule program
    #
    # (in Rubik.g)
    # 60:1: program : 'begin' ( block )+ 'end' ;
    #
    def program
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 1 )


      return_value = ProgramReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal1 = nil
      string_literal3 = nil
      block2 = nil


      tree_for_string_literal1 = nil
      tree_for_string_literal3 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 61:7: 'begin' ( block )+ 'end'
      string_literal1 = match( R_BEGIN, TOKENS_FOLLOWING_R_BEGIN_IN_program_469 )
      if @state.backtracking == 0
        tree_for_string_literal1 = @adaptor.create_with_payload( string_literal1 )
        @adaptor.add_child( root_0, tree_for_string_literal1 )

      end

      # at file 61:15: ( block )+
      match_count_1 = 0
      while true
        alt_1 = 2
        look_1_0 = @input.peek( 1 )

        if ( look_1_0 == DEF || look_1_0 == DO || look_1_0.between?( ID, IF ) || look_1_0 == LBRACE || look_1_0 == R_RETURN || look_1_0 == VAR_TYPE || look_1_0 == T__61 )
          alt_1 = 1

        end
        case alt_1
        when 1
          # at line 61:15: block
          @state.following.push( TOKENS_FOLLOWING_block_IN_program_471 )
          block2 = block
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, block2.tree )
          end


        else
          match_count_1 > 0 and break
          @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )


          eee = EarlyExit(1)


          raise eee
        end
        match_count_1 += 1
      end


      string_literal3 = match( R_END, TOKENS_FOLLOWING_R_END_IN_program_474 )
      if @state.backtracking == 0
        tree_for_string_literal3 = @adaptor.create_with_payload( string_literal3 )
        @adaptor.add_child( root_0, tree_for_string_literal3 )

      end


      # - - - - - - - rule clean up - - - - - - - -
      return_value.stop = @input.look( -1 )


      if @state.backtracking == 0
        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      end

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )


      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 1 )


      end

      return return_value
    end

    BlockReturnValue = define_return_scope

    #
    # parser rule block
    #
    # (in Rubik.g)
    # 64:1: block : ( statement | statement_block );
    #
    def block
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 2 )


      @block_stack.push( @@block.new )

      return_value = BlockReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      statement4 = nil
      statement_block5 = nil



      # - - - - @init action - - - -

          @block_stack.last.symbols =  Hash.new



      begin
      # at line 71:5: ( statement | statement_block )
      alt_2 = 2
      look_2_0 = @input.peek( 1 )

      if ( look_2_0 == DEF || look_2_0 == DO || look_2_0.between?( ID, IF ) || look_2_0 == R_RETURN || look_2_0 == VAR_TYPE || look_2_0 == T__61 )
        alt_2 = 1
      elsif ( look_2_0 == LBRACE )
        alt_2 = 2
      else
        @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )



        raise NoViableAlternative( "", 2, 0 )

      end
      case alt_2
      when 1
        root_0 = @adaptor.create_flat_list


        # at line 71:7: statement
        @state.following.push( TOKENS_FOLLOWING_statement_IN_block_500 )
        statement4 = statement
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, statement4.tree )
        end


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 72:7: statement_block
        @state.following.push( TOKENS_FOLLOWING_statement_block_IN_block_508 )
        statement_block5 = statement_block
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, statement_block5.tree )
        end


      end
      # - - - - - - - rule clean up - - - - - - - -
      return_value.stop = @input.look( -1 )


      if @state.backtracking == 0
        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      end

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )


      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 2 )

      @block_stack.pop

      end

      return return_value
    end

    StatementBlockReturnValue = define_return_scope

    #
    # parser rule statement_block
    #
    # (in Rubik.g)
    # 75:1: statement_block : '{' ( statement )* '}' ;
    #
    def statement_block
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 3 )


      return_value = StatementBlockReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal6 = nil
      char_literal8 = nil
      statement7 = nil


      tree_for_char_literal6 = nil
      tree_for_char_literal8 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 76:7: '{' ( statement )* '}'
      char_literal6 = match( LBRACE, TOKENS_FOLLOWING_LBRACE_IN_statement_block_525 )
      if @state.backtracking == 0
        tree_for_char_literal6 = @adaptor.create_with_payload( char_literal6 )
        @adaptor.add_child( root_0, tree_for_char_literal6 )

      end

      # at line 76:11: ( statement )*
      while true # decision 3
        alt_3 = 2
        look_3_0 = @input.peek( 1 )

        if ( look_3_0 == DEF || look_3_0 == DO || look_3_0.between?( ID, IF ) || look_3_0 == R_RETURN || look_3_0 == VAR_TYPE || look_3_0 == T__61 )
          alt_3 = 1

        end
        case alt_3
        when 1
          # at line 76:11: statement
          @state.following.push( TOKENS_FOLLOWING_statement_IN_statement_block_527 )
          statement7 = statement
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, statement7.tree )
          end


        else
          break # out of loop for decision 3
        end
      end # loop for decision 3

      char_literal8 = match( RBRACE, TOKENS_FOLLOWING_RBRACE_IN_statement_block_530 )
      if @state.backtracking == 0
        tree_for_char_literal8 = @adaptor.create_with_payload( char_literal8 )
        @adaptor.add_child( root_0, tree_for_char_literal8 )

      end


      # - - - - - - - rule clean up - - - - - - - -
      return_value.stop = @input.look( -1 )


      if @state.backtracking == 0
        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      end

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )


      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 3 )


      end

      return return_value
    end

    StatementReturnValue = define_return_scope

    #
    # parser rule statement
    #
    # (in Rubik.g)
    # 81:1: statement : ( variable_statement | assignment_statement | condition_statement | write_statement | loop_statement | return_statement | function );
    #
    def statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 4 )


      return_value = StatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      variable_statement9 = nil
      assignment_statement10 = nil
      condition_statement11 = nil
      write_statement12 = nil
      loop_statement13 = nil
      return_statement14 = nil
      function15 = nil



      begin
      # at line 82:5: ( variable_statement | assignment_statement | condition_statement | write_statement | loop_statement | return_statement | function )
      alt_4 = 7
      case look_4 = @input.peek( 1 )
      when VAR_TYPE then alt_4 = 1
      when ID then alt_4 = 2
      when IF then alt_4 = 3
      when T__61 then alt_4 = 4
      when DO then alt_4 = 5
      when R_RETURN then alt_4 = 6
      when DEF then alt_4 = 7
      else
        @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )



        raise NoViableAlternative( "", 4, 0 )

      end
      case alt_4
      when 1
        root_0 = @adaptor.create_flat_list


        # at line 82:7: variable_statement
        @state.following.push( TOKENS_FOLLOWING_variable_statement_IN_statement_549 )
        variable_statement9 = variable_statement
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, variable_statement9.tree )
        end


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 83:7: assignment_statement
        @state.following.push( TOKENS_FOLLOWING_assignment_statement_IN_statement_557 )
        assignment_statement10 = assignment_statement
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, assignment_statement10.tree )
        end


      when 3
        root_0 = @adaptor.create_flat_list


        # at line 84:7: condition_statement
        @state.following.push( TOKENS_FOLLOWING_condition_statement_IN_statement_565 )
        condition_statement11 = condition_statement
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, condition_statement11.tree )
        end


      when 4
        root_0 = @adaptor.create_flat_list


        # at line 85:7: write_statement
        @state.following.push( TOKENS_FOLLOWING_write_statement_IN_statement_573 )
        write_statement12 = write_statement
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, write_statement12.tree )
        end


      when 5
        root_0 = @adaptor.create_flat_list


        # at line 86:7: loop_statement
        @state.following.push( TOKENS_FOLLOWING_loop_statement_IN_statement_581 )
        loop_statement13 = loop_statement
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, loop_statement13.tree )
        end


      when 6
        root_0 = @adaptor.create_flat_list


        # at line 87:7: return_statement
        @state.following.push( TOKENS_FOLLOWING_return_statement_IN_statement_589 )
        return_statement14 = return_statement
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, return_statement14.tree )
        end


      when 7
        root_0 = @adaptor.create_flat_list


        # at line 88:7: function
        @state.following.push( TOKENS_FOLLOWING_function_IN_statement_597 )
        function15 = function
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, function15.tree )
        end


      end
      # - - - - - - - rule clean up - - - - - - - -
      return_value.stop = @input.look( -1 )


      if @state.backtracking == 0
        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      end

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )


      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 4 )


      end

      return return_value
    end

    StatementEndReturnValue = define_return_scope

    #
    # parser rule statement_end
    #
    # (in Rubik.g)
    # 91:1: statement_end : ( ';' | ( '}' )=>| EOF );
    #
    def statement_end
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 5 )


      return_value = StatementEndReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal16 = nil
      __EOF17__ = nil


      tree_for_char_literal16 = nil
      tree_for_EOF17 = nil

      begin
      # at line 92:5: ( ';' | ( '}' )=>| EOF )
      alt_5 = 3
      look_5_0 = @input.peek( 1 )

      if ( look_5_0 == SEMI )
        alt_5 = 1
      elsif ( look_5_0 == R_END ) and ( syntactic_predicate?( :synpred1_Rubik ) )
        alt_5 = 2
      elsif ( look_5_0 == VAR_TYPE ) and ( syntactic_predicate?( :synpred1_Rubik ) )
        alt_5 = 2
      elsif ( look_5_0 == ID ) and ( syntactic_predicate?( :synpred1_Rubik ) )
        alt_5 = 2
      elsif ( look_5_0 == IF ) and ( syntactic_predicate?( :synpred1_Rubik ) )
        alt_5 = 2
      elsif ( look_5_0 == T__61 ) and ( syntactic_predicate?( :synpred1_Rubik ) )
        alt_5 = 2
      elsif ( look_5_0 == DO ) and ( syntactic_predicate?( :synpred1_Rubik ) )
        alt_5 = 2
      elsif ( look_5_0 == R_RETURN ) and ( syntactic_predicate?( :synpred1_Rubik ) )
        alt_5 = 2
      elsif ( look_5_0 == DEF ) and ( syntactic_predicate?( :synpred1_Rubik ) )
        alt_5 = 2
      elsif ( look_5_0 == LBRACE ) and ( syntactic_predicate?( :synpred1_Rubik ) )
        alt_5 = 2
      elsif ( look_5_0 == ELSE ) and ( syntactic_predicate?( :synpred1_Rubik ) )
        alt_5 = 2
      elsif ( look_5_0 == RBRACE ) and ( syntactic_predicate?( :synpred1_Rubik ) )
        alt_5 = 2
      elsif ( look_5_0 == EOF )
        alt_5 = 3
      else
        @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )



        raise NoViableAlternative( "", 5, 0 )

      end
      case alt_5
      when 1
        root_0 = @adaptor.create_flat_list


        # at line 92:7: ';'
        char_literal16 = match( SEMI, TOKENS_FOLLOWING_SEMI_IN_statement_end_614 )
        if @state.backtracking == 0
          tree_for_char_literal16 = @adaptor.create_with_payload( char_literal16 )
          @adaptor.add_child( root_0, tree_for_char_literal16 )

        end


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 93:7: ( '}' )=>

      when 3
        root_0 = @adaptor.create_flat_list


        # at line 94:7: EOF
        __EOF17__ = match( EOF, TOKENS_FOLLOWING_EOF_IN_statement_end_635 )
        if @state.backtracking == 0
          tree_for_EOF17 = @adaptor.create_with_payload( __EOF17__ )
          @adaptor.add_child( root_0, tree_for_EOF17 )

        end


      end
      # - - - - - - - rule clean up - - - - - - - -
      return_value.stop = @input.look( -1 )


      if @state.backtracking == 0
        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      end

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )


      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 5 )


      end

      return return_value
    end

    ReturnStatementReturnValue = define_return_scope

    #
    # parser rule return_statement
    #
    # (in Rubik.g)
    # 97:1: return_statement : 'return' expression statement_end !;
    #
    def return_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 6 )


      return_value = ReturnStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal18 = nil
      expression19 = nil
      statement_end20 = nil


      tree_for_string_literal18 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 98:7: 'return' expression statement_end !
      string_literal18 = match( R_RETURN, TOKENS_FOLLOWING_R_RETURN_IN_return_statement_652 )
      if @state.backtracking == 0
        tree_for_string_literal18 = @adaptor.create_with_payload( string_literal18 )
        @adaptor.add_child( root_0, tree_for_string_literal18 )

      end

      @state.following.push( TOKENS_FOLLOWING_expression_IN_return_statement_654 )
      expression19 = expression
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, expression19.tree )
      end

      @state.following.push( TOKENS_FOLLOWING_statement_end_IN_return_statement_656 )
      statement_end20 = statement_end
      @state.following.pop

      # - - - - - - - rule clean up - - - - - - - -
      return_value.stop = @input.look( -1 )


      if @state.backtracking == 0
        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      end

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )


      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 6 )


      end

      return return_value
    end

    VariableStatementReturnValue = define_return_scope

    #
    # parser rule variable_statement
    #
    # (in Rubik.g)
    # 101:1: variable_statement : VAR_TYPE variable_declaration_list statement_end !;
    #
    def variable_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 7 )


      return_value = VariableStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __VAR_TYPE21__ = nil
      variable_declaration_list22 = nil
      statement_end23 = nil


      tree_for_VAR_TYPE21 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 102:7: VAR_TYPE variable_declaration_list statement_end !
      __VAR_TYPE21__ = match( VAR_TYPE, TOKENS_FOLLOWING_VAR_TYPE_IN_variable_statement_674 )
      if @state.backtracking == 0
        tree_for_VAR_TYPE21 = @adaptor.create_with_payload( __VAR_TYPE21__ )
        @adaptor.add_child( root_0, tree_for_VAR_TYPE21 )

      end

      @state.following.push( TOKENS_FOLLOWING_variable_declaration_list_IN_variable_statement_676 )
      variable_declaration_list22 = variable_declaration_list
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, variable_declaration_list22.tree )
      end

      @state.following.push( TOKENS_FOLLOWING_statement_end_IN_variable_statement_678 )
      statement_end23 = statement_end
      @state.following.pop

      # - - - - - - - rule clean up - - - - - - - -
      return_value.stop = @input.look( -1 )


      if @state.backtracking == 0
        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      end

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )


      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 7 )


      end

      return return_value
    end

    VariableDeclarationListReturnValue = define_return_scope

    #
    # parser rule variable_declaration_list
    #
    # (in Rubik.g)
    # 105:1: variable_declaration_list : variable_declaration ( ',' variable_declaration )* ;
    #
    def variable_declaration_list
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 8 )


      return_value = VariableDeclarationListReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal25 = nil
      variable_declaration24 = nil
      variable_declaration26 = nil


      tree_for_char_literal25 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 106:7: variable_declaration ( ',' variable_declaration )*
      @state.following.push( TOKENS_FOLLOWING_variable_declaration_IN_variable_declaration_list_696 )
      variable_declaration24 = variable_declaration
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, variable_declaration24.tree )
      end

      # at line 106:28: ( ',' variable_declaration )*
      while true # decision 6
        alt_6 = 2
        look_6_0 = @input.peek( 1 )

        if ( look_6_0 == COMMA )
          alt_6 = 1

        end
        case alt_6
        when 1
          # at line 106:29: ',' variable_declaration
          char_literal25 = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_variable_declaration_list_699 )
          if @state.backtracking == 0
            tree_for_char_literal25 = @adaptor.create_with_payload( char_literal25 )
            @adaptor.add_child( root_0, tree_for_char_literal25 )

          end

          @state.following.push( TOKENS_FOLLOWING_variable_declaration_IN_variable_declaration_list_701 )
          variable_declaration26 = variable_declaration
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, variable_declaration26.tree )
          end


        else
          break # out of loop for decision 6
        end
      end # loop for decision 6


      # - - - - - - - rule clean up - - - - - - - -
      return_value.stop = @input.look( -1 )


      if @state.backtracking == 0
        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      end

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )


      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 8 )


      end

      return return_value
    end

    VariableDeclarationReturnValue = define_return_scope

    #
    # parser rule variable_declaration
    #
    # (in Rubik.g)
    # 109:1: variable_declaration : declaration_target ( '=' expression )? ;
    #
    def variable_declaration
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 9 )


      return_value = VariableDeclarationReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal28 = nil
      declaration_target27 = nil
      expression29 = nil


      tree_for_char_literal28 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 110:7: declaration_target ( '=' expression )?
      @state.following.push( TOKENS_FOLLOWING_declaration_target_IN_variable_declaration_720 )
      declaration_target27 = declaration_target
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, declaration_target27.tree )
      end

      # at line 110:26: ( '=' expression )?
      alt_7 = 2
      look_7_0 = @input.peek( 1 )

      if ( look_7_0 == ASGN )
        alt_7 = 1
      end
      case alt_7
      when 1
        # at line 110:27: '=' expression
        char_literal28 = match( ASGN, TOKENS_FOLLOWING_ASGN_IN_variable_declaration_723 )
        if @state.backtracking == 0
          tree_for_char_literal28 = @adaptor.create_with_payload( char_literal28 )
          @adaptor.add_child( root_0, tree_for_char_literal28 )

        end

        @state.following.push( TOKENS_FOLLOWING_expression_IN_variable_declaration_725 )
        expression29 = expression
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression29.tree )
        end


      end

      # - - - - - - - rule clean up - - - - - - - -
      return_value.stop = @input.look( -1 )


      if @state.backtracking == 0
        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      end

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )


      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 9 )


      end

      return return_value
    end

    DeclarationTargetReturnValue = define_return_scope

    #
    # parser rule declaration_target
    #
    # (in Rubik.g)
    # 113:1: declaration_target : variable_name ( '[' INT ']' )? ( '[' INT ']' )? ;
    #
    def declaration_target
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 10 )


      return_value = DeclarationTargetReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal31 = nil
      __INT32__ = nil
      char_literal33 = nil
      char_literal34 = nil
      __INT35__ = nil
      char_literal36 = nil
      variable_name30 = nil


      tree_for_char_literal31 = nil
      tree_for_INT32 = nil
      tree_for_char_literal33 = nil
      tree_for_char_literal34 = nil
      tree_for_INT35 = nil
      tree_for_char_literal36 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 114:7: variable_name ( '[' INT ']' )? ( '[' INT ']' )?
      @state.following.push( TOKENS_FOLLOWING_variable_name_IN_declaration_target_744 )
      variable_name30 = variable_name
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, variable_name30.tree )
      end

      # at line 114:21: ( '[' INT ']' )?
      alt_8 = 2
      look_8_0 = @input.peek( 1 )

      if ( look_8_0 == LBRAK )
        look_8_1 = @input.peek( 2 )

        if ( look_8_1 == INT )
          look_8_3 = @input.peek( 3 )

          if ( look_8_3 == RBRAK )
            alt_8 = 1
          end
        end
      end
      case alt_8
      when 1
        # at line 114:22: '[' INT ']'
        char_literal31 = match( LBRAK, TOKENS_FOLLOWING_LBRAK_IN_declaration_target_747 )
        if @state.backtracking == 0
          tree_for_char_literal31 = @adaptor.create_with_payload( char_literal31 )
          @adaptor.add_child( root_0, tree_for_char_literal31 )

        end

        __INT32__ = match( INT, TOKENS_FOLLOWING_INT_IN_declaration_target_749 )
        if @state.backtracking == 0
          tree_for_INT32 = @adaptor.create_with_payload( __INT32__ )
          @adaptor.add_child( root_0, tree_for_INT32 )

        end

        char_literal33 = match( RBRAK, TOKENS_FOLLOWING_RBRAK_IN_declaration_target_751 )
        if @state.backtracking == 0
          tree_for_char_literal33 = @adaptor.create_with_payload( char_literal33 )
          @adaptor.add_child( root_0, tree_for_char_literal33 )

        end


      end
      # at line 114:36: ( '[' INT ']' )?
      alt_9 = 2
      look_9_0 = @input.peek( 1 )

      if ( look_9_0 == LBRAK )
        alt_9 = 1
      end
      case alt_9
      when 1
        # at line 114:37: '[' INT ']'
        char_literal34 = match( LBRAK, TOKENS_FOLLOWING_LBRAK_IN_declaration_target_756 )
        if @state.backtracking == 0
          tree_for_char_literal34 = @adaptor.create_with_payload( char_literal34 )
          @adaptor.add_child( root_0, tree_for_char_literal34 )

        end

        __INT35__ = match( INT, TOKENS_FOLLOWING_INT_IN_declaration_target_758 )
        if @state.backtracking == 0
          tree_for_INT35 = @adaptor.create_with_payload( __INT35__ )
          @adaptor.add_child( root_0, tree_for_INT35 )

        end

        char_literal36 = match( RBRAK, TOKENS_FOLLOWING_RBRAK_IN_declaration_target_760 )
        if @state.backtracking == 0
          tree_for_char_literal36 = @adaptor.create_with_payload( char_literal36 )
          @adaptor.add_child( root_0, tree_for_char_literal36 )

        end


      end

      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action

                    if @block_stack.last.symbols.has_key?(var = String(( variable_name30 && @input.to_s( variable_name30.start, variable_name30.stop ) )).to_sym)
                      raise "'#{var}' has already been declared"
                    else
                      @block_stack.last.symbols[var] = 1
                      # change '1' for var type
                    end
                
        # <-- action
      end


      # - - - - - - - rule clean up - - - - - - - -
      return_value.stop = @input.look( -1 )


      if @state.backtracking == 0
        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      end

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )


      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 10 )


      end

      return return_value
    end

    AssignmentStatementReturnValue = define_return_scope

    #
    # parser rule assignment_statement
    #
    # (in Rubik.g)
    # 125:1: assignment_statement : ID '=' expression statement_end !;
    #
    def assignment_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 11 )


      return_value = AssignmentStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __ID37__ = nil
      char_literal38 = nil
      expression39 = nil
      statement_end40 = nil


      tree_for_ID37 = nil
      tree_for_char_literal38 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 126:7: ID '=' expression statement_end !
      __ID37__ = match( ID, TOKENS_FOLLOWING_ID_IN_assignment_statement_789 )
      if @state.backtracking == 0
        tree_for_ID37 = @adaptor.create_with_payload( __ID37__ )
        @adaptor.add_child( root_0, tree_for_ID37 )

      end

      char_literal38 = match( ASGN, TOKENS_FOLLOWING_ASGN_IN_assignment_statement_791 )
      if @state.backtracking == 0
        tree_for_char_literal38 = @adaptor.create_with_payload( char_literal38 )
        @adaptor.add_child( root_0, tree_for_char_literal38 )

      end

      @state.following.push( TOKENS_FOLLOWING_expression_IN_assignment_statement_793 )
      expression39 = expression
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, expression39.tree )
      end

      @state.following.push( TOKENS_FOLLOWING_statement_end_IN_assignment_statement_795 )
      statement_end40 = statement_end
      @state.following.pop

      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action

                    @block_stack.last.symbols.has_key?(var = String(__ID37__.text).to_sym) or
                        raise "'#{var}' has not been declared"
                    # check type of @block_stack.last.symbols[var] against VAR_TYPES
                
        # <-- action
      end


      # - - - - - - - rule clean up - - - - - - - -
      return_value.stop = @input.look( -1 )


      if @state.backtracking == 0
        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      end

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )


      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 11 )


      end

      return return_value
    end

    ConditionStatementReturnValue = define_return_scope

    #
    # parser rule condition_statement
    #
    # (in Rubik.g)
    # 134:1: condition_statement : 'if' '(' expression ')' block ( 'else' block )? ;
    #
    def condition_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 12 )


      return_value = ConditionStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal41 = nil
      char_literal42 = nil
      char_literal44 = nil
      string_literal46 = nil
      expression43 = nil
      block45 = nil
      block47 = nil


      tree_for_string_literal41 = nil
      tree_for_char_literal42 = nil
      tree_for_char_literal44 = nil
      tree_for_string_literal46 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 135:7: 'if' '(' expression ')' block ( 'else' block )?
      string_literal41 = match( IF, TOKENS_FOLLOWING_IF_IN_condition_statement_823 )
      if @state.backtracking == 0
        tree_for_string_literal41 = @adaptor.create_with_payload( string_literal41 )
        @adaptor.add_child( root_0, tree_for_string_literal41 )

      end

      char_literal42 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_condition_statement_825 )
      if @state.backtracking == 0
        tree_for_char_literal42 = @adaptor.create_with_payload( char_literal42 )
        @adaptor.add_child( root_0, tree_for_char_literal42 )

      end

      @state.following.push( TOKENS_FOLLOWING_expression_IN_condition_statement_827 )
      expression43 = expression
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, expression43.tree )
      end

      char_literal44 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_condition_statement_829 )
      if @state.backtracking == 0
        tree_for_char_literal44 = @adaptor.create_with_payload( char_literal44 )
        @adaptor.add_child( root_0, tree_for_char_literal44 )

      end

      @state.following.push( TOKENS_FOLLOWING_block_IN_condition_statement_831 )
      block45 = block
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, block45.tree )
      end

      # at line 135:37: ( 'else' block )?
      alt_10 = 2
      look_10_0 = @input.peek( 1 )

      if ( look_10_0 == ELSE )
        alt_10 = 1
      end
      case alt_10
      when 1
        # at line 135:38: 'else' block
        string_literal46 = match( ELSE, TOKENS_FOLLOWING_ELSE_IN_condition_statement_834 )
        if @state.backtracking == 0
          tree_for_string_literal46 = @adaptor.create_with_payload( string_literal46 )
          @adaptor.add_child( root_0, tree_for_string_literal46 )

        end

        @state.following.push( TOKENS_FOLLOWING_block_IN_condition_statement_836 )
        block47 = block
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, block47.tree )
        end


      end

      # - - - - - - - rule clean up - - - - - - - -
      return_value.stop = @input.look( -1 )


      if @state.backtracking == 0
        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      end

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )


      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 12 )


      end

      return return_value
    end

    ExpressionReturnValue = define_return_scope

    #
    # parser rule expression
    #
    # (in Rubik.g)
    # 138:1: expression : exp ( relation_op exp )? ;
    #
    def expression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 13 )


      return_value = ExpressionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      exp48 = nil
      relation_op49 = nil
      exp50 = nil



      begin
      root_0 = @adaptor.create_flat_list


      # at line 139:7: exp ( relation_op exp )?
      @state.following.push( TOKENS_FOLLOWING_exp_IN_expression_855 )
      exp48 = exp
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, exp48.tree )
      end

      # at line 139:11: ( relation_op exp )?
      alt_11 = 2
      look_11_0 = @input.peek( 1 )

      if ( look_11_0 == EQ || look_11_0.between?( GEQ, GREATER ) || look_11_0.between?( LEQ, LESS ) || look_11_0 == NEQ )
        alt_11 = 1
      end
      case alt_11
      when 1
        # at line 139:12: relation_op exp
        @state.following.push( TOKENS_FOLLOWING_relation_op_IN_expression_858 )
        relation_op49 = relation_op
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, relation_op49.tree )
        end

        @state.following.push( TOKENS_FOLLOWING_exp_IN_expression_860 )
        exp50 = exp
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, exp50.tree )
        end


      end

      # - - - - - - - rule clean up - - - - - - - -
      return_value.stop = @input.look( -1 )


      if @state.backtracking == 0
        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      end

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )


      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 13 )


      end

      return return_value
    end

    RelationOpReturnValue = define_return_scope

    #
    # parser rule relation_op
    #
    # (in Rubik.g)
    # 142:1: relation_op : ( '<' | '>' | '<=' | '>=' | '==' | '!=' );
    #
    def relation_op
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 14 )


      return_value = RelationOpReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      set51 = nil


      tree_for_set51 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 
      set51 = @input.look

      if @input.peek(1) == EQ || @input.peek( 1 ).between?( GEQ, GREATER ) || @input.peek( 1 ).between?( LEQ, LESS ) || @input.peek(1) == NEQ
        @input.consume
        if @state.backtracking == 0
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set51 ) )
        end

        @state.error_recovery = false

      else
        @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )


        mse = MismatchedSet( nil )
        raise mse

      end



      # - - - - - - - rule clean up - - - - - - - -
      return_value.stop = @input.look( -1 )


      if @state.backtracking == 0
        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      end

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )


      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 14 )


      end

      return return_value
    end

    ExpReturnValue = define_return_scope

    #
    # parser rule exp
    #
    # (in Rubik.g)
    # 151:1: exp : term ( ( '+' | '-' ) exp )? ;
    #
    def exp
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )


      return_value = ExpReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      set53 = nil
      term52 = nil
      exp54 = nil


      tree_for_set53 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 152:7: term ( ( '+' | '-' ) exp )?
      @state.following.push( TOKENS_FOLLOWING_term_IN_exp_936 )
      term52 = term
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, term52.tree )
      end

      # at line 152:12: ( ( '+' | '-' ) exp )?
      alt_12 = 2
      look_12_0 = @input.peek( 1 )

      if ( look_12_0 == MINUS || look_12_0 == PLUS )
        alt_12 = 1
      end
      case alt_12
      when 1
        # at line 152:13: ( '+' | '-' ) exp
        set53 = @input.look

        if @input.peek(1) == MINUS || @input.peek(1) == PLUS
          @input.consume
          if @state.backtracking == 0
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set53 ) )
          end

          @state.error_recovery = false

        else
          @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )


          mse = MismatchedSet( nil )
          raise mse

        end


        @state.following.push( TOKENS_FOLLOWING_exp_IN_exp_945 )
        exp54 = exp
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, exp54.tree )
        end


      end

      # - - - - - - - rule clean up - - - - - - - -
      return_value.stop = @input.look( -1 )


      if @state.backtracking == 0
        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      end

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )


      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 15 )


      end

      return return_value
    end

    TermReturnValue = define_return_scope

    #
    # parser rule term
    #
    # (in Rubik.g)
    # 155:1: term : factor ( ( '*' | '/' ) term )? ;
    #
    def term
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )


      return_value = TermReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      set56 = nil
      factor55 = nil
      term57 = nil


      tree_for_set56 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 156:7: factor ( ( '*' | '/' ) term )?
      @state.following.push( TOKENS_FOLLOWING_factor_IN_term_964 )
      factor55 = factor
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, factor55.tree )
      end

      # at line 156:14: ( ( '*' | '/' ) term )?
      alt_13 = 2
      look_13_0 = @input.peek( 1 )

      if ( look_13_0 == DIV || look_13_0 == STAR )
        alt_13 = 1
      end
      case alt_13
      when 1
        # at line 156:15: ( '*' | '/' ) term
        set56 = @input.look

        if @input.peek(1) == DIV || @input.peek(1) == STAR
          @input.consume
          if @state.backtracking == 0
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set56 ) )
          end

          @state.error_recovery = false

        else
          @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )


          mse = MismatchedSet( nil )
          raise mse

        end


        @state.following.push( TOKENS_FOLLOWING_term_IN_term_973 )
        term57 = term
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, term57.tree )
        end


      end

      # - - - - - - - rule clean up - - - - - - - -
      return_value.stop = @input.look( -1 )


      if @state.backtracking == 0
        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      end

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )


      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 16 )


      end

      return return_value
    end

    FactorReturnValue = define_return_scope

    #
    # parser rule factor
    #
    # (in Rubik.g)
    # 159:1: factor : ( '(' expression ')' | ( '-' )? primary );
    #
    def factor
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )


      return_value = FactorReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal58 = nil
      char_literal60 = nil
      char_literal61 = nil
      expression59 = nil
      primary62 = nil


      tree_for_char_literal58 = nil
      tree_for_char_literal60 = nil
      tree_for_char_literal61 = nil

      begin
      # at line 160:5: ( '(' expression ')' | ( '-' )? primary )
      alt_15 = 2
      look_15_0 = @input.peek( 1 )

      if ( look_15_0 == LPAREN )
        alt_15 = 1
      elsif ( look_15_0 == BOOLEAN || look_15_0 == CHAR || look_15_0 == FLOAT || look_15_0 == ID || look_15_0 == INT || look_15_0 == MINUS )
        alt_15 = 2
      else
        @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )



        raise NoViableAlternative( "", 15, 0 )

      end
      case alt_15
      when 1
        root_0 = @adaptor.create_flat_list


        # at line 160:7: '(' expression ')'
        char_literal58 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_factor_992 )
        if @state.backtracking == 0
          tree_for_char_literal58 = @adaptor.create_with_payload( char_literal58 )
          @adaptor.add_child( root_0, tree_for_char_literal58 )

        end

        @state.following.push( TOKENS_FOLLOWING_expression_IN_factor_994 )
        expression59 = expression
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression59.tree )
        end

        char_literal60 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_factor_996 )
        if @state.backtracking == 0
          tree_for_char_literal60 = @adaptor.create_with_payload( char_literal60 )
          @adaptor.add_child( root_0, tree_for_char_literal60 )

        end


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 161:7: ( '-' )? primary
        # at line 161:7: ( '-' )?
        alt_14 = 2
        look_14_0 = @input.peek( 1 )

        if ( look_14_0 == MINUS )
          alt_14 = 1
        end
        case alt_14
        when 1
          # at line 161:7: '-'
          char_literal61 = match( MINUS, TOKENS_FOLLOWING_MINUS_IN_factor_1004 )
          if @state.backtracking == 0
            tree_for_char_literal61 = @adaptor.create_with_payload( char_literal61 )
            @adaptor.add_child( root_0, tree_for_char_literal61 )

          end


        end
        @state.following.push( TOKENS_FOLLOWING_primary_IN_factor_1007 )
        primary62 = primary
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, primary62.tree )
        end


      end
      # - - - - - - - rule clean up - - - - - - - -
      return_value.stop = @input.look( -1 )


      if @state.backtracking == 0
        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      end

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )


      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 17 )


      end

      return return_value
    end

    ExpressionListReturnValue = define_return_scope

    #
    # parser rule expression_list
    #
    # (in Rubik.g)
    # 164:1: expression_list : expression ( ',' expression )* ;
    #
    def expression_list
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )


      return_value = ExpressionListReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal64 = nil
      expression63 = nil
      expression65 = nil


      tree_for_char_literal64 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 165:7: expression ( ',' expression )*
      @state.following.push( TOKENS_FOLLOWING_expression_IN_expression_list_1024 )
      expression63 = expression
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, expression63.tree )
      end

      # at line 165:18: ( ',' expression )*
      while true # decision 16
        alt_16 = 2
        look_16_0 = @input.peek( 1 )

        if ( look_16_0 == COMMA )
          alt_16 = 1

        end
        case alt_16
        when 1
          # at line 165:19: ',' expression
          char_literal64 = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_expression_list_1027 )
          if @state.backtracking == 0
            tree_for_char_literal64 = @adaptor.create_with_payload( char_literal64 )
            @adaptor.add_child( root_0, tree_for_char_literal64 )

          end

          @state.following.push( TOKENS_FOLLOWING_expression_IN_expression_list_1029 )
          expression65 = expression
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, expression65.tree )
          end


        else
          break # out of loop for decision 16
        end
      end # loop for decision 16


      # - - - - - - - rule clean up - - - - - - - -
      return_value.stop = @input.look( -1 )


      if @state.backtracking == 0
        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      end

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )


      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 18 )


      end

      return return_value
    end

    WriteStatementReturnValue = define_return_scope

    #
    # parser rule write_statement
    #
    # (in Rubik.g)
    # 168:1: write_statement : 'print' '(' write_expression ( '.' write_expression )* ')' statement_end !;
    #
    def write_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )


      return_value = WriteStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal66 = nil
      char_literal67 = nil
      char_literal69 = nil
      char_literal71 = nil
      write_expression68 = nil
      write_expression70 = nil
      statement_end72 = nil


      tree_for_string_literal66 = nil
      tree_for_char_literal67 = nil
      tree_for_char_literal69 = nil
      tree_for_char_literal71 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 169:7: 'print' '(' write_expression ( '.' write_expression )* ')' statement_end !
      string_literal66 = match( T__61, TOKENS_FOLLOWING_T__61_IN_write_statement_1048 )
      if @state.backtracking == 0
        tree_for_string_literal66 = @adaptor.create_with_payload( string_literal66 )
        @adaptor.add_child( root_0, tree_for_string_literal66 )

      end

      char_literal67 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_write_statement_1050 )
      if @state.backtracking == 0
        tree_for_char_literal67 = @adaptor.create_with_payload( char_literal67 )
        @adaptor.add_child( root_0, tree_for_char_literal67 )

      end

      @state.following.push( TOKENS_FOLLOWING_write_expression_IN_write_statement_1052 )
      write_expression68 = write_expression
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, write_expression68.tree )
      end

      # at line 169:36: ( '.' write_expression )*
      while true # decision 17
        alt_17 = 2
        look_17_0 = @input.peek( 1 )

        if ( look_17_0 == DOT )
          alt_17 = 1

        end
        case alt_17
        when 1
          # at line 169:37: '.' write_expression
          char_literal69 = match( DOT, TOKENS_FOLLOWING_DOT_IN_write_statement_1055 )
          if @state.backtracking == 0
            tree_for_char_literal69 = @adaptor.create_with_payload( char_literal69 )
            @adaptor.add_child( root_0, tree_for_char_literal69 )

          end

          @state.following.push( TOKENS_FOLLOWING_write_expression_IN_write_statement_1057 )
          write_expression70 = write_expression
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, write_expression70.tree )
          end


        else
          break # out of loop for decision 17
        end
      end # loop for decision 17

      char_literal71 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_write_statement_1061 )
      if @state.backtracking == 0
        tree_for_char_literal71 = @adaptor.create_with_payload( char_literal71 )
        @adaptor.add_child( root_0, tree_for_char_literal71 )

      end

      @state.following.push( TOKENS_FOLLOWING_statement_end_IN_write_statement_1063 )
      statement_end72 = statement_end
      @state.following.pop

      # - - - - - - - rule clean up - - - - - - - -
      return_value.stop = @input.look( -1 )


      if @state.backtracking == 0
        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      end

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )


      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 19 )


      end

      return return_value
    end

    WriteExpressionReturnValue = define_return_scope

    #
    # parser rule write_expression
    #
    # (in Rubik.g)
    # 172:1: write_expression : ( expression | STRING );
    #
    def write_expression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )


      return_value = WriteExpressionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __STRING74__ = nil
      expression73 = nil


      tree_for_STRING74 = nil

      begin
      # at line 173:5: ( expression | STRING )
      alt_18 = 2
      look_18_0 = @input.peek( 1 )

      if ( look_18_0 == BOOLEAN || look_18_0 == CHAR || look_18_0 == FLOAT || look_18_0 == ID || look_18_0 == INT || look_18_0.between?( LPAREN, MINUS ) )
        alt_18 = 1
      elsif ( look_18_0 == STRING )
        alt_18 = 2
      else
        @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )



        raise NoViableAlternative( "", 18, 0 )

      end
      case alt_18
      when 1
        root_0 = @adaptor.create_flat_list


        # at line 173:7: expression
        @state.following.push( TOKENS_FOLLOWING_expression_IN_write_expression_1081 )
        expression73 = expression
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression73.tree )
        end


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 174:7: STRING
        __STRING74__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_write_expression_1089 )
        if @state.backtracking == 0
          tree_for_STRING74 = @adaptor.create_with_payload( __STRING74__ )
          @adaptor.add_child( root_0, tree_for_STRING74 )

        end


      end
      # - - - - - - - rule clean up - - - - - - - -
      return_value.stop = @input.look( -1 )


      if @state.backtracking == 0
        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      end

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )


      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 20 )


      end

      return return_value
    end

    LoopStatementReturnValue = define_return_scope

    #
    # parser rule loop_statement
    #
    # (in Rubik.g)
    # 177:1: loop_statement : 'do' exp 'times' block ;
    #
    def loop_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )


      return_value = LoopStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal75 = nil
      string_literal77 = nil
      exp76 = nil
      block78 = nil


      tree_for_string_literal75 = nil
      tree_for_string_literal77 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 178:7: 'do' exp 'times' block
      string_literal75 = match( DO, TOKENS_FOLLOWING_DO_IN_loop_statement_1106 )
      if @state.backtracking == 0
        tree_for_string_literal75 = @adaptor.create_with_payload( string_literal75 )
        @adaptor.add_child( root_0, tree_for_string_literal75 )

      end

      @state.following.push( TOKENS_FOLLOWING_exp_IN_loop_statement_1108 )
      exp76 = exp
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, exp76.tree )
      end

      string_literal77 = match( TIMES, TOKENS_FOLLOWING_TIMES_IN_loop_statement_1110 )
      if @state.backtracking == 0
        tree_for_string_literal77 = @adaptor.create_with_payload( string_literal77 )
        @adaptor.add_child( root_0, tree_for_string_literal77 )

      end

      @state.following.push( TOKENS_FOLLOWING_block_IN_loop_statement_1112 )
      block78 = block
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, block78.tree )
      end


      # - - - - - - - rule clean up - - - - - - - -
      return_value.stop = @input.look( -1 )


      if @state.backtracking == 0
        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      end

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )


      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 21 )


      end

      return return_value
    end

    FunctionReturnValue = define_return_scope

    #
    # parser rule function
    #
    # (in Rubik.g)
    # 181:1: function : 'def' VAR_TYPE variable_name function_parameters block ;
    #
    def function
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )


      return_value = FunctionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal79 = nil
      __VAR_TYPE80__ = nil
      variable_name81 = nil
      function_parameters82 = nil
      block83 = nil


      tree_for_string_literal79 = nil
      tree_for_VAR_TYPE80 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 182:7: 'def' VAR_TYPE variable_name function_parameters block
      string_literal79 = match( DEF, TOKENS_FOLLOWING_DEF_IN_function_1129 )
      if @state.backtracking == 0
        tree_for_string_literal79 = @adaptor.create_with_payload( string_literal79 )
        @adaptor.add_child( root_0, tree_for_string_literal79 )

      end

      __VAR_TYPE80__ = match( VAR_TYPE, TOKENS_FOLLOWING_VAR_TYPE_IN_function_1131 )
      if @state.backtracking == 0
        tree_for_VAR_TYPE80 = @adaptor.create_with_payload( __VAR_TYPE80__ )
        @adaptor.add_child( root_0, tree_for_VAR_TYPE80 )

      end

      @state.following.push( TOKENS_FOLLOWING_variable_name_IN_function_1133 )
      variable_name81 = variable_name
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, variable_name81.tree )
      end

      @state.following.push( TOKENS_FOLLOWING_function_parameters_IN_function_1135 )
      function_parameters82 = function_parameters
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, function_parameters82.tree )
      end

      @state.following.push( TOKENS_FOLLOWING_block_IN_function_1137 )
      block83 = block
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, block83.tree )
      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action

                    has_return = !(String(( block83 && @input.to_s( block83.start, block83.stop ) )) =~ /return/).nil?
                    if String(__VAR_TYPE80__) == 'void'
                      raise "'void' function should not have return statement" if has_return
                    else
                      unless has_return
                        raise "missing return statement for '#{__VAR_TYPE80__.text}'"
                      end
                    end
                
        # <-- action
      end


      # - - - - - - - rule clean up - - - - - - - -
      return_value.stop = @input.look( -1 )


      if @state.backtracking == 0
        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      end

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )


      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 22 )


      end

      return return_value
    end

    FunctionParametersReturnValue = define_return_scope

    #
    # parser rule function_parameters
    #
    # (in Rubik.g)
    # 195:1: function_parameters : '(' ( parameters )? ')' ;
    #
    def function_parameters
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 23 )


      return_value = FunctionParametersReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal84 = nil
      char_literal86 = nil
      parameters85 = nil


      tree_for_char_literal84 = nil
      tree_for_char_literal86 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 196:7: '(' ( parameters )? ')'
      char_literal84 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_function_parameters_1164 )
      if @state.backtracking == 0
        tree_for_char_literal84 = @adaptor.create_with_payload( char_literal84 )
        @adaptor.add_child( root_0, tree_for_char_literal84 )

      end

      # at line 196:11: ( parameters )?
      alt_19 = 2
      look_19_0 = @input.peek( 1 )

      if ( look_19_0 == VAR_TYPE )
        alt_19 = 1
      end
      case alt_19
      when 1
        # at line 196:11: parameters
        @state.following.push( TOKENS_FOLLOWING_parameters_IN_function_parameters_1166 )
        parameters85 = parameters
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, parameters85.tree )
        end


      end
      char_literal86 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_function_parameters_1169 )
      if @state.backtracking == 0
        tree_for_char_literal86 = @adaptor.create_with_payload( char_literal86 )
        @adaptor.add_child( root_0, tree_for_char_literal86 )

      end


      # - - - - - - - rule clean up - - - - - - - -
      return_value.stop = @input.look( -1 )


      if @state.backtracking == 0
        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      end

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )


      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 23 )


      end

      return return_value
    end

    ParametersReturnValue = define_return_scope

    #
    # parser rule parameters
    #
    # (in Rubik.g)
    # 199:1: parameters : VAR_TYPE variable_name ( ',' VAR_TYPE variable_name )* ;
    #
    def parameters
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )


      return_value = ParametersReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __VAR_TYPE87__ = nil
      char_literal89 = nil
      __VAR_TYPE90__ = nil
      variable_name88 = nil
      variable_name91 = nil


      tree_for_VAR_TYPE87 = nil
      tree_for_char_literal89 = nil
      tree_for_VAR_TYPE90 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 200:7: VAR_TYPE variable_name ( ',' VAR_TYPE variable_name )*
      __VAR_TYPE87__ = match( VAR_TYPE, TOKENS_FOLLOWING_VAR_TYPE_IN_parameters_1186 )
      if @state.backtracking == 0
        tree_for_VAR_TYPE87 = @adaptor.create_with_payload( __VAR_TYPE87__ )
        @adaptor.add_child( root_0, tree_for_VAR_TYPE87 )

      end

      @state.following.push( TOKENS_FOLLOWING_variable_name_IN_parameters_1188 )
      variable_name88 = variable_name
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, variable_name88.tree )
      end

      # at line 200:30: ( ',' VAR_TYPE variable_name )*
      while true # decision 20
        alt_20 = 2
        look_20_0 = @input.peek( 1 )

        if ( look_20_0 == COMMA )
          alt_20 = 1

        end
        case alt_20
        when 1
          # at line 200:31: ',' VAR_TYPE variable_name
          char_literal89 = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_parameters_1191 )
          if @state.backtracking == 0
            tree_for_char_literal89 = @adaptor.create_with_payload( char_literal89 )
            @adaptor.add_child( root_0, tree_for_char_literal89 )

          end

          __VAR_TYPE90__ = match( VAR_TYPE, TOKENS_FOLLOWING_VAR_TYPE_IN_parameters_1193 )
          if @state.backtracking == 0
            tree_for_VAR_TYPE90 = @adaptor.create_with_payload( __VAR_TYPE90__ )
            @adaptor.add_child( root_0, tree_for_VAR_TYPE90 )

          end

          @state.following.push( TOKENS_FOLLOWING_variable_name_IN_parameters_1195 )
          variable_name91 = variable_name
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, variable_name91.tree )
          end


        else
          break # out of loop for decision 20
        end
      end # loop for decision 20


      # - - - - - - - rule clean up - - - - - - - -
      return_value.stop = @input.look( -1 )


      if @state.backtracking == 0
        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      end

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )


      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 24 )


      end

      return return_value
    end

    RobotReturnValue = define_return_scope

    #
    # parser rule robot
    #
    # (in Rubik.g)
    # 203:1: robot : ( 'change_color' '(' COLOR ')' | 'change_direction' '(' DIR ')' | 'draw_circle' '(' expression ')' | 'draw_square' '(' expression ')' | 'draw_triangle' '(' expression ')' | 'pen_down' '(' ')' | 'pen_up' '(' ')' | 'reset' '(' ')' | 'talk' '(' expression ')' | 'move' '(' expression ')' );
    #
    def robot
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )


      return_value = RobotReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal92 = nil
      char_literal93 = nil
      __COLOR94__ = nil
      char_literal95 = nil
      string_literal96 = nil
      char_literal97 = nil
      __DIR98__ = nil
      char_literal99 = nil
      string_literal100 = nil
      char_literal101 = nil
      char_literal103 = nil
      string_literal104 = nil
      char_literal105 = nil
      char_literal107 = nil
      string_literal108 = nil
      char_literal109 = nil
      char_literal111 = nil
      string_literal112 = nil
      char_literal113 = nil
      char_literal114 = nil
      string_literal115 = nil
      char_literal116 = nil
      char_literal117 = nil
      string_literal118 = nil
      char_literal119 = nil
      char_literal120 = nil
      string_literal121 = nil
      char_literal122 = nil
      char_literal124 = nil
      string_literal125 = nil
      char_literal126 = nil
      char_literal128 = nil
      expression102 = nil
      expression106 = nil
      expression110 = nil
      expression123 = nil
      expression127 = nil


      tree_for_string_literal92 = nil
      tree_for_char_literal93 = nil
      tree_for_COLOR94 = nil
      tree_for_char_literal95 = nil
      tree_for_string_literal96 = nil
      tree_for_char_literal97 = nil
      tree_for_DIR98 = nil
      tree_for_char_literal99 = nil
      tree_for_string_literal100 = nil
      tree_for_char_literal101 = nil
      tree_for_char_literal103 = nil
      tree_for_string_literal104 = nil
      tree_for_char_literal105 = nil
      tree_for_char_literal107 = nil
      tree_for_string_literal108 = nil
      tree_for_char_literal109 = nil
      tree_for_char_literal111 = nil
      tree_for_string_literal112 = nil
      tree_for_char_literal113 = nil
      tree_for_char_literal114 = nil
      tree_for_string_literal115 = nil
      tree_for_char_literal116 = nil
      tree_for_char_literal117 = nil
      tree_for_string_literal118 = nil
      tree_for_char_literal119 = nil
      tree_for_char_literal120 = nil
      tree_for_string_literal121 = nil
      tree_for_char_literal122 = nil
      tree_for_char_literal124 = nil
      tree_for_string_literal125 = nil
      tree_for_char_literal126 = nil
      tree_for_char_literal128 = nil

      begin
      # at line 204:5: ( 'change_color' '(' COLOR ')' | 'change_direction' '(' DIR ')' | 'draw_circle' '(' expression ')' | 'draw_square' '(' expression ')' | 'draw_triangle' '(' expression ')' | 'pen_down' '(' ')' | 'pen_up' '(' ')' | 'reset' '(' ')' | 'talk' '(' expression ')' | 'move' '(' expression ')' )
      alt_21 = 10
      case look_21 = @input.peek( 1 )
      when CHANGE_COLOR then alt_21 = 1
      when T__60 then alt_21 = 2
      when DRAW_CIRCLE then alt_21 = 3
      when DRAW_SQUARE then alt_21 = 4
      when DRAW_TRIANGLE then alt_21 = 5
      when PEN_DOWN then alt_21 = 6
      when PEN_UP then alt_21 = 7
      when R_RESET then alt_21 = 8
      when TLK then alt_21 = 9
      when R_MOVE then alt_21 = 10
      else
        @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )



        raise NoViableAlternative( "", 21, 0 )

      end
      case alt_21
      when 1
        root_0 = @adaptor.create_flat_list


        # at line 204:7: 'change_color' '(' COLOR ')'
        string_literal92 = match( CHANGE_COLOR, TOKENS_FOLLOWING_CHANGE_COLOR_IN_robot_1214 )
        if @state.backtracking == 0
          tree_for_string_literal92 = @adaptor.create_with_payload( string_literal92 )
          @adaptor.add_child( root_0, tree_for_string_literal92 )

        end

        char_literal93 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1216 )
        if @state.backtracking == 0
          tree_for_char_literal93 = @adaptor.create_with_payload( char_literal93 )
          @adaptor.add_child( root_0, tree_for_char_literal93 )

        end

        __COLOR94__ = match( COLOR, TOKENS_FOLLOWING_COLOR_IN_robot_1218 )
        if @state.backtracking == 0
          tree_for_COLOR94 = @adaptor.create_with_payload( __COLOR94__ )
          @adaptor.add_child( root_0, tree_for_COLOR94 )

        end

        char_literal95 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1220 )
        if @state.backtracking == 0
          tree_for_char_literal95 = @adaptor.create_with_payload( char_literal95 )
          @adaptor.add_child( root_0, tree_for_char_literal95 )

        end


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 205:7: 'change_direction' '(' DIR ')'
        string_literal96 = match( T__60, TOKENS_FOLLOWING_T__60_IN_robot_1228 )
        if @state.backtracking == 0
          tree_for_string_literal96 = @adaptor.create_with_payload( string_literal96 )
          @adaptor.add_child( root_0, tree_for_string_literal96 )

        end

        char_literal97 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1230 )
        if @state.backtracking == 0
          tree_for_char_literal97 = @adaptor.create_with_payload( char_literal97 )
          @adaptor.add_child( root_0, tree_for_char_literal97 )

        end

        __DIR98__ = match( DIR, TOKENS_FOLLOWING_DIR_IN_robot_1232 )
        if @state.backtracking == 0
          tree_for_DIR98 = @adaptor.create_with_payload( __DIR98__ )
          @adaptor.add_child( root_0, tree_for_DIR98 )

        end

        char_literal99 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1234 )
        if @state.backtracking == 0
          tree_for_char_literal99 = @adaptor.create_with_payload( char_literal99 )
          @adaptor.add_child( root_0, tree_for_char_literal99 )

        end


      when 3
        root_0 = @adaptor.create_flat_list


        # at line 206:7: 'draw_circle' '(' expression ')'
        string_literal100 = match( DRAW_CIRCLE, TOKENS_FOLLOWING_DRAW_CIRCLE_IN_robot_1242 )
        if @state.backtracking == 0
          tree_for_string_literal100 = @adaptor.create_with_payload( string_literal100 )
          @adaptor.add_child( root_0, tree_for_string_literal100 )

        end

        char_literal101 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1244 )
        if @state.backtracking == 0
          tree_for_char_literal101 = @adaptor.create_with_payload( char_literal101 )
          @adaptor.add_child( root_0, tree_for_char_literal101 )

        end

        @state.following.push( TOKENS_FOLLOWING_expression_IN_robot_1246 )
        expression102 = expression
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression102.tree )
        end

        char_literal103 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1248 )
        if @state.backtracking == 0
          tree_for_char_literal103 = @adaptor.create_with_payload( char_literal103 )
          @adaptor.add_child( root_0, tree_for_char_literal103 )

        end


      when 4
        root_0 = @adaptor.create_flat_list


        # at line 207:7: 'draw_square' '(' expression ')'
        string_literal104 = match( DRAW_SQUARE, TOKENS_FOLLOWING_DRAW_SQUARE_IN_robot_1256 )
        if @state.backtracking == 0
          tree_for_string_literal104 = @adaptor.create_with_payload( string_literal104 )
          @adaptor.add_child( root_0, tree_for_string_literal104 )

        end

        char_literal105 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1258 )
        if @state.backtracking == 0
          tree_for_char_literal105 = @adaptor.create_with_payload( char_literal105 )
          @adaptor.add_child( root_0, tree_for_char_literal105 )

        end

        @state.following.push( TOKENS_FOLLOWING_expression_IN_robot_1260 )
        expression106 = expression
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression106.tree )
        end

        char_literal107 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1262 )
        if @state.backtracking == 0
          tree_for_char_literal107 = @adaptor.create_with_payload( char_literal107 )
          @adaptor.add_child( root_0, tree_for_char_literal107 )

        end


      when 5
        root_0 = @adaptor.create_flat_list


        # at line 208:7: 'draw_triangle' '(' expression ')'
        string_literal108 = match( DRAW_TRIANGLE, TOKENS_FOLLOWING_DRAW_TRIANGLE_IN_robot_1270 )
        if @state.backtracking == 0
          tree_for_string_literal108 = @adaptor.create_with_payload( string_literal108 )
          @adaptor.add_child( root_0, tree_for_string_literal108 )

        end

        char_literal109 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1272 )
        if @state.backtracking == 0
          tree_for_char_literal109 = @adaptor.create_with_payload( char_literal109 )
          @adaptor.add_child( root_0, tree_for_char_literal109 )

        end

        @state.following.push( TOKENS_FOLLOWING_expression_IN_robot_1274 )
        expression110 = expression
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression110.tree )
        end

        char_literal111 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1276 )
        if @state.backtracking == 0
          tree_for_char_literal111 = @adaptor.create_with_payload( char_literal111 )
          @adaptor.add_child( root_0, tree_for_char_literal111 )

        end


      when 6
        root_0 = @adaptor.create_flat_list


        # at line 209:7: 'pen_down' '(' ')'
        string_literal112 = match( PEN_DOWN, TOKENS_FOLLOWING_PEN_DOWN_IN_robot_1284 )
        if @state.backtracking == 0
          tree_for_string_literal112 = @adaptor.create_with_payload( string_literal112 )
          @adaptor.add_child( root_0, tree_for_string_literal112 )

        end

        char_literal113 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1286 )
        if @state.backtracking == 0
          tree_for_char_literal113 = @adaptor.create_with_payload( char_literal113 )
          @adaptor.add_child( root_0, tree_for_char_literal113 )

        end

        char_literal114 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1288 )
        if @state.backtracking == 0
          tree_for_char_literal114 = @adaptor.create_with_payload( char_literal114 )
          @adaptor.add_child( root_0, tree_for_char_literal114 )

        end


      when 7
        root_0 = @adaptor.create_flat_list


        # at line 210:7: 'pen_up' '(' ')'
        string_literal115 = match( PEN_UP, TOKENS_FOLLOWING_PEN_UP_IN_robot_1296 )
        if @state.backtracking == 0
          tree_for_string_literal115 = @adaptor.create_with_payload( string_literal115 )
          @adaptor.add_child( root_0, tree_for_string_literal115 )

        end

        char_literal116 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1298 )
        if @state.backtracking == 0
          tree_for_char_literal116 = @adaptor.create_with_payload( char_literal116 )
          @adaptor.add_child( root_0, tree_for_char_literal116 )

        end

        char_literal117 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1300 )
        if @state.backtracking == 0
          tree_for_char_literal117 = @adaptor.create_with_payload( char_literal117 )
          @adaptor.add_child( root_0, tree_for_char_literal117 )

        end


      when 8
        root_0 = @adaptor.create_flat_list


        # at line 211:7: 'reset' '(' ')'
        string_literal118 = match( R_RESET, TOKENS_FOLLOWING_R_RESET_IN_robot_1308 )
        if @state.backtracking == 0
          tree_for_string_literal118 = @adaptor.create_with_payload( string_literal118 )
          @adaptor.add_child( root_0, tree_for_string_literal118 )

        end

        char_literal119 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1310 )
        if @state.backtracking == 0
          tree_for_char_literal119 = @adaptor.create_with_payload( char_literal119 )
          @adaptor.add_child( root_0, tree_for_char_literal119 )

        end

        char_literal120 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1312 )
        if @state.backtracking == 0
          tree_for_char_literal120 = @adaptor.create_with_payload( char_literal120 )
          @adaptor.add_child( root_0, tree_for_char_literal120 )

        end


      when 9
        root_0 = @adaptor.create_flat_list


        # at line 212:7: 'talk' '(' expression ')'
        string_literal121 = match( TLK, TOKENS_FOLLOWING_TLK_IN_robot_1320 )
        if @state.backtracking == 0
          tree_for_string_literal121 = @adaptor.create_with_payload( string_literal121 )
          @adaptor.add_child( root_0, tree_for_string_literal121 )

        end

        char_literal122 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1322 )
        if @state.backtracking == 0
          tree_for_char_literal122 = @adaptor.create_with_payload( char_literal122 )
          @adaptor.add_child( root_0, tree_for_char_literal122 )

        end

        @state.following.push( TOKENS_FOLLOWING_expression_IN_robot_1324 )
        expression123 = expression
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression123.tree )
        end

        char_literal124 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1326 )
        if @state.backtracking == 0
          tree_for_char_literal124 = @adaptor.create_with_payload( char_literal124 )
          @adaptor.add_child( root_0, tree_for_char_literal124 )

        end


      when 10
        root_0 = @adaptor.create_flat_list


        # at line 213:7: 'move' '(' expression ')'
        string_literal125 = match( R_MOVE, TOKENS_FOLLOWING_R_MOVE_IN_robot_1334 )
        if @state.backtracking == 0
          tree_for_string_literal125 = @adaptor.create_with_payload( string_literal125 )
          @adaptor.add_child( root_0, tree_for_string_literal125 )

        end

        char_literal126 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1336 )
        if @state.backtracking == 0
          tree_for_char_literal126 = @adaptor.create_with_payload( char_literal126 )
          @adaptor.add_child( root_0, tree_for_char_literal126 )

        end

        @state.following.push( TOKENS_FOLLOWING_expression_IN_robot_1338 )
        expression127 = expression
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression127.tree )
        end

        char_literal128 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1340 )
        if @state.backtracking == 0
          tree_for_char_literal128 = @adaptor.create_with_payload( char_literal128 )
          @adaptor.add_child( root_0, tree_for_char_literal128 )

        end


      end
      # - - - - - - - rule clean up - - - - - - - -
      return_value.stop = @input.look( -1 )


      if @state.backtracking == 0
        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      end

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )


      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 25 )


      end

      return return_value
    end

    VariableNameReturnValue = define_return_scope

    #
    # parser rule variable_name
    #
    # (in Rubik.g)
    # 218:1: variable_name : ID ;
    #
    def variable_name
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )


      return_value = VariableNameReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __ID129__ = nil


      tree_for_ID129 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 219:7: ID
      __ID129__ = match( ID, TOKENS_FOLLOWING_ID_IN_variable_name_1359 )
      if @state.backtracking == 0
        tree_for_ID129 = @adaptor.create_with_payload( __ID129__ )
        @adaptor.add_child( root_0, tree_for_ID129 )

      end


      # - - - - - - - rule clean up - - - - - - - -
      return_value.stop = @input.look( -1 )


      if @state.backtracking == 0
        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      end

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )


      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 26 )


      end

      return return_value
    end

    PrimaryReturnValue = define_return_scope

    #
    # parser rule primary
    #
    # (in Rubik.g)
    # 224:1: primary : ( BOOLEAN | CHAR | FLOAT | INT | variable_name ( '[' expression ']' )? ( '[' expression ']' )? | variable_name ( '(' expression_list ')' ) );
    #
    def primary
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )


      return_value = PrimaryReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __BOOLEAN130__ = nil
      __CHAR131__ = nil
      __FLOAT132__ = nil
      __INT133__ = nil
      char_literal135 = nil
      char_literal137 = nil
      char_literal138 = nil
      char_literal140 = nil
      char_literal142 = nil
      char_literal144 = nil
      variable_name134 = nil
      expression136 = nil
      expression139 = nil
      variable_name141 = nil
      expression_list143 = nil


      tree_for_BOOLEAN130 = nil
      tree_for_CHAR131 = nil
      tree_for_FLOAT132 = nil
      tree_for_INT133 = nil
      tree_for_char_literal135 = nil
      tree_for_char_literal137 = nil
      tree_for_char_literal138 = nil
      tree_for_char_literal140 = nil
      tree_for_char_literal142 = nil
      tree_for_char_literal144 = nil

      begin
      # at line 225:5: ( BOOLEAN | CHAR | FLOAT | INT | variable_name ( '[' expression ']' )? ( '[' expression ']' )? | variable_name ( '(' expression_list ')' ) )
      alt_24 = 6
      case look_24 = @input.peek( 1 )
      when BOOLEAN then alt_24 = 1
      when CHAR then alt_24 = 2
      when FLOAT then alt_24 = 3
      when INT then alt_24 = 4
      when ID then look_24_5 = @input.peek( 2 )

      if ( look_24_5 == EOF || look_24_5.between?( COMMA, DEF ) || look_24_5.between?( DIV, DOT ) || look_24_5.between?( ELSE, EQ ) || look_24_5.between?( GEQ, IF ) || look_24_5.between?( LBRACE, LESS ) || look_24_5 == MINUS || look_24_5 == NEQ || look_24_5.between?( PLUS, RPAREN ) || look_24_5 == R_END || look_24_5.between?( R_RETURN, STAR ) || look_24_5 == TIMES || look_24_5 == VAR_TYPE || look_24_5 == T__61 )
        alt_24 = 5
      elsif ( look_24_5 == LPAREN )
        alt_24 = 6
      else
        @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )



        raise NoViableAlternative( "", 24, 5 )

      end
      else
        @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )



        raise NoViableAlternative( "", 24, 0 )

      end
      case alt_24
      when 1
        root_0 = @adaptor.create_flat_list


        # at line 225:7: BOOLEAN
        __BOOLEAN130__ = match( BOOLEAN, TOKENS_FOLLOWING_BOOLEAN_IN_primary_1378 )
        if @state.backtracking == 0
          tree_for_BOOLEAN130 = @adaptor.create_with_payload( __BOOLEAN130__ )
          @adaptor.add_child( root_0, tree_for_BOOLEAN130 )

        end


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 226:7: CHAR
        __CHAR131__ = match( CHAR, TOKENS_FOLLOWING_CHAR_IN_primary_1386 )
        if @state.backtracking == 0
          tree_for_CHAR131 = @adaptor.create_with_payload( __CHAR131__ )
          @adaptor.add_child( root_0, tree_for_CHAR131 )

        end


      when 3
        root_0 = @adaptor.create_flat_list


        # at line 227:7: FLOAT
        __FLOAT132__ = match( FLOAT, TOKENS_FOLLOWING_FLOAT_IN_primary_1394 )
        if @state.backtracking == 0
          tree_for_FLOAT132 = @adaptor.create_with_payload( __FLOAT132__ )
          @adaptor.add_child( root_0, tree_for_FLOAT132 )

        end


      when 4
        root_0 = @adaptor.create_flat_list


        # at line 228:7: INT
        __INT133__ = match( INT, TOKENS_FOLLOWING_INT_IN_primary_1402 )
        if @state.backtracking == 0
          tree_for_INT133 = @adaptor.create_with_payload( __INT133__ )
          @adaptor.add_child( root_0, tree_for_INT133 )

        end


      when 5
        root_0 = @adaptor.create_flat_list


        # at line 229:7: variable_name ( '[' expression ']' )? ( '[' expression ']' )?
        @state.following.push( TOKENS_FOLLOWING_variable_name_IN_primary_1410 )
        variable_name134 = variable_name
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, variable_name134.tree )
        end

        # at line 229:21: ( '[' expression ']' )?
        alt_22 = 2
        look_22_0 = @input.peek( 1 )

        if ( look_22_0 == LBRAK )
          alt_22 = 1
        end
        case alt_22
        when 1
          # at line 229:22: '[' expression ']'
          char_literal135 = match( LBRAK, TOKENS_FOLLOWING_LBRAK_IN_primary_1413 )
          if @state.backtracking == 0
            tree_for_char_literal135 = @adaptor.create_with_payload( char_literal135 )
            @adaptor.add_child( root_0, tree_for_char_literal135 )

          end

          @state.following.push( TOKENS_FOLLOWING_expression_IN_primary_1415 )
          expression136 = expression
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, expression136.tree )
          end

          char_literal137 = match( RBRAK, TOKENS_FOLLOWING_RBRAK_IN_primary_1417 )
          if @state.backtracking == 0
            tree_for_char_literal137 = @adaptor.create_with_payload( char_literal137 )
            @adaptor.add_child( root_0, tree_for_char_literal137 )

          end


        end
        # at line 229:43: ( '[' expression ']' )?
        alt_23 = 2
        look_23_0 = @input.peek( 1 )

        if ( look_23_0 == LBRAK )
          alt_23 = 1
        end
        case alt_23
        when 1
          # at line 229:44: '[' expression ']'
          char_literal138 = match( LBRAK, TOKENS_FOLLOWING_LBRAK_IN_primary_1422 )
          if @state.backtracking == 0
            tree_for_char_literal138 = @adaptor.create_with_payload( char_literal138 )
            @adaptor.add_child( root_0, tree_for_char_literal138 )

          end

          @state.following.push( TOKENS_FOLLOWING_expression_IN_primary_1424 )
          expression139 = expression
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, expression139.tree )
          end

          char_literal140 = match( RBRAK, TOKENS_FOLLOWING_RBRAK_IN_primary_1426 )
          if @state.backtracking == 0
            tree_for_char_literal140 = @adaptor.create_with_payload( char_literal140 )
            @adaptor.add_child( root_0, tree_for_char_literal140 )

          end


        end

      when 6
        root_0 = @adaptor.create_flat_list


        # at line 230:7: variable_name ( '(' expression_list ')' )
        @state.following.push( TOKENS_FOLLOWING_variable_name_IN_primary_1436 )
        variable_name141 = variable_name
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, variable_name141.tree )
        end

        # at line 230:21: ( '(' expression_list ')' )
        # at line 230:22: '(' expression_list ')'
        char_literal142 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_primary_1439 )
        if @state.backtracking == 0
          tree_for_char_literal142 = @adaptor.create_with_payload( char_literal142 )
          @adaptor.add_child( root_0, tree_for_char_literal142 )

        end

        @state.following.push( TOKENS_FOLLOWING_expression_list_IN_primary_1441 )
        expression_list143 = expression_list
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression_list143.tree )
        end

        char_literal144 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_primary_1443 )
        if @state.backtracking == 0
          tree_for_char_literal144 = @adaptor.create_with_payload( char_literal144 )
          @adaptor.add_child( root_0, tree_for_char_literal144 )

        end



      end
      # - - - - - - - rule clean up - - - - - - - -
      return_value.stop = @input.look( -1 )


      if @state.backtracking == 0
        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      end

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )


      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 27 )


      end

      return return_value
    end

    #
    # syntactic predicate synpred1_Rubik
    #
    # (in Rubik.g)
    # 93:7: synpred1_Rubik : '}' ;
    #
    # This is an imaginary rule inserted by ANTLR to
    # implement a syntactic predicate decision
    #
    def synpred1_Rubik
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )


      # at line 93:9: '}'
      match( RBRACE, TOKENS_FOLLOWING_RBRACE_IN_synpred1_Rubik_624 )

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 28 )


    end


    TOKENS_FOLLOWING_R_BEGIN_IN_program_469 = Set[ 14, 17, 27, 28, 30, 51, 58, 61 ]
    TOKENS_FOLLOWING_block_IN_program_471 = Set[ 14, 17, 27, 28, 30, 48, 51, 58, 61 ]
    TOKENS_FOLLOWING_R_END_IN_program_474 = Set[ 1 ]
    TOKENS_FOLLOWING_statement_IN_block_500 = Set[ 1 ]
    TOKENS_FOLLOWING_statement_block_IN_block_508 = Set[ 1 ]
    TOKENS_FOLLOWING_LBRACE_IN_statement_block_525 = Set[ 14, 17, 27, 28, 44, 51, 58, 61 ]
    TOKENS_FOLLOWING_statement_IN_statement_block_527 = Set[ 14, 17, 27, 28, 44, 51, 58, 61 ]
    TOKENS_FOLLOWING_RBRACE_IN_statement_block_530 = Set[ 1 ]
    TOKENS_FOLLOWING_variable_statement_IN_statement_549 = Set[ 1 ]
    TOKENS_FOLLOWING_assignment_statement_IN_statement_557 = Set[ 1 ]
    TOKENS_FOLLOWING_condition_statement_IN_statement_565 = Set[ 1 ]
    TOKENS_FOLLOWING_write_statement_IN_statement_573 = Set[ 1 ]
    TOKENS_FOLLOWING_loop_statement_IN_statement_581 = Set[ 1 ]
    TOKENS_FOLLOWING_return_statement_IN_statement_589 = Set[ 1 ]
    TOKENS_FOLLOWING_function_IN_statement_597 = Set[ 1 ]
    TOKENS_FOLLOWING_SEMI_IN_statement_end_614 = Set[ 1 ]
    TOKENS_FOLLOWING_EOF_IN_statement_end_635 = Set[ 1 ]
    TOKENS_FOLLOWING_R_RETURN_IN_return_statement_652 = Set[ 7, 11, 24, 27, 29, 34, 35 ]
    TOKENS_FOLLOWING_expression_IN_return_statement_654 = Set[ 52 ]
    TOKENS_FOLLOWING_statement_end_IN_return_statement_656 = Set[ 1 ]
    TOKENS_FOLLOWING_VAR_TYPE_IN_variable_statement_674 = Set[ 27 ]
    TOKENS_FOLLOWING_variable_declaration_list_IN_variable_statement_676 = Set[ 52 ]
    TOKENS_FOLLOWING_statement_end_IN_variable_statement_678 = Set[ 1 ]
    TOKENS_FOLLOWING_variable_declaration_IN_variable_declaration_list_696 = Set[ 1, 13 ]
    TOKENS_FOLLOWING_COMMA_IN_variable_declaration_list_699 = Set[ 27 ]
    TOKENS_FOLLOWING_variable_declaration_IN_variable_declaration_list_701 = Set[ 1, 13 ]
    TOKENS_FOLLOWING_declaration_target_IN_variable_declaration_720 = Set[ 1, 5 ]
    TOKENS_FOLLOWING_ASGN_IN_variable_declaration_723 = Set[ 7, 11, 24, 27, 29, 34, 35 ]
    TOKENS_FOLLOWING_expression_IN_variable_declaration_725 = Set[ 1 ]
    TOKENS_FOLLOWING_variable_name_IN_declaration_target_744 = Set[ 1, 31 ]
    TOKENS_FOLLOWING_LBRAK_IN_declaration_target_747 = Set[ 29 ]
    TOKENS_FOLLOWING_INT_IN_declaration_target_749 = Set[ 45 ]
    TOKENS_FOLLOWING_RBRAK_IN_declaration_target_751 = Set[ 1, 31 ]
    TOKENS_FOLLOWING_LBRAK_IN_declaration_target_756 = Set[ 29 ]
    TOKENS_FOLLOWING_INT_IN_declaration_target_758 = Set[ 45 ]
    TOKENS_FOLLOWING_RBRAK_IN_declaration_target_760 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_assignment_statement_789 = Set[ 5 ]
    TOKENS_FOLLOWING_ASGN_IN_assignment_statement_791 = Set[ 7, 11, 24, 27, 29, 34, 35 ]
    TOKENS_FOLLOWING_expression_IN_assignment_statement_793 = Set[ 52 ]
    TOKENS_FOLLOWING_statement_end_IN_assignment_statement_795 = Set[ 1 ]
    TOKENS_FOLLOWING_IF_IN_condition_statement_823 = Set[ 34 ]
    TOKENS_FOLLOWING_LPAREN_IN_condition_statement_825 = Set[ 7, 11, 24, 27, 29, 34, 35 ]
    TOKENS_FOLLOWING_expression_IN_condition_statement_827 = Set[ 46 ]
    TOKENS_FOLLOWING_RPAREN_IN_condition_statement_829 = Set[ 14, 17, 27, 28, 30, 51, 58, 61 ]
    TOKENS_FOLLOWING_block_IN_condition_statement_831 = Set[ 1, 22 ]
    TOKENS_FOLLOWING_ELSE_IN_condition_statement_834 = Set[ 14, 17, 27, 28, 30, 51, 58, 61 ]
    TOKENS_FOLLOWING_block_IN_condition_statement_836 = Set[ 1 ]
    TOKENS_FOLLOWING_exp_IN_expression_855 = Set[ 1, 23, 25, 26, 32, 33, 37 ]
    TOKENS_FOLLOWING_relation_op_IN_expression_858 = Set[ 7, 11, 24, 27, 29, 34, 35 ]
    TOKENS_FOLLOWING_exp_IN_expression_860 = Set[ 1 ]
    TOKENS_FOLLOWING_term_IN_exp_936 = Set[ 1, 35, 43 ]
    TOKENS_FOLLOWING_set_IN_exp_939 = Set[ 7, 11, 24, 27, 29, 34, 35 ]
    TOKENS_FOLLOWING_exp_IN_exp_945 = Set[ 1 ]
    TOKENS_FOLLOWING_factor_IN_term_964 = Set[ 1, 16, 53 ]
    TOKENS_FOLLOWING_set_IN_term_967 = Set[ 7, 11, 24, 27, 29, 34, 35 ]
    TOKENS_FOLLOWING_term_IN_term_973 = Set[ 1 ]
    TOKENS_FOLLOWING_LPAREN_IN_factor_992 = Set[ 7, 11, 24, 27, 29, 34, 35 ]
    TOKENS_FOLLOWING_expression_IN_factor_994 = Set[ 46 ]
    TOKENS_FOLLOWING_RPAREN_IN_factor_996 = Set[ 1 ]
    TOKENS_FOLLOWING_MINUS_IN_factor_1004 = Set[ 7, 11, 24, 27, 29 ]
    TOKENS_FOLLOWING_primary_IN_factor_1007 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_expression_list_1024 = Set[ 1, 13 ]
    TOKENS_FOLLOWING_COMMA_IN_expression_list_1027 = Set[ 7, 11, 24, 27, 29, 34, 35 ]
    TOKENS_FOLLOWING_expression_IN_expression_list_1029 = Set[ 1, 13 ]
    TOKENS_FOLLOWING_T__61_IN_write_statement_1048 = Set[ 34 ]
    TOKENS_FOLLOWING_LPAREN_IN_write_statement_1050 = Set[ 7, 11, 24, 27, 29, 34, 35, 54 ]
    TOKENS_FOLLOWING_write_expression_IN_write_statement_1052 = Set[ 18, 46 ]
    TOKENS_FOLLOWING_DOT_IN_write_statement_1055 = Set[ 7, 11, 24, 27, 29, 34, 35, 54 ]
    TOKENS_FOLLOWING_write_expression_IN_write_statement_1057 = Set[ 18, 46 ]
    TOKENS_FOLLOWING_RPAREN_IN_write_statement_1061 = Set[ 52 ]
    TOKENS_FOLLOWING_statement_end_IN_write_statement_1063 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_write_expression_1081 = Set[ 1 ]
    TOKENS_FOLLOWING_STRING_IN_write_expression_1089 = Set[ 1 ]
    TOKENS_FOLLOWING_DO_IN_loop_statement_1106 = Set[ 7, 11, 24, 27, 29, 34, 35 ]
    TOKENS_FOLLOWING_exp_IN_loop_statement_1108 = Set[ 55 ]
    TOKENS_FOLLOWING_TIMES_IN_loop_statement_1110 = Set[ 14, 17, 27, 28, 30, 51, 58, 61 ]
    TOKENS_FOLLOWING_block_IN_loop_statement_1112 = Set[ 1 ]
    TOKENS_FOLLOWING_DEF_IN_function_1129 = Set[ 58 ]
    TOKENS_FOLLOWING_VAR_TYPE_IN_function_1131 = Set[ 27 ]
    TOKENS_FOLLOWING_variable_name_IN_function_1133 = Set[ 34 ]
    TOKENS_FOLLOWING_function_parameters_IN_function_1135 = Set[ 14, 17, 27, 28, 30, 51, 58, 61 ]
    TOKENS_FOLLOWING_block_IN_function_1137 = Set[ 1 ]
    TOKENS_FOLLOWING_LPAREN_IN_function_parameters_1164 = Set[ 46, 58 ]
    TOKENS_FOLLOWING_parameters_IN_function_parameters_1166 = Set[ 46 ]
    TOKENS_FOLLOWING_RPAREN_IN_function_parameters_1169 = Set[ 1 ]
    TOKENS_FOLLOWING_VAR_TYPE_IN_parameters_1186 = Set[ 27 ]
    TOKENS_FOLLOWING_variable_name_IN_parameters_1188 = Set[ 1, 13 ]
    TOKENS_FOLLOWING_COMMA_IN_parameters_1191 = Set[ 58 ]
    TOKENS_FOLLOWING_VAR_TYPE_IN_parameters_1193 = Set[ 27 ]
    TOKENS_FOLLOWING_variable_name_IN_parameters_1195 = Set[ 1, 13 ]
    TOKENS_FOLLOWING_CHANGE_COLOR_IN_robot_1214 = Set[ 34 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1216 = Set[ 12 ]
    TOKENS_FOLLOWING_COLOR_IN_robot_1218 = Set[ 46 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1220 = Set[ 1 ]
    TOKENS_FOLLOWING_T__60_IN_robot_1228 = Set[ 34 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1230 = Set[ 15 ]
    TOKENS_FOLLOWING_DIR_IN_robot_1232 = Set[ 46 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1234 = Set[ 1 ]
    TOKENS_FOLLOWING_DRAW_CIRCLE_IN_robot_1242 = Set[ 34 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1244 = Set[ 7, 11, 24, 27, 29, 34, 35 ]
    TOKENS_FOLLOWING_expression_IN_robot_1246 = Set[ 46 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1248 = Set[ 1 ]
    TOKENS_FOLLOWING_DRAW_SQUARE_IN_robot_1256 = Set[ 34 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1258 = Set[ 7, 11, 24, 27, 29, 34, 35 ]
    TOKENS_FOLLOWING_expression_IN_robot_1260 = Set[ 46 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1262 = Set[ 1 ]
    TOKENS_FOLLOWING_DRAW_TRIANGLE_IN_robot_1270 = Set[ 34 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1272 = Set[ 7, 11, 24, 27, 29, 34, 35 ]
    TOKENS_FOLLOWING_expression_IN_robot_1274 = Set[ 46 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1276 = Set[ 1 ]
    TOKENS_FOLLOWING_PEN_DOWN_IN_robot_1284 = Set[ 34 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1286 = Set[ 46 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1288 = Set[ 1 ]
    TOKENS_FOLLOWING_PEN_UP_IN_robot_1296 = Set[ 34 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1298 = Set[ 46 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1300 = Set[ 1 ]
    TOKENS_FOLLOWING_R_RESET_IN_robot_1308 = Set[ 34 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1310 = Set[ 46 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1312 = Set[ 1 ]
    TOKENS_FOLLOWING_TLK_IN_robot_1320 = Set[ 34 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1322 = Set[ 7, 11, 24, 27, 29, 34, 35 ]
    TOKENS_FOLLOWING_expression_IN_robot_1324 = Set[ 46 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1326 = Set[ 1 ]
    TOKENS_FOLLOWING_R_MOVE_IN_robot_1334 = Set[ 34 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1336 = Set[ 7, 11, 24, 27, 29, 34, 35 ]
    TOKENS_FOLLOWING_expression_IN_robot_1338 = Set[ 46 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1340 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_variable_name_1359 = Set[ 1 ]
    TOKENS_FOLLOWING_BOOLEAN_IN_primary_1378 = Set[ 1 ]
    TOKENS_FOLLOWING_CHAR_IN_primary_1386 = Set[ 1 ]
    TOKENS_FOLLOWING_FLOAT_IN_primary_1394 = Set[ 1 ]
    TOKENS_FOLLOWING_INT_IN_primary_1402 = Set[ 1 ]
    TOKENS_FOLLOWING_variable_name_IN_primary_1410 = Set[ 1, 31 ]
    TOKENS_FOLLOWING_LBRAK_IN_primary_1413 = Set[ 7, 11, 24, 27, 29, 34, 35 ]
    TOKENS_FOLLOWING_expression_IN_primary_1415 = Set[ 45 ]
    TOKENS_FOLLOWING_RBRAK_IN_primary_1417 = Set[ 1, 31 ]
    TOKENS_FOLLOWING_LBRAK_IN_primary_1422 = Set[ 7, 11, 24, 27, 29, 34, 35 ]
    TOKENS_FOLLOWING_expression_IN_primary_1424 = Set[ 45 ]
    TOKENS_FOLLOWING_RBRAK_IN_primary_1426 = Set[ 1 ]
    TOKENS_FOLLOWING_variable_name_IN_primary_1436 = Set[ 34 ]
    TOKENS_FOLLOWING_LPAREN_IN_primary_1439 = Set[ 7, 11, 24, 27, 29, 34, 35 ]
    TOKENS_FOLLOWING_expression_list_IN_primary_1441 = Set[ 46 ]
    TOKENS_FOLLOWING_RPAREN_IN_primary_1443 = Set[ 1 ]
    TOKENS_FOLLOWING_RBRACE_IN_synpred1_Rubik_624 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0

end
