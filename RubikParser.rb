#!/usr/bin/env ruby
#
# Rubik.g
# --
# Generated using ANTLR version: 3.5
# Ruby runtime library version: 1.10.0
# Input grammar file: Rubik.g
# Generated at: 2013-11-12 22:53:59
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
    define_tokens( :EOF => -1, :T__59 => 59, :T__60 => 60, :T__61 => 61, 
                   :AND => 4, :ASGN => 5, :BLOCK => 6, :BOOLEAN => 7, :BREAK => 8, 
                   :CHANGE_COLOR => 9, :CHANGE_DIR => 10, :COLOR => 11, 
                   :COMMA => 12, :DEF => 13, :DIR => 14, :DIV => 15, :DO => 16, 
                   :DOT => 17, :DRAW_CIRCLE => 18, :DRAW_SQUARE => 19, :DRAW_TRIANGLE => 20, 
                   :ELSE => 21, :EQ => 22, :FLOAT => 23, :GEQ => 24, :GREATER => 25, 
                   :ID => 26, :IF => 27, :INT => 28, :LBRACE => 29, :LBRAK => 30, 
                   :LEQ => 31, :LESS => 32, :LPAREN => 33, :MINUS => 34, 
                   :NEG => 35, :NEQ => 36, :NEWLINE => 37, :NULL => 38, 
                   :OR => 39, :PEN_DOWN => 40, :PEN_UP => 41, :PLUS => 42, 
                   :RBRACE => 43, :RBRAK => 44, :RPAREN => 45, :R_BEGIN => 46, 
                   :R_END => 47, :R_MOVE => 48, :R_RESET => 49, :R_RETURN => 50, 
                   :SEMI => 51, :STAR => 52, :STRING => 53, :TIMES => 54, 
                   :TLK => 55, :VAR => 56, :VAR_TYPE => 57, :WS => 58 )


    # register the proper human-readable name or literal value
    # for each token type
    #
    # this is necessary because anonymous tokens, which are
    # created from literal values in the grammar, do not
    # have descriptive names
    register_names( "AND", "ASGN", "BLOCK", "BOOLEAN", "BREAK", "CHANGE_COLOR", 
                    "CHANGE_DIR", "COLOR", "COMMA", "DEF", "DIR", "DIV", 
                    "DO", "DOT", "DRAW_CIRCLE", "DRAW_SQUARE", "DRAW_TRIANGLE", 
                    "ELSE", "EQ", "FLOAT", "GEQ", "GREATER", "ID", "IF", 
                    "INT", "LBRACE", "LBRAK", "LEQ", "LESS", "LPAREN", "MINUS", 
                    "NEG", "NEQ", "NEWLINE", "NULL", "OR", "PEN_DOWN", "PEN_UP", 
                    "PLUS", "RBRACE", "RBRAK", "RPAREN", "R_BEGIN", "R_END", 
                    "R_MOVE", "R_RESET", "R_RETURN", "SEMI", "STAR", "STRING", 
                    "TIMES", "TLK", "VAR", "VAR_TYPE", "WS", "'change_direction'", 
                    "'gets'", "'print'" )


  end


  class Parser < ANTLR3::Parser
    @grammar_home = Rubik
    include ANTLR3::ASTBuilder

    RULE_METHODS = [ :program, :block, :statement_block, :statement, :statement_end, 
                     :return_statement, :variable_statement, :variable_declaration_list, 
                     :variable_declaration, :declaration_target, :assignment_statement, 
                     :condition_statement, :expression, :relation_op, :exp, 
                     :term, :factor, :write_statement, :write_expression, 
                     :read_statement, :loop_statement, :function, :function_parameters, 
                     :parameters, :robot, :variable_name, :primary, :primitive, 
                     :arrays, :functions, :expression_list, :synpred1_Rubik ].freeze

    include TokenData

    begin
      generated_using( "Rubik.g", "3.5", "1.10.0" )
    rescue NoMethodError => error
      # ignore
    end

    def initialize( input, options = {} )
      super( input, options )
      # - - - - - - begin action @parser::init - - - - - -
      # Rubik.g


          @symbols = {}
          @functions = {}
          @constants = {}
          @quadruples = []
          @current_scope = '_'
          @pila_tipos = []
          @pila_operadores = []
          @pila_operandos = []
          @pila_saltos = []
          @saltos = 0
          @cont_const = 0
          @cont_int = 0
          @cont_string = 0
          @cont_float = 0
          @cont_boolean = 0
          @aux_times = 0

          require 'symbols'
          require 'cubo_semantico'
          require 'cuadruplos'

      # - - - - - - end action @parser::init - - - - - - -


    end
    # - - - - - - - - - - - - Rules - - - - - - - - - - - - -
    ProgramReturnValue = define_return_scope

    #
    # parser rule program
    #
    # (in Rubik.g)
    # 83:1: program : 'begin' ( block )+ 'end' ;
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


      # at line 84:7: 'begin' ( block )+ 'end'
      string_literal1 = match( R_BEGIN, TOKENS_FOLLOWING_R_BEGIN_IN_program_478 )
      if @state.backtracking == 0
        tree_for_string_literal1 = @adaptor.create_with_payload( string_literal1 )
        @adaptor.add_child( root_0, tree_for_string_literal1 )

      end

      # at file 84:15: ( block )+
      match_count_1 = 0
      while true
        alt_1 = 2
        look_1_0 = @input.peek( 1 )

        if ( look_1_0 == DEF || look_1_0 == DO || look_1_0.between?( ID, IF ) || look_1_0 == LBRACE || look_1_0 == R_RETURN || look_1_0 == VAR_TYPE || look_1_0.between?( T__60, T__61 ) )
          alt_1 = 1

        end
        case alt_1
        when 1
          # at line 84:15: block
          @state.following.push( TOKENS_FOLLOWING_block_IN_program_480 )
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


      string_literal3 = match( R_END, TOKENS_FOLLOWING_R_END_IN_program_483 )
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
    # 87:1: block : ( statement | statement_block );
    #
    def block
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 2 )


      return_value = BlockReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      statement4 = nil
      statement_block5 = nil



      begin
      # at line 88:5: ( statement | statement_block )
      alt_2 = 2
      look_2_0 = @input.peek( 1 )

      if ( look_2_0 == DEF || look_2_0 == DO || look_2_0.between?( ID, IF ) || look_2_0 == R_RETURN || look_2_0 == VAR_TYPE || look_2_0.between?( T__60, T__61 ) )
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


        # at line 88:7: statement
        @state.following.push( TOKENS_FOLLOWING_statement_IN_block_500 )
        statement4 = statement
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, statement4.tree )
        end


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 89:7: statement_block
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


      end

      return return_value
    end

    StatementBlockReturnValue = define_return_scope

    #
    # parser rule statement_block
    #
    # (in Rubik.g)
    # 92:1: statement_block : '{' ( statement )* '}' ;
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


      # at line 93:7: '{' ( statement )* '}'
      char_literal6 = match( LBRACE, TOKENS_FOLLOWING_LBRACE_IN_statement_block_525 )
      if @state.backtracking == 0
        tree_for_char_literal6 = @adaptor.create_with_payload( char_literal6 )
        @adaptor.add_child( root_0, tree_for_char_literal6 )

      end

      # at line 93:11: ( statement )*
      while true # decision 3
        alt_3 = 2
        look_3_0 = @input.peek( 1 )

        if ( look_3_0 == DEF || look_3_0 == DO || look_3_0.between?( ID, IF ) || look_3_0 == R_RETURN || look_3_0 == VAR_TYPE || look_3_0.between?( T__60, T__61 ) )
          alt_3 = 1

        end
        case alt_3
        when 1
          # at line 93:11: statement
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
    # 98:1: statement : ( variable_statement | assignment_statement | condition_statement | write_statement | read_statement | loop_statement | return_statement | function );
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
      read_statement13 = nil
      loop_statement14 = nil
      return_statement15 = nil
      function16 = nil



      begin
      # at line 99:5: ( variable_statement | assignment_statement | condition_statement | write_statement | read_statement | loop_statement | return_statement | function )
      alt_4 = 8
      case look_4 = @input.peek( 1 )
      when VAR_TYPE then alt_4 = 1
      when ID then alt_4 = 2
      when IF then alt_4 = 3
      when T__61 then alt_4 = 4
      when T__60 then alt_4 = 5
      when DO then alt_4 = 6
      when R_RETURN then alt_4 = 7
      when DEF then alt_4 = 8
      else
        @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )



        raise NoViableAlternative( "", 4, 0 )

      end
      case alt_4
      when 1
        root_0 = @adaptor.create_flat_list


        # at line 99:7: variable_statement
        @state.following.push( TOKENS_FOLLOWING_variable_statement_IN_statement_549 )
        variable_statement9 = variable_statement
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, variable_statement9.tree )
        end


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 100:7: assignment_statement
        @state.following.push( TOKENS_FOLLOWING_assignment_statement_IN_statement_557 )
        assignment_statement10 = assignment_statement
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, assignment_statement10.tree )
        end


      when 3
        root_0 = @adaptor.create_flat_list


        # at line 101:7: condition_statement
        @state.following.push( TOKENS_FOLLOWING_condition_statement_IN_statement_565 )
        condition_statement11 = condition_statement
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, condition_statement11.tree )
        end


      when 4
        root_0 = @adaptor.create_flat_list


        # at line 102:7: write_statement
        @state.following.push( TOKENS_FOLLOWING_write_statement_IN_statement_573 )
        write_statement12 = write_statement
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, write_statement12.tree )
        end


      when 5
        root_0 = @adaptor.create_flat_list


        # at line 103:7: read_statement
        @state.following.push( TOKENS_FOLLOWING_read_statement_IN_statement_581 )
        read_statement13 = read_statement
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, read_statement13.tree )
        end


      when 6
        root_0 = @adaptor.create_flat_list


        # at line 104:7: loop_statement
        @state.following.push( TOKENS_FOLLOWING_loop_statement_IN_statement_589 )
        loop_statement14 = loop_statement
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, loop_statement14.tree )
        end


      when 7
        root_0 = @adaptor.create_flat_list


        # at line 105:7: return_statement
        @state.following.push( TOKENS_FOLLOWING_return_statement_IN_statement_597 )
        return_statement15 = return_statement
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, return_statement15.tree )
        end


      when 8
        root_0 = @adaptor.create_flat_list


        # at line 106:7: function
        @state.following.push( TOKENS_FOLLOWING_function_IN_statement_605 )
        function16 = function
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, function16.tree )
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
    # 109:1: statement_end : ( ';' | ( '}' )=>| EOF );
    #
    def statement_end
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 5 )


      return_value = StatementEndReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal17 = nil
      __EOF18__ = nil


      tree_for_char_literal17 = nil
      tree_for_EOF18 = nil

      begin
      # at line 110:5: ( ';' | ( '}' )=>| EOF )
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
      elsif ( look_5_0 == T__60 ) and ( syntactic_predicate?( :synpred1_Rubik ) )
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


        # at line 110:7: ';'
        char_literal17 = match( SEMI, TOKENS_FOLLOWING_SEMI_IN_statement_end_622 )
        if @state.backtracking == 0
          tree_for_char_literal17 = @adaptor.create_with_payload( char_literal17 )
          @adaptor.add_child( root_0, tree_for_char_literal17 )

        end


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 111:7: ( '}' )=>

      when 3
        root_0 = @adaptor.create_flat_list


        # at line 112:7: EOF
        __EOF18__ = match( EOF, TOKENS_FOLLOWING_EOF_IN_statement_end_643 )
        if @state.backtracking == 0
          tree_for_EOF18 = @adaptor.create_with_payload( __EOF18__ )
          @adaptor.add_child( root_0, tree_for_EOF18 )

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
    # 115:1: return_statement : 'return' expression statement_end !;
    #
    def return_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 6 )


      return_value = ReturnStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal19 = nil
      expression20 = nil
      statement_end21 = nil


      tree_for_string_literal19 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 116:7: 'return' expression statement_end !
      string_literal19 = match( R_RETURN, TOKENS_FOLLOWING_R_RETURN_IN_return_statement_660 )
      if @state.backtracking == 0
        tree_for_string_literal19 = @adaptor.create_with_payload( string_literal19 )
        @adaptor.add_child( root_0, tree_for_string_literal19 )

      end

      @state.following.push( TOKENS_FOLLOWING_expression_IN_return_statement_662 )
      expression20 = expression
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, expression20.tree )
      end

      @state.following.push( TOKENS_FOLLOWING_statement_end_IN_return_statement_664 )
      statement_end21 = statement_end
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
    # 119:1: variable_statement : VAR_TYPE variable_declaration_list statement_end !;
    #
    def variable_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 7 )


      return_value = VariableStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __VAR_TYPE22__ = nil
      variable_declaration_list23 = nil
      statement_end24 = nil


      tree_for_VAR_TYPE22 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 123:7: VAR_TYPE variable_declaration_list statement_end !
      __VAR_TYPE22__ = match( VAR_TYPE, TOKENS_FOLLOWING_VAR_TYPE_IN_variable_statement_687 )
      if @state.backtracking == 0
        tree_for_VAR_TYPE22 = @adaptor.create_with_payload( __VAR_TYPE22__ )
        @adaptor.add_child( root_0, tree_for_VAR_TYPE22 )

      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         @current_var_type = __VAR_TYPE22__.text 
        # <-- action
      end

      @state.following.push( TOKENS_FOLLOWING_variable_declaration_list_IN_variable_statement_691 )
      variable_declaration_list23 = variable_declaration_list
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, variable_declaration_list23.tree )
      end

      @state.following.push( TOKENS_FOLLOWING_statement_end_IN_variable_statement_693 )
      statement_end24 = statement_end
      @state.following.pop

      # - - - - - - - rule clean up - - - - - - - -
      return_value.stop = @input.look( -1 )


      if @state.backtracking == 0
        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      end

      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action

            @current_var_type = nil

        # <-- action
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
    # 126:1: variable_declaration_list : variable_declaration ( ',' variable_declaration )* ;
    #
    def variable_declaration_list
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 8 )


      return_value = VariableDeclarationListReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal26 = nil
      variable_declaration25 = nil
      variable_declaration27 = nil


      tree_for_char_literal26 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 127:7: variable_declaration ( ',' variable_declaration )*
      @state.following.push( TOKENS_FOLLOWING_variable_declaration_IN_variable_declaration_list_711 )
      variable_declaration25 = variable_declaration
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, variable_declaration25.tree )
      end

      # at line 127:28: ( ',' variable_declaration )*
      while true # decision 6
        alt_6 = 2
        look_6_0 = @input.peek( 1 )

        if ( look_6_0 == COMMA )
          alt_6 = 1

        end
        case alt_6
        when 1
          # at line 127:29: ',' variable_declaration
          char_literal26 = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_variable_declaration_list_714 )
          if @state.backtracking == 0
            tree_for_char_literal26 = @adaptor.create_with_payload( char_literal26 )
            @adaptor.add_child( root_0, tree_for_char_literal26 )

          end

          @state.following.push( TOKENS_FOLLOWING_variable_declaration_IN_variable_declaration_list_716 )
          variable_declaration27 = variable_declaration
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, variable_declaration27.tree )
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
    # 130:1: variable_declaration : declaration_target ( '=' expression )? ;
    #
    def variable_declaration
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 9 )


      return_value = VariableDeclarationReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal29 = nil
      declaration_target28 = nil
      expression30 = nil


      tree_for_char_literal29 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 131:7: declaration_target ( '=' expression )?
      @state.following.push( TOKENS_FOLLOWING_declaration_target_IN_variable_declaration_735 )
      declaration_target28 = declaration_target
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, declaration_target28.tree )
      end

      # at line 131:26: ( '=' expression )?
      alt_7 = 2
      look_7_0 = @input.peek( 1 )

      if ( look_7_0 == ASGN )
        alt_7 = 1
      end
      case alt_7
      when 1
        # at line 131:27: '=' expression
        char_literal29 = match( ASGN, TOKENS_FOLLOWING_ASGN_IN_variable_declaration_738 )
        if @state.backtracking == 0
          tree_for_char_literal29 = @adaptor.create_with_payload( char_literal29 )
          @adaptor.add_child( root_0, tree_for_char_literal29 )

        end

        @state.following.push( TOKENS_FOLLOWING_expression_IN_variable_declaration_740 )
        expression30 = expression
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression30.tree )
        end


      end

      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action

                    define_variable(( declaration_target28 && @input.to_s( declaration_target28.start, declaration_target28.stop ) ), @current_var_type)
                
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
        # trace_out( __method__, 9 )


      end

      return return_value
    end

    DeclarationTargetReturnValue = define_return_scope

    #
    # parser rule declaration_target
    #
    # (in Rubik.g)
    # 137:1: declaration_target : variable_name ( '[' INT ']' )? ( '[' INT ']' )? ;
    #
    def declaration_target
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 10 )


      return_value = DeclarationTargetReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal32 = nil
      __INT33__ = nil
      char_literal34 = nil
      char_literal35 = nil
      __INT36__ = nil
      char_literal37 = nil
      variable_name31 = nil


      tree_for_char_literal32 = nil
      tree_for_INT33 = nil
      tree_for_char_literal34 = nil
      tree_for_char_literal35 = nil
      tree_for_INT36 = nil
      tree_for_char_literal37 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 138:7: variable_name ( '[' INT ']' )? ( '[' INT ']' )?
      @state.following.push( TOKENS_FOLLOWING_variable_name_IN_declaration_target_769 )
      variable_name31 = variable_name
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, variable_name31.tree )
      end

      # at line 138:21: ( '[' INT ']' )?
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
        # at line 138:22: '[' INT ']'
        char_literal32 = match( LBRAK, TOKENS_FOLLOWING_LBRAK_IN_declaration_target_772 )
        if @state.backtracking == 0
          tree_for_char_literal32 = @adaptor.create_with_payload( char_literal32 )
          @adaptor.add_child( root_0, tree_for_char_literal32 )

        end

        __INT33__ = match( INT, TOKENS_FOLLOWING_INT_IN_declaration_target_774 )
        if @state.backtracking == 0
          tree_for_INT33 = @adaptor.create_with_payload( __INT33__ )
          @adaptor.add_child( root_0, tree_for_INT33 )

        end

        char_literal34 = match( RBRAK, TOKENS_FOLLOWING_RBRAK_IN_declaration_target_776 )
        if @state.backtracking == 0
          tree_for_char_literal34 = @adaptor.create_with_payload( char_literal34 )
          @adaptor.add_child( root_0, tree_for_char_literal34 )

        end


      end
      # at line 138:36: ( '[' INT ']' )?
      alt_9 = 2
      look_9_0 = @input.peek( 1 )

      if ( look_9_0 == LBRAK )
        alt_9 = 1
      end
      case alt_9
      when 1
        # at line 138:37: '[' INT ']'
        char_literal35 = match( LBRAK, TOKENS_FOLLOWING_LBRAK_IN_declaration_target_781 )
        if @state.backtracking == 0
          tree_for_char_literal35 = @adaptor.create_with_payload( char_literal35 )
          @adaptor.add_child( root_0, tree_for_char_literal35 )

        end

        __INT36__ = match( INT, TOKENS_FOLLOWING_INT_IN_declaration_target_783 )
        if @state.backtracking == 0
          tree_for_INT36 = @adaptor.create_with_payload( __INT36__ )
          @adaptor.add_child( root_0, tree_for_INT36 )

        end

        char_literal37 = match( RBRAK, TOKENS_FOLLOWING_RBRAK_IN_declaration_target_785 )
        if @state.backtracking == 0
          tree_for_char_literal37 = @adaptor.create_with_payload( char_literal37 )
          @adaptor.add_child( root_0, tree_for_char_literal37 )

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
        # trace_out( __method__, 10 )


      end

      return return_value
    end

    AssignmentStatementReturnValue = define_return_scope

    #
    # parser rule assignment_statement
    #
    # (in Rubik.g)
    # 141:1: assignment_statement : ID '=' expression statement_end !;
    #
    def assignment_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 11 )


      return_value = AssignmentStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __ID38__ = nil
      char_literal39 = nil
      expression40 = nil
      statement_end41 = nil


      tree_for_ID38 = nil
      tree_for_char_literal39 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 142:7: ID '=' expression statement_end !
      __ID38__ = match( ID, TOKENS_FOLLOWING_ID_IN_assignment_statement_804 )
      if @state.backtracking == 0
        tree_for_ID38 = @adaptor.create_with_payload( __ID38__ )
        @adaptor.add_child( root_0, tree_for_ID38 )

      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         assign(__ID38__.text) 
        # <-- action
      end

      char_literal39 = match( ASGN, TOKENS_FOLLOWING_ASGN_IN_assignment_statement_808 )
      if @state.backtracking == 0
        tree_for_char_literal39 = @adaptor.create_with_payload( char_literal39 )
        @adaptor.add_child( root_0, tree_for_char_literal39 )

      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         exp2('=') 
        # <-- action
      end

      @state.following.push( TOKENS_FOLLOWING_expression_IN_assignment_statement_812 )
      expression40 = expression
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, expression40.tree )
      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         exp9 
        # <-- action
      end

      @state.following.push( TOKENS_FOLLOWING_statement_end_IN_assignment_statement_816 )
      statement_end41 = statement_end
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
        # trace_out( __method__, 11 )


      end

      return return_value
    end

    ConditionStatementReturnValue = define_return_scope

    #
    # parser rule condition_statement
    #
    # (in Rubik.g)
    # 145:1: condition_statement : 'if' '(' expression ')' block ( 'else' block )? ;
    #
    def condition_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 12 )


      return_value = ConditionStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal42 = nil
      char_literal43 = nil
      char_literal45 = nil
      string_literal47 = nil
      expression44 = nil
      block46 = nil
      block48 = nil


      tree_for_string_literal42 = nil
      tree_for_char_literal43 = nil
      tree_for_char_literal45 = nil
      tree_for_string_literal47 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 146:7: 'if' '(' expression ')' block ( 'else' block )?
      string_literal42 = match( IF, TOKENS_FOLLOWING_IF_IN_condition_statement_834 )
      if @state.backtracking == 0
        tree_for_string_literal42 = @adaptor.create_with_payload( string_literal42 )
        @adaptor.add_child( root_0, tree_for_string_literal42 )

      end

      char_literal43 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_condition_statement_836 )
      if @state.backtracking == 0
        tree_for_char_literal43 = @adaptor.create_with_payload( char_literal43 )
        @adaptor.add_child( root_0, tree_for_char_literal43 )

      end

      @state.following.push( TOKENS_FOLLOWING_expression_IN_condition_statement_838 )
      expression44 = expression
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, expression44.tree )
      end

      char_literal45 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_condition_statement_840 )
      if @state.backtracking == 0
        tree_for_char_literal45 = @adaptor.create_with_payload( char_literal45 )
        @adaptor.add_child( root_0, tree_for_char_literal45 )

      end

      @state.following.push( TOKENS_FOLLOWING_block_IN_condition_statement_842 )
      block46 = block
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, block46.tree )
      end

      # at line 146:37: ( 'else' block )?
      alt_10 = 2
      look_10_0 = @input.peek( 1 )

      if ( look_10_0 == ELSE )
        alt_10 = 1
      end
      case alt_10
      when 1
        # at line 146:38: 'else' block
        string_literal47 = match( ELSE, TOKENS_FOLLOWING_ELSE_IN_condition_statement_845 )
        if @state.backtracking == 0
          tree_for_string_literal47 = @adaptor.create_with_payload( string_literal47 )
          @adaptor.add_child( root_0, tree_for_string_literal47 )

        end

        @state.following.push( TOKENS_FOLLOWING_block_IN_condition_statement_847 )
        block48 = block
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, block48.tree )
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
    # 149:1: expression : exp ( relation_op exp )? ;
    #
    def expression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 13 )


      return_value = ExpressionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      exp49 = nil
      relation_op50 = nil
      exp51 = nil



      begin
      root_0 = @adaptor.create_flat_list


      # at line 150:7: exp ( relation_op exp )?
      @state.following.push( TOKENS_FOLLOWING_exp_IN_expression_866 )
      exp49 = exp
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, exp49.tree )
      end

      # at line 150:11: ( relation_op exp )?
      alt_11 = 2
      look_11_0 = @input.peek( 1 )

      if ( look_11_0 == EQ || look_11_0.between?( GEQ, GREATER ) || look_11_0.between?( LEQ, LESS ) || look_11_0 == NEQ )
        alt_11 = 1
      end
      case alt_11
      when 1
        # at line 150:12: relation_op exp
        @state.following.push( TOKENS_FOLLOWING_relation_op_IN_expression_869 )
        relation_op50 = relation_op
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, relation_op50.tree )
        end


        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           exp2(input.look(-1).text) 
          # <-- action
        end

        @state.following.push( TOKENS_FOLLOWING_exp_IN_expression_873 )
        exp51 = exp
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, exp51.tree )
        end


        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           exp9 
          # <-- action
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
    # 153:1: relation_op : ( '<' | '>' | '<=' | '>=' | '==' | '!=' );
    #
    def relation_op
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 14 )


      return_value = RelationOpReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      set52 = nil


      tree_for_set52 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 
      set52 = @input.look

      if @input.peek(1) == EQ || @input.peek( 1 ).between?( GEQ, GREATER ) || @input.peek( 1 ).between?( LEQ, LESS ) || @input.peek(1) == NEQ
        @input.consume
        if @state.backtracking == 0
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set52 ) )
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
    # 162:1: exp : term ( ( '+' | '-' ) exp )? ;
    #
    def exp
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )


      return_value = ExpReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      set54 = nil
      term53 = nil
      exp55 = nil


      tree_for_set54 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 163:7: term ( ( '+' | '-' ) exp )?
      @state.following.push( TOKENS_FOLLOWING_term_IN_exp_951 )
      term53 = term
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, term53.tree )
      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         exp4 
        # <-- action
      end

      # at line 163:21: ( ( '+' | '-' ) exp )?
      alt_12 = 2
      look_12_0 = @input.peek( 1 )

      if ( look_12_0 == MINUS || look_12_0 == PLUS )
        alt_12 = 1
      end
      case alt_12
      when 1
        # at line 163:22: ( '+' | '-' ) exp
        set54 = @input.look

        if @input.peek(1) == MINUS || @input.peek(1) == PLUS
          @input.consume
          if @state.backtracking == 0
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set54 ) )
          end

          @state.error_recovery = false

        else
          @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )


          mse = MismatchedSet( nil )
          raise mse

        end



        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           exp2(input.look(-1).text) 
          # <-- action
        end

        @state.following.push( TOKENS_FOLLOWING_exp_IN_exp_964 )
        exp55 = exp
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, exp55.tree )
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
    # 166:1: term : factor ( ( '*' | '/' ) term )? ;
    #
    def term
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )


      return_value = TermReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      set57 = nil
      factor56 = nil
      term58 = nil


      tree_for_set57 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 167:7: factor ( ( '*' | '/' ) term )?
      @state.following.push( TOKENS_FOLLOWING_factor_IN_term_983 )
      factor56 = factor
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, factor56.tree )
      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         exp5 
        # <-- action
      end

      # at line 167:23: ( ( '*' | '/' ) term )?
      alt_13 = 2
      look_13_0 = @input.peek( 1 )

      if ( look_13_0 == DIV || look_13_0 == STAR )
        alt_13 = 1
      end
      case alt_13
      when 1
        # at line 167:24: ( '*' | '/' ) term
        set57 = @input.look

        if @input.peek(1) == DIV || @input.peek(1) == STAR
          @input.consume
          if @state.backtracking == 0
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set57 ) )
          end

          @state.error_recovery = false

        else
          @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )


          mse = MismatchedSet( nil )
          raise mse

        end



        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           exp2(input.look(-1).text) 
          # <-- action
        end

        @state.following.push( TOKENS_FOLLOWING_term_IN_term_996 )
        term58 = term
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, term58.tree )
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
    # 170:1: factor : ( '(' expression ')' | ( '-' )? primary );
    #
    def factor
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )


      return_value = FactorReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal59 = nil
      char_literal61 = nil
      char_literal62 = nil
      expression60 = nil
      primary63 = nil


      tree_for_char_literal59 = nil
      tree_for_char_literal61 = nil
      tree_for_char_literal62 = nil

      begin
      # at line 171:5: ( '(' expression ')' | ( '-' )? primary )
      alt_15 = 2
      look_15_0 = @input.peek( 1 )

      if ( look_15_0 == LPAREN )
        alt_15 = 1
      elsif ( look_15_0 == BOOLEAN || look_15_0 == FLOAT || look_15_0 == ID || look_15_0 == INT || look_15_0 == MINUS || look_15_0 == STRING )
        alt_15 = 2
      else
        @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )



        raise NoViableAlternative( "", 15, 0 )

      end
      case alt_15
      when 1
        root_0 = @adaptor.create_flat_list


        # at line 171:7: '(' expression ')'
        char_literal59 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_factor_1015 )
        if @state.backtracking == 0
          tree_for_char_literal59 = @adaptor.create_with_payload( char_literal59 )
          @adaptor.add_child( root_0, tree_for_char_literal59 )

        end


        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           exp6 
          # <-- action
        end

        @state.following.push( TOKENS_FOLLOWING_expression_IN_factor_1019 )
        expression60 = expression
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression60.tree )
        end

        char_literal61 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_factor_1021 )
        if @state.backtracking == 0
          tree_for_char_literal61 = @adaptor.create_with_payload( char_literal61 )
          @adaptor.add_child( root_0, tree_for_char_literal61 )

        end


        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           exp7 
          # <-- action
        end


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 172:7: ( '-' )? primary
        # at line 172:7: ( '-' )?
        alt_14 = 2
        look_14_0 = @input.peek( 1 )

        if ( look_14_0 == MINUS )
          alt_14 = 1
        end
        case alt_14
        when 1
          # at line 172:7: '-'
          char_literal62 = match( MINUS, TOKENS_FOLLOWING_MINUS_IN_factor_1031 )
          if @state.backtracking == 0
            tree_for_char_literal62 = @adaptor.create_with_payload( char_literal62 )
            @adaptor.add_child( root_0, tree_for_char_literal62 )

          end


        end
        @state.following.push( TOKENS_FOLLOWING_primary_IN_factor_1034 )
        primary63 = primary
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, primary63.tree )
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

    WriteStatementReturnValue = define_return_scope

    #
    # parser rule write_statement
    #
    # (in Rubik.g)
    # 175:1: write_statement : 'print' '(' write_expression ( '.' write_expression )* ')' statement_end !;
    #
    def write_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )


      return_value = WriteStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal64 = nil
      char_literal65 = nil
      char_literal67 = nil
      char_literal69 = nil
      write_expression66 = nil
      write_expression68 = nil
      statement_end70 = nil


      tree_for_string_literal64 = nil
      tree_for_char_literal65 = nil
      tree_for_char_literal67 = nil
      tree_for_char_literal69 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 176:7: 'print' '(' write_expression ( '.' write_expression )* ')' statement_end !
      string_literal64 = match( T__61, TOKENS_FOLLOWING_T__61_IN_write_statement_1051 )
      if @state.backtracking == 0
        tree_for_string_literal64 = @adaptor.create_with_payload( string_literal64 )
        @adaptor.add_child( root_0, tree_for_string_literal64 )

      end

      char_literal65 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_write_statement_1053 )
      if @state.backtracking == 0
        tree_for_char_literal65 = @adaptor.create_with_payload( char_literal65 )
        @adaptor.add_child( root_0, tree_for_char_literal65 )

      end

      @state.following.push( TOKENS_FOLLOWING_write_expression_IN_write_statement_1055 )
      write_expression66 = write_expression
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, write_expression66.tree )
      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         r_print 
        # <-- action
      end

      # at line 176:48: ( '.' write_expression )*
      while true # decision 16
        alt_16 = 2
        look_16_0 = @input.peek( 1 )

        if ( look_16_0 == DOT )
          alt_16 = 1

        end
        case alt_16
        when 1
          # at line 176:49: '.' write_expression
          char_literal67 = match( DOT, TOKENS_FOLLOWING_DOT_IN_write_statement_1060 )
          if @state.backtracking == 0
            tree_for_char_literal67 = @adaptor.create_with_payload( char_literal67 )
            @adaptor.add_child( root_0, tree_for_char_literal67 )

          end

          @state.following.push( TOKENS_FOLLOWING_write_expression_IN_write_statement_1062 )
          write_expression68 = write_expression
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, write_expression68.tree )
          end


          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             r_print 
            # <-- action
          end


        else
          break # out of loop for decision 16
        end
      end # loop for decision 16

      char_literal69 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_write_statement_1068 )
      if @state.backtracking == 0
        tree_for_char_literal69 = @adaptor.create_with_payload( char_literal69 )
        @adaptor.add_child( root_0, tree_for_char_literal69 )

      end

      @state.following.push( TOKENS_FOLLOWING_statement_end_IN_write_statement_1070 )
      statement_end70 = statement_end
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
        # trace_out( __method__, 18 )


      end

      return return_value
    end

    WriteExpressionReturnValue = define_return_scope

    #
    # parser rule write_expression
    #
    # (in Rubik.g)
    # 179:1: write_expression : expression ;
    #
    def write_expression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )


      return_value = WriteExpressionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      expression71 = nil



      begin
      root_0 = @adaptor.create_flat_list


      # at line 180:7: expression
      @state.following.push( TOKENS_FOLLOWING_expression_IN_write_expression_1088 )
      expression71 = expression
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, expression71.tree )
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
        # trace_out( __method__, 19 )


      end

      return return_value
    end

    ReadStatementReturnValue = define_return_scope

    #
    # parser rule read_statement
    #
    # (in Rubik.g)
    # 183:1: read_statement : 'gets' '(' ')' statement_end !;
    #
    def read_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )


      return_value = ReadStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal72 = nil
      char_literal73 = nil
      char_literal74 = nil
      statement_end75 = nil


      tree_for_string_literal72 = nil
      tree_for_char_literal73 = nil
      tree_for_char_literal74 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 184:7: 'gets' '(' ')' statement_end !
      string_literal72 = match( T__60, TOKENS_FOLLOWING_T__60_IN_read_statement_1105 )
      if @state.backtracking == 0
        tree_for_string_literal72 = @adaptor.create_with_payload( string_literal72 )
        @adaptor.add_child( root_0, tree_for_string_literal72 )

      end

      char_literal73 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_read_statement_1107 )
      if @state.backtracking == 0
        tree_for_char_literal73 = @adaptor.create_with_payload( char_literal73 )
        @adaptor.add_child( root_0, tree_for_char_literal73 )

      end

      char_literal74 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_read_statement_1109 )
      if @state.backtracking == 0
        tree_for_char_literal74 = @adaptor.create_with_payload( char_literal74 )
        @adaptor.add_child( root_0, tree_for_char_literal74 )

      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         r_gets 
        # <-- action
      end

      @state.following.push( TOKENS_FOLLOWING_statement_end_IN_read_statement_1113 )
      statement_end75 = statement_end
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
        # trace_out( __method__, 20 )


      end

      return return_value
    end

    LoopStatementReturnValue = define_return_scope

    #
    # parser rule loop_statement
    #
    # (in Rubik.g)
    # 187:1: loop_statement : 'do' exp 'times' block ;
    #
    def loop_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )


      return_value = LoopStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal76 = nil
      string_literal78 = nil
      exp77 = nil
      block79 = nil


      tree_for_string_literal76 = nil
      tree_for_string_literal78 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 188:7: 'do' exp 'times' block
      string_literal76 = match( DO, TOKENS_FOLLOWING_DO_IN_loop_statement_1131 )
      if @state.backtracking == 0
        tree_for_string_literal76 = @adaptor.create_with_payload( string_literal76 )
        @adaptor.add_child( root_0, tree_for_string_literal76 )

      end

      @state.following.push( TOKENS_FOLLOWING_exp_IN_loop_statement_1133 )
      exp77 = exp
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, exp77.tree )
      end

      string_literal78 = match( TIMES, TOKENS_FOLLOWING_TIMES_IN_loop_statement_1135 )
      if @state.backtracking == 0
        tree_for_string_literal78 = @adaptor.create_with_payload( string_literal78 )
        @adaptor.add_child( root_0, tree_for_string_literal78 )

      end

      @state.following.push( TOKENS_FOLLOWING_block_IN_loop_statement_1137 )
      block79 = block
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, block79.tree )
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
    # 191:1: function : 'def' VAR_TYPE variable_name function_parameters block ;
    #
    def function
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )


      return_value = FunctionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal80 = nil
      __VAR_TYPE81__ = nil
      variable_name82 = nil
      function_parameters83 = nil
      block84 = nil


      tree_for_string_literal80 = nil
      tree_for_VAR_TYPE81 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 195:7: 'def' VAR_TYPE variable_name function_parameters block
      string_literal80 = match( DEF, TOKENS_FOLLOWING_DEF_IN_function_1159 )
      if @state.backtracking == 0
        tree_for_string_literal80 = @adaptor.create_with_payload( string_literal80 )
        @adaptor.add_child( root_0, tree_for_string_literal80 )

      end

      __VAR_TYPE81__ = match( VAR_TYPE, TOKENS_FOLLOWING_VAR_TYPE_IN_function_1161 )
      if @state.backtracking == 0
        tree_for_VAR_TYPE81 = @adaptor.create_with_payload( __VAR_TYPE81__ )
        @adaptor.add_child( root_0, tree_for_VAR_TYPE81 )

      end

      @state.following.push( TOKENS_FOLLOWING_variable_name_IN_function_1163 )
      variable_name82 = variable_name
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, variable_name82.tree )
      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         @current_scope = ( variable_name82 && @input.to_s( variable_name82.start, variable_name82.stop ) ); func1(__VAR_TYPE81__.text) 
        # <-- action
      end

      @state.following.push( TOKENS_FOLLOWING_function_parameters_IN_function_1167 )
      function_parameters83 = function_parameters
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, function_parameters83.tree )
      end

      @state.following.push( TOKENS_FOLLOWING_block_IN_function_1169 )
      block84 = block
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, block84.tree )
      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         func3(( block84 && @input.to_s( block84.start, block84.stop ) )) 
        # <-- action
      end


      # - - - - - - - rule clean up - - - - - - - -
      return_value.stop = @input.look( -1 )


      if @state.backtracking == 0
        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      end

      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action

            @current_scope = '_'

        # <-- action
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
    # 198:1: function_parameters : '(' ( parameters )? ')' ;
    #
    def function_parameters
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 23 )


      return_value = FunctionParametersReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal85 = nil
      char_literal87 = nil
      parameters86 = nil


      tree_for_char_literal85 = nil
      tree_for_char_literal87 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 199:7: '(' ( parameters )? ')'
      char_literal85 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_function_parameters_1188 )
      if @state.backtracking == 0
        tree_for_char_literal85 = @adaptor.create_with_payload( char_literal85 )
        @adaptor.add_child( root_0, tree_for_char_literal85 )

      end

      # at line 199:11: ( parameters )?
      alt_17 = 2
      look_17_0 = @input.peek( 1 )

      if ( look_17_0 == VAR_TYPE )
        alt_17 = 1
      end
      case alt_17
      when 1
        # at line 199:11: parameters
        @state.following.push( TOKENS_FOLLOWING_parameters_IN_function_parameters_1190 )
        parameters86 = parameters
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, parameters86.tree )
        end


      end
      char_literal87 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_function_parameters_1193 )
      if @state.backtracking == 0
        tree_for_char_literal87 = @adaptor.create_with_payload( char_literal87 )
        @adaptor.add_child( root_0, tree_for_char_literal87 )

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
    # 202:1: parameters : VAR_TYPE variable_name ( ',' parameters )* ;
    #
    def parameters
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )


      return_value = ParametersReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __VAR_TYPE88__ = nil
      char_literal90 = nil
      variable_name89 = nil
      parameters91 = nil


      tree_for_VAR_TYPE88 = nil
      tree_for_char_literal90 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 203:7: VAR_TYPE variable_name ( ',' parameters )*
      __VAR_TYPE88__ = match( VAR_TYPE, TOKENS_FOLLOWING_VAR_TYPE_IN_parameters_1210 )
      if @state.backtracking == 0
        tree_for_VAR_TYPE88 = @adaptor.create_with_payload( __VAR_TYPE88__ )
        @adaptor.add_child( root_0, tree_for_VAR_TYPE88 )

      end

      @state.following.push( TOKENS_FOLLOWING_variable_name_IN_parameters_1212 )
      variable_name89 = variable_name
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, variable_name89.tree )
      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         func2(( variable_name89 && @input.to_s( variable_name89.start, variable_name89.stop ) ), __VAR_TYPE88__.text) 
        # <-- action
      end

      # at line 203:77: ( ',' parameters )*
      while true # decision 18
        alt_18 = 2
        look_18_0 = @input.peek( 1 )

        if ( look_18_0 == COMMA )
          alt_18 = 1

        end
        case alt_18
        when 1
          # at line 203:78: ',' parameters
          char_literal90 = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_parameters_1217 )
          if @state.backtracking == 0
            tree_for_char_literal90 = @adaptor.create_with_payload( char_literal90 )
            @adaptor.add_child( root_0, tree_for_char_literal90 )

          end

          @state.following.push( TOKENS_FOLLOWING_parameters_IN_parameters_1219 )
          parameters91 = parameters
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, parameters91.tree )
          end


        else
          break # out of loop for decision 18
        end
      end # loop for decision 18


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
    # 206:1: robot : ( 'change_color' '(' COLOR ')' | 'change_direction' '(' DIR ')' | 'draw_circle' '(' expression ')' | 'draw_square' '(' expression ')' | 'draw_triangle' '(' expression ')' | 'pen_down' '(' ')' | 'pen_up' '(' ')' | 'reset' '(' ')' | 'talk' '(' expression ')' | 'move' '(' expression ')' );
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
      # at line 207:5: ( 'change_color' '(' COLOR ')' | 'change_direction' '(' DIR ')' | 'draw_circle' '(' expression ')' | 'draw_square' '(' expression ')' | 'draw_triangle' '(' expression ')' | 'pen_down' '(' ')' | 'pen_up' '(' ')' | 'reset' '(' ')' | 'talk' '(' expression ')' | 'move' '(' expression ')' )
      alt_19 = 10
      case look_19 = @input.peek( 1 )
      when CHANGE_COLOR then alt_19 = 1
      when T__59 then alt_19 = 2
      when DRAW_CIRCLE then alt_19 = 3
      when DRAW_SQUARE then alt_19 = 4
      when DRAW_TRIANGLE then alt_19 = 5
      when PEN_DOWN then alt_19 = 6
      when PEN_UP then alt_19 = 7
      when R_RESET then alt_19 = 8
      when TLK then alt_19 = 9
      when R_MOVE then alt_19 = 10
      else
        @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )



        raise NoViableAlternative( "", 19, 0 )

      end
      case alt_19
      when 1
        root_0 = @adaptor.create_flat_list


        # at line 207:7: 'change_color' '(' COLOR ')'
        string_literal92 = match( CHANGE_COLOR, TOKENS_FOLLOWING_CHANGE_COLOR_IN_robot_1238 )
        if @state.backtracking == 0
          tree_for_string_literal92 = @adaptor.create_with_payload( string_literal92 )
          @adaptor.add_child( root_0, tree_for_string_literal92 )

        end

        char_literal93 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1240 )
        if @state.backtracking == 0
          tree_for_char_literal93 = @adaptor.create_with_payload( char_literal93 )
          @adaptor.add_child( root_0, tree_for_char_literal93 )

        end

        __COLOR94__ = match( COLOR, TOKENS_FOLLOWING_COLOR_IN_robot_1242 )
        if @state.backtracking == 0
          tree_for_COLOR94 = @adaptor.create_with_payload( __COLOR94__ )
          @adaptor.add_child( root_0, tree_for_COLOR94 )

        end

        char_literal95 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1244 )
        if @state.backtracking == 0
          tree_for_char_literal95 = @adaptor.create_with_payload( char_literal95 )
          @adaptor.add_child( root_0, tree_for_char_literal95 )

        end


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 208:7: 'change_direction' '(' DIR ')'
        string_literal96 = match( T__59, TOKENS_FOLLOWING_T__59_IN_robot_1252 )
        if @state.backtracking == 0
          tree_for_string_literal96 = @adaptor.create_with_payload( string_literal96 )
          @adaptor.add_child( root_0, tree_for_string_literal96 )

        end

        char_literal97 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1254 )
        if @state.backtracking == 0
          tree_for_char_literal97 = @adaptor.create_with_payload( char_literal97 )
          @adaptor.add_child( root_0, tree_for_char_literal97 )

        end

        __DIR98__ = match( DIR, TOKENS_FOLLOWING_DIR_IN_robot_1256 )
        if @state.backtracking == 0
          tree_for_DIR98 = @adaptor.create_with_payload( __DIR98__ )
          @adaptor.add_child( root_0, tree_for_DIR98 )

        end

        char_literal99 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1258 )
        if @state.backtracking == 0
          tree_for_char_literal99 = @adaptor.create_with_payload( char_literal99 )
          @adaptor.add_child( root_0, tree_for_char_literal99 )

        end


      when 3
        root_0 = @adaptor.create_flat_list


        # at line 209:7: 'draw_circle' '(' expression ')'
        string_literal100 = match( DRAW_CIRCLE, TOKENS_FOLLOWING_DRAW_CIRCLE_IN_robot_1266 )
        if @state.backtracking == 0
          tree_for_string_literal100 = @adaptor.create_with_payload( string_literal100 )
          @adaptor.add_child( root_0, tree_for_string_literal100 )

        end

        char_literal101 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1268 )
        if @state.backtracking == 0
          tree_for_char_literal101 = @adaptor.create_with_payload( char_literal101 )
          @adaptor.add_child( root_0, tree_for_char_literal101 )

        end

        @state.following.push( TOKENS_FOLLOWING_expression_IN_robot_1270 )
        expression102 = expression
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression102.tree )
        end

        char_literal103 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1272 )
        if @state.backtracking == 0
          tree_for_char_literal103 = @adaptor.create_with_payload( char_literal103 )
          @adaptor.add_child( root_0, tree_for_char_literal103 )

        end


      when 4
        root_0 = @adaptor.create_flat_list


        # at line 210:7: 'draw_square' '(' expression ')'
        string_literal104 = match( DRAW_SQUARE, TOKENS_FOLLOWING_DRAW_SQUARE_IN_robot_1280 )
        if @state.backtracking == 0
          tree_for_string_literal104 = @adaptor.create_with_payload( string_literal104 )
          @adaptor.add_child( root_0, tree_for_string_literal104 )

        end

        char_literal105 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1282 )
        if @state.backtracking == 0
          tree_for_char_literal105 = @adaptor.create_with_payload( char_literal105 )
          @adaptor.add_child( root_0, tree_for_char_literal105 )

        end

        @state.following.push( TOKENS_FOLLOWING_expression_IN_robot_1284 )
        expression106 = expression
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression106.tree )
        end

        char_literal107 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1286 )
        if @state.backtracking == 0
          tree_for_char_literal107 = @adaptor.create_with_payload( char_literal107 )
          @adaptor.add_child( root_0, tree_for_char_literal107 )

        end


      when 5
        root_0 = @adaptor.create_flat_list


        # at line 211:7: 'draw_triangle' '(' expression ')'
        string_literal108 = match( DRAW_TRIANGLE, TOKENS_FOLLOWING_DRAW_TRIANGLE_IN_robot_1294 )
        if @state.backtracking == 0
          tree_for_string_literal108 = @adaptor.create_with_payload( string_literal108 )
          @adaptor.add_child( root_0, tree_for_string_literal108 )

        end

        char_literal109 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1296 )
        if @state.backtracking == 0
          tree_for_char_literal109 = @adaptor.create_with_payload( char_literal109 )
          @adaptor.add_child( root_0, tree_for_char_literal109 )

        end

        @state.following.push( TOKENS_FOLLOWING_expression_IN_robot_1298 )
        expression110 = expression
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression110.tree )
        end

        char_literal111 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1300 )
        if @state.backtracking == 0
          tree_for_char_literal111 = @adaptor.create_with_payload( char_literal111 )
          @adaptor.add_child( root_0, tree_for_char_literal111 )

        end


      when 6
        root_0 = @adaptor.create_flat_list


        # at line 212:7: 'pen_down' '(' ')'
        string_literal112 = match( PEN_DOWN, TOKENS_FOLLOWING_PEN_DOWN_IN_robot_1308 )
        if @state.backtracking == 0
          tree_for_string_literal112 = @adaptor.create_with_payload( string_literal112 )
          @adaptor.add_child( root_0, tree_for_string_literal112 )

        end

        char_literal113 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1310 )
        if @state.backtracking == 0
          tree_for_char_literal113 = @adaptor.create_with_payload( char_literal113 )
          @adaptor.add_child( root_0, tree_for_char_literal113 )

        end

        char_literal114 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1312 )
        if @state.backtracking == 0
          tree_for_char_literal114 = @adaptor.create_with_payload( char_literal114 )
          @adaptor.add_child( root_0, tree_for_char_literal114 )

        end


      when 7
        root_0 = @adaptor.create_flat_list


        # at line 213:7: 'pen_up' '(' ')'
        string_literal115 = match( PEN_UP, TOKENS_FOLLOWING_PEN_UP_IN_robot_1320 )
        if @state.backtracking == 0
          tree_for_string_literal115 = @adaptor.create_with_payload( string_literal115 )
          @adaptor.add_child( root_0, tree_for_string_literal115 )

        end

        char_literal116 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1322 )
        if @state.backtracking == 0
          tree_for_char_literal116 = @adaptor.create_with_payload( char_literal116 )
          @adaptor.add_child( root_0, tree_for_char_literal116 )

        end

        char_literal117 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1324 )
        if @state.backtracking == 0
          tree_for_char_literal117 = @adaptor.create_with_payload( char_literal117 )
          @adaptor.add_child( root_0, tree_for_char_literal117 )

        end


      when 8
        root_0 = @adaptor.create_flat_list


        # at line 214:7: 'reset' '(' ')'
        string_literal118 = match( R_RESET, TOKENS_FOLLOWING_R_RESET_IN_robot_1332 )
        if @state.backtracking == 0
          tree_for_string_literal118 = @adaptor.create_with_payload( string_literal118 )
          @adaptor.add_child( root_0, tree_for_string_literal118 )

        end

        char_literal119 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1334 )
        if @state.backtracking == 0
          tree_for_char_literal119 = @adaptor.create_with_payload( char_literal119 )
          @adaptor.add_child( root_0, tree_for_char_literal119 )

        end

        char_literal120 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1336 )
        if @state.backtracking == 0
          tree_for_char_literal120 = @adaptor.create_with_payload( char_literal120 )
          @adaptor.add_child( root_0, tree_for_char_literal120 )

        end


      when 9
        root_0 = @adaptor.create_flat_list


        # at line 215:7: 'talk' '(' expression ')'
        string_literal121 = match( TLK, TOKENS_FOLLOWING_TLK_IN_robot_1344 )
        if @state.backtracking == 0
          tree_for_string_literal121 = @adaptor.create_with_payload( string_literal121 )
          @adaptor.add_child( root_0, tree_for_string_literal121 )

        end

        char_literal122 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1346 )
        if @state.backtracking == 0
          tree_for_char_literal122 = @adaptor.create_with_payload( char_literal122 )
          @adaptor.add_child( root_0, tree_for_char_literal122 )

        end

        @state.following.push( TOKENS_FOLLOWING_expression_IN_robot_1348 )
        expression123 = expression
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression123.tree )
        end

        char_literal124 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1350 )
        if @state.backtracking == 0
          tree_for_char_literal124 = @adaptor.create_with_payload( char_literal124 )
          @adaptor.add_child( root_0, tree_for_char_literal124 )

        end


      when 10
        root_0 = @adaptor.create_flat_list


        # at line 216:7: 'move' '(' expression ')'
        string_literal125 = match( R_MOVE, TOKENS_FOLLOWING_R_MOVE_IN_robot_1358 )
        if @state.backtracking == 0
          tree_for_string_literal125 = @adaptor.create_with_payload( string_literal125 )
          @adaptor.add_child( root_0, tree_for_string_literal125 )

        end

        char_literal126 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1360 )
        if @state.backtracking == 0
          tree_for_char_literal126 = @adaptor.create_with_payload( char_literal126 )
          @adaptor.add_child( root_0, tree_for_char_literal126 )

        end

        @state.following.push( TOKENS_FOLLOWING_expression_IN_robot_1362 )
        expression127 = expression
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression127.tree )
        end

        char_literal128 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1364 )
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
    # 221:1: variable_name : ID ;
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


      # at line 222:7: ID
      __ID129__ = match( ID, TOKENS_FOLLOWING_ID_IN_variable_name_1383 )
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
    # 227:1: primary : ( primitive | functions | arrays );
    #
    def primary
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )


      return_value = PrimaryReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      primitive130 = nil
      functions131 = nil
      arrays132 = nil



      begin
      # at line 228:5: ( primitive | functions | arrays )
      alt_20 = 3
      look_20_0 = @input.peek( 1 )

      if ( look_20_0 == BOOLEAN || look_20_0 == FLOAT || look_20_0 == INT || look_20_0 == STRING )
        alt_20 = 1
      elsif ( look_20_0 == ID )
        case look_20 = @input.peek( 2 )
        when EOF, COMMA, DEF, DIV, DO, DOT, ELSE, EQ, GEQ, GREATER, ID, IF, LBRACE, LEQ, LESS, MINUS, NEQ, PLUS, RBRACE, RBRAK, RPAREN, R_END, R_RETURN, SEMI, STAR, TIMES, VAR_TYPE, T__60, T__61 then alt_20 = 1
        when LPAREN then alt_20 = 2
        when LBRAK then alt_20 = 3
        else
          @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )



          raise NoViableAlternative( "", 20, 2 )

        end
      else
        @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )



        raise NoViableAlternative( "", 20, 0 )

      end
      case alt_20
      when 1
        root_0 = @adaptor.create_flat_list


        # at line 228:7: primitive
        @state.following.push( TOKENS_FOLLOWING_primitive_IN_primary_1402 )
        primitive130 = primitive
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, primitive130.tree )
        end


        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           exp1(input.look(-1).text,
                              (type = input.look(-1).name) && type.downcase) 
          # <-- action
        end


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 230:7: functions
        @state.following.push( TOKENS_FOLLOWING_functions_IN_primary_1412 )
        functions131 = functions
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, functions131.tree )
        end


      when 3
        root_0 = @adaptor.create_flat_list


        # at line 231:7: arrays
        @state.following.push( TOKENS_FOLLOWING_arrays_IN_primary_1420 )
        arrays132 = arrays
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, arrays132.tree )
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

    PrimitiveReturnValue = define_return_scope

    #
    # parser rule primitive
    #
    # (in Rubik.g)
    # 234:1: primitive : ( BOOLEAN | STRING | FLOAT | INT | variable_name );
    #
    def primitive
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )


      return_value = PrimitiveReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __BOOLEAN133__ = nil
      __STRING134__ = nil
      __FLOAT135__ = nil
      __INT136__ = nil
      variable_name137 = nil


      tree_for_BOOLEAN133 = nil
      tree_for_STRING134 = nil
      tree_for_FLOAT135 = nil
      tree_for_INT136 = nil

      begin
      # at line 235:5: ( BOOLEAN | STRING | FLOAT | INT | variable_name )
      alt_21 = 5
      case look_21 = @input.peek( 1 )
      when BOOLEAN then alt_21 = 1
      when STRING then alt_21 = 2
      when FLOAT then alt_21 = 3
      when INT then alt_21 = 4
      when ID then alt_21 = 5
      else
        @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )



        raise NoViableAlternative( "", 21, 0 )

      end
      case alt_21
      when 1
        root_0 = @adaptor.create_flat_list


        # at line 235:7: BOOLEAN
        __BOOLEAN133__ = match( BOOLEAN, TOKENS_FOLLOWING_BOOLEAN_IN_primitive_1437 )
        if @state.backtracking == 0
          tree_for_BOOLEAN133 = @adaptor.create_with_payload( __BOOLEAN133__ )
          @adaptor.add_child( root_0, tree_for_BOOLEAN133 )

        end


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 236:7: STRING
        __STRING134__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_primitive_1445 )
        if @state.backtracking == 0
          tree_for_STRING134 = @adaptor.create_with_payload( __STRING134__ )
          @adaptor.add_child( root_0, tree_for_STRING134 )

        end


      when 3
        root_0 = @adaptor.create_flat_list


        # at line 237:7: FLOAT
        __FLOAT135__ = match( FLOAT, TOKENS_FOLLOWING_FLOAT_IN_primitive_1453 )
        if @state.backtracking == 0
          tree_for_FLOAT135 = @adaptor.create_with_payload( __FLOAT135__ )
          @adaptor.add_child( root_0, tree_for_FLOAT135 )

        end


      when 4
        root_0 = @adaptor.create_flat_list


        # at line 238:7: INT
        __INT136__ = match( INT, TOKENS_FOLLOWING_INT_IN_primitive_1461 )
        if @state.backtracking == 0
          tree_for_INT136 = @adaptor.create_with_payload( __INT136__ )
          @adaptor.add_child( root_0, tree_for_INT136 )

        end


      when 5
        root_0 = @adaptor.create_flat_list


        # at line 239:7: variable_name
        @state.following.push( TOKENS_FOLLOWING_variable_name_IN_primitive_1469 )
        variable_name137 = variable_name
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, variable_name137.tree )
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
        # trace_out( __method__, 28 )


      end

      return return_value
    end

    ArraysReturnValue = define_return_scope

    #
    # parser rule arrays
    #
    # (in Rubik.g)
    # 242:1: arrays : variable_name '[' expression ']' ( '[' expression ']' )? ;
    #
    def arrays
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 29 )


      return_value = ArraysReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal139 = nil
      char_literal141 = nil
      char_literal142 = nil
      char_literal144 = nil
      variable_name138 = nil
      expression140 = nil
      expression143 = nil


      tree_for_char_literal139 = nil
      tree_for_char_literal141 = nil
      tree_for_char_literal142 = nil
      tree_for_char_literal144 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 243:7: variable_name '[' expression ']' ( '[' expression ']' )?
      @state.following.push( TOKENS_FOLLOWING_variable_name_IN_arrays_1486 )
      variable_name138 = variable_name
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, variable_name138.tree )
      end

      char_literal139 = match( LBRAK, TOKENS_FOLLOWING_LBRAK_IN_arrays_1488 )
      if @state.backtracking == 0
        tree_for_char_literal139 = @adaptor.create_with_payload( char_literal139 )
        @adaptor.add_child( root_0, tree_for_char_literal139 )

      end

      @state.following.push( TOKENS_FOLLOWING_expression_IN_arrays_1490 )
      expression140 = expression
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, expression140.tree )
      end

      char_literal141 = match( RBRAK, TOKENS_FOLLOWING_RBRAK_IN_arrays_1492 )
      if @state.backtracking == 0
        tree_for_char_literal141 = @adaptor.create_with_payload( char_literal141 )
        @adaptor.add_child( root_0, tree_for_char_literal141 )

      end

      # at line 243:40: ( '[' expression ']' )?
      alt_22 = 2
      look_22_0 = @input.peek( 1 )

      if ( look_22_0 == LBRAK )
        alt_22 = 1
      end
      case alt_22
      when 1
        # at line 243:41: '[' expression ']'
        char_literal142 = match( LBRAK, TOKENS_FOLLOWING_LBRAK_IN_arrays_1495 )
        if @state.backtracking == 0
          tree_for_char_literal142 = @adaptor.create_with_payload( char_literal142 )
          @adaptor.add_child( root_0, tree_for_char_literal142 )

        end

        @state.following.push( TOKENS_FOLLOWING_expression_IN_arrays_1497 )
        expression143 = expression
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression143.tree )
        end

        char_literal144 = match( RBRAK, TOKENS_FOLLOWING_RBRAK_IN_arrays_1499 )
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
        # trace_out( __method__, 29 )


      end

      return return_value
    end

    FunctionsReturnValue = define_return_scope

    #
    # parser rule functions
    #
    # (in Rubik.g)
    # 246:1: functions : variable_name '(' expression_list ')' ;
    #
    def functions
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )


      return_value = FunctionsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal146 = nil
      char_literal148 = nil
      variable_name145 = nil
      expression_list147 = nil


      tree_for_char_literal146 = nil
      tree_for_char_literal148 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 250:7: variable_name '(' expression_list ')'
      @state.following.push( TOKENS_FOLLOWING_variable_name_IN_functions_1523 )
      variable_name145 = variable_name
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, variable_name145.tree )
      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         call_func1(( variable_name145 && @input.to_s( variable_name145.start, variable_name145.stop ) )) 
        # <-- action
      end

      char_literal146 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_functions_1527 )
      if @state.backtracking == 0
        tree_for_char_literal146 = @adaptor.create_with_payload( char_literal146 )
        @adaptor.add_child( root_0, tree_for_char_literal146 )

      end

      @state.following.push( TOKENS_FOLLOWING_expression_list_IN_functions_1529 )
      expression_list147 = expression_list
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, expression_list147.tree )
      end

      char_literal148 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_functions_1531 )
      if @state.backtracking == 0
        tree_for_char_literal148 = @adaptor.create_with_payload( char_literal148 )
        @adaptor.add_child( root_0, tree_for_char_literal148 )

      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         call_func3 
        # <-- action
      end


      # - - - - - - - rule clean up - - - - - - - -
      return_value.stop = @input.look( -1 )


      if @state.backtracking == 0
        return_value.tree = @adaptor.rule_post_processing( root_0 )
        @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )

      end

      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action

            @current_function = nil

        # <-- action
      end

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )


      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 30 )


      end

      return return_value
    end

    ExpressionListReturnValue = define_return_scope

    #
    # parser rule expression_list
    #
    # (in Rubik.g)
    # 253:1: expression_list : expression ( ',' expression_list )* ;
    #
    def expression_list
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 31 )


      return_value = ExpressionListReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal150 = nil
      expression149 = nil
      expression_list151 = nil


      tree_for_char_literal150 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 254:7: expression ( ',' expression_list )*
      @state.following.push( TOKENS_FOLLOWING_expression_IN_expression_list_1550 )
      expression149 = expression
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, expression149.tree )
      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         call_func2 
        # <-- action
      end

      # at line 254:33: ( ',' expression_list )*
      while true # decision 23
        alt_23 = 2
        look_23_0 = @input.peek( 1 )

        if ( look_23_0 == COMMA )
          alt_23 = 1

        end
        case alt_23
        when 1
          # at line 254:34: ',' expression_list
          char_literal150 = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_expression_list_1555 )
          if @state.backtracking == 0
            tree_for_char_literal150 = @adaptor.create_with_payload( char_literal150 )
            @adaptor.add_child( root_0, tree_for_char_literal150 )

          end

          @state.following.push( TOKENS_FOLLOWING_expression_list_IN_expression_list_1557 )
          expression_list151 = expression_list
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, expression_list151.tree )
          end


        else
          break # out of loop for decision 23
        end
      end # loop for decision 23


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
        # trace_out( __method__, 31 )


      end

      return return_value
    end

    #
    # syntactic predicate synpred1_Rubik
    #
    # (in Rubik.g)
    # 111:7: synpred1_Rubik : '}' ;
    #
    # This is an imaginary rule inserted by ANTLR to
    # implement a syntactic predicate decision
    #
    def synpred1_Rubik
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 32 )


      # at line 111:9: '}'
      match( RBRACE, TOKENS_FOLLOWING_RBRACE_IN_synpred1_Rubik_632 )

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 32 )


    end


    TOKENS_FOLLOWING_R_BEGIN_IN_program_478 = Set[ 13, 16, 26, 27, 29, 50, 57, 60, 61 ]
    TOKENS_FOLLOWING_block_IN_program_480 = Set[ 13, 16, 26, 27, 29, 47, 50, 57, 60, 61 ]
    TOKENS_FOLLOWING_R_END_IN_program_483 = Set[ 1 ]
    TOKENS_FOLLOWING_statement_IN_block_500 = Set[ 1 ]
    TOKENS_FOLLOWING_statement_block_IN_block_508 = Set[ 1 ]
    TOKENS_FOLLOWING_LBRACE_IN_statement_block_525 = Set[ 13, 16, 26, 27, 43, 50, 57, 60, 61 ]
    TOKENS_FOLLOWING_statement_IN_statement_block_527 = Set[ 13, 16, 26, 27, 43, 50, 57, 60, 61 ]
    TOKENS_FOLLOWING_RBRACE_IN_statement_block_530 = Set[ 1 ]
    TOKENS_FOLLOWING_variable_statement_IN_statement_549 = Set[ 1 ]
    TOKENS_FOLLOWING_assignment_statement_IN_statement_557 = Set[ 1 ]
    TOKENS_FOLLOWING_condition_statement_IN_statement_565 = Set[ 1 ]
    TOKENS_FOLLOWING_write_statement_IN_statement_573 = Set[ 1 ]
    TOKENS_FOLLOWING_read_statement_IN_statement_581 = Set[ 1 ]
    TOKENS_FOLLOWING_loop_statement_IN_statement_589 = Set[ 1 ]
    TOKENS_FOLLOWING_return_statement_IN_statement_597 = Set[ 1 ]
    TOKENS_FOLLOWING_function_IN_statement_605 = Set[ 1 ]
    TOKENS_FOLLOWING_SEMI_IN_statement_end_622 = Set[ 1 ]
    TOKENS_FOLLOWING_EOF_IN_statement_end_643 = Set[ 1 ]
    TOKENS_FOLLOWING_R_RETURN_IN_return_statement_660 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_expression_IN_return_statement_662 = Set[ 51 ]
    TOKENS_FOLLOWING_statement_end_IN_return_statement_664 = Set[ 1 ]
    TOKENS_FOLLOWING_VAR_TYPE_IN_variable_statement_687 = Set[ 26 ]
    TOKENS_FOLLOWING_variable_declaration_list_IN_variable_statement_691 = Set[ 51 ]
    TOKENS_FOLLOWING_statement_end_IN_variable_statement_693 = Set[ 1 ]
    TOKENS_FOLLOWING_variable_declaration_IN_variable_declaration_list_711 = Set[ 1, 12 ]
    TOKENS_FOLLOWING_COMMA_IN_variable_declaration_list_714 = Set[ 26 ]
    TOKENS_FOLLOWING_variable_declaration_IN_variable_declaration_list_716 = Set[ 1, 12 ]
    TOKENS_FOLLOWING_declaration_target_IN_variable_declaration_735 = Set[ 1, 5 ]
    TOKENS_FOLLOWING_ASGN_IN_variable_declaration_738 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_expression_IN_variable_declaration_740 = Set[ 1 ]
    TOKENS_FOLLOWING_variable_name_IN_declaration_target_769 = Set[ 1, 30 ]
    TOKENS_FOLLOWING_LBRAK_IN_declaration_target_772 = Set[ 28 ]
    TOKENS_FOLLOWING_INT_IN_declaration_target_774 = Set[ 44 ]
    TOKENS_FOLLOWING_RBRAK_IN_declaration_target_776 = Set[ 1, 30 ]
    TOKENS_FOLLOWING_LBRAK_IN_declaration_target_781 = Set[ 28 ]
    TOKENS_FOLLOWING_INT_IN_declaration_target_783 = Set[ 44 ]
    TOKENS_FOLLOWING_RBRAK_IN_declaration_target_785 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_assignment_statement_804 = Set[ 5 ]
    TOKENS_FOLLOWING_ASGN_IN_assignment_statement_808 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_expression_IN_assignment_statement_812 = Set[ 51 ]
    TOKENS_FOLLOWING_statement_end_IN_assignment_statement_816 = Set[ 1 ]
    TOKENS_FOLLOWING_IF_IN_condition_statement_834 = Set[ 33 ]
    TOKENS_FOLLOWING_LPAREN_IN_condition_statement_836 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_expression_IN_condition_statement_838 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_condition_statement_840 = Set[ 13, 16, 26, 27, 29, 50, 57, 60, 61 ]
    TOKENS_FOLLOWING_block_IN_condition_statement_842 = Set[ 1, 21 ]
    TOKENS_FOLLOWING_ELSE_IN_condition_statement_845 = Set[ 13, 16, 26, 27, 29, 50, 57, 60, 61 ]
    TOKENS_FOLLOWING_block_IN_condition_statement_847 = Set[ 1 ]
    TOKENS_FOLLOWING_exp_IN_expression_866 = Set[ 1, 22, 24, 25, 31, 32, 36 ]
    TOKENS_FOLLOWING_relation_op_IN_expression_869 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_exp_IN_expression_873 = Set[ 1 ]
    TOKENS_FOLLOWING_term_IN_exp_951 = Set[ 1, 34, 42 ]
    TOKENS_FOLLOWING_set_IN_exp_956 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_exp_IN_exp_964 = Set[ 1 ]
    TOKENS_FOLLOWING_factor_IN_term_983 = Set[ 1, 15, 52 ]
    TOKENS_FOLLOWING_set_IN_term_988 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_term_IN_term_996 = Set[ 1 ]
    TOKENS_FOLLOWING_LPAREN_IN_factor_1015 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_expression_IN_factor_1019 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_factor_1021 = Set[ 1 ]
    TOKENS_FOLLOWING_MINUS_IN_factor_1031 = Set[ 7, 23, 26, 28, 53 ]
    TOKENS_FOLLOWING_primary_IN_factor_1034 = Set[ 1 ]
    TOKENS_FOLLOWING_T__61_IN_write_statement_1051 = Set[ 33 ]
    TOKENS_FOLLOWING_LPAREN_IN_write_statement_1053 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_write_expression_IN_write_statement_1055 = Set[ 17, 45 ]
    TOKENS_FOLLOWING_DOT_IN_write_statement_1060 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_write_expression_IN_write_statement_1062 = Set[ 17, 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_write_statement_1068 = Set[ 51 ]
    TOKENS_FOLLOWING_statement_end_IN_write_statement_1070 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_write_expression_1088 = Set[ 1 ]
    TOKENS_FOLLOWING_T__60_IN_read_statement_1105 = Set[ 33 ]
    TOKENS_FOLLOWING_LPAREN_IN_read_statement_1107 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_read_statement_1109 = Set[ 51 ]
    TOKENS_FOLLOWING_statement_end_IN_read_statement_1113 = Set[ 1 ]
    TOKENS_FOLLOWING_DO_IN_loop_statement_1131 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_exp_IN_loop_statement_1133 = Set[ 54 ]
    TOKENS_FOLLOWING_TIMES_IN_loop_statement_1135 = Set[ 13, 16, 26, 27, 29, 50, 57, 60, 61 ]
    TOKENS_FOLLOWING_block_IN_loop_statement_1137 = Set[ 1 ]
    TOKENS_FOLLOWING_DEF_IN_function_1159 = Set[ 57 ]
    TOKENS_FOLLOWING_VAR_TYPE_IN_function_1161 = Set[ 26 ]
    TOKENS_FOLLOWING_variable_name_IN_function_1163 = Set[ 33 ]
    TOKENS_FOLLOWING_function_parameters_IN_function_1167 = Set[ 13, 16, 26, 27, 29, 50, 57, 60, 61 ]
    TOKENS_FOLLOWING_block_IN_function_1169 = Set[ 1 ]
    TOKENS_FOLLOWING_LPAREN_IN_function_parameters_1188 = Set[ 45, 57 ]
    TOKENS_FOLLOWING_parameters_IN_function_parameters_1190 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_function_parameters_1193 = Set[ 1 ]
    TOKENS_FOLLOWING_VAR_TYPE_IN_parameters_1210 = Set[ 26 ]
    TOKENS_FOLLOWING_variable_name_IN_parameters_1212 = Set[ 1, 12 ]
    TOKENS_FOLLOWING_COMMA_IN_parameters_1217 = Set[ 57 ]
    TOKENS_FOLLOWING_parameters_IN_parameters_1219 = Set[ 1, 12 ]
    TOKENS_FOLLOWING_CHANGE_COLOR_IN_robot_1238 = Set[ 33 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1240 = Set[ 11 ]
    TOKENS_FOLLOWING_COLOR_IN_robot_1242 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1244 = Set[ 1 ]
    TOKENS_FOLLOWING_T__59_IN_robot_1252 = Set[ 33 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1254 = Set[ 14 ]
    TOKENS_FOLLOWING_DIR_IN_robot_1256 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1258 = Set[ 1 ]
    TOKENS_FOLLOWING_DRAW_CIRCLE_IN_robot_1266 = Set[ 33 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1268 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_expression_IN_robot_1270 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1272 = Set[ 1 ]
    TOKENS_FOLLOWING_DRAW_SQUARE_IN_robot_1280 = Set[ 33 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1282 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_expression_IN_robot_1284 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1286 = Set[ 1 ]
    TOKENS_FOLLOWING_DRAW_TRIANGLE_IN_robot_1294 = Set[ 33 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1296 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_expression_IN_robot_1298 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1300 = Set[ 1 ]
    TOKENS_FOLLOWING_PEN_DOWN_IN_robot_1308 = Set[ 33 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1310 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1312 = Set[ 1 ]
    TOKENS_FOLLOWING_PEN_UP_IN_robot_1320 = Set[ 33 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1322 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1324 = Set[ 1 ]
    TOKENS_FOLLOWING_R_RESET_IN_robot_1332 = Set[ 33 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1334 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1336 = Set[ 1 ]
    TOKENS_FOLLOWING_TLK_IN_robot_1344 = Set[ 33 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1346 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_expression_IN_robot_1348 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1350 = Set[ 1 ]
    TOKENS_FOLLOWING_R_MOVE_IN_robot_1358 = Set[ 33 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1360 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_expression_IN_robot_1362 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1364 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_variable_name_1383 = Set[ 1 ]
    TOKENS_FOLLOWING_primitive_IN_primary_1402 = Set[ 1 ]
    TOKENS_FOLLOWING_functions_IN_primary_1412 = Set[ 1 ]
    TOKENS_FOLLOWING_arrays_IN_primary_1420 = Set[ 1 ]
    TOKENS_FOLLOWING_BOOLEAN_IN_primitive_1437 = Set[ 1 ]
    TOKENS_FOLLOWING_STRING_IN_primitive_1445 = Set[ 1 ]
    TOKENS_FOLLOWING_FLOAT_IN_primitive_1453 = Set[ 1 ]
    TOKENS_FOLLOWING_INT_IN_primitive_1461 = Set[ 1 ]
    TOKENS_FOLLOWING_variable_name_IN_primitive_1469 = Set[ 1 ]
    TOKENS_FOLLOWING_variable_name_IN_arrays_1486 = Set[ 30 ]
    TOKENS_FOLLOWING_LBRAK_IN_arrays_1488 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_expression_IN_arrays_1490 = Set[ 44 ]
    TOKENS_FOLLOWING_RBRAK_IN_arrays_1492 = Set[ 1, 30 ]
    TOKENS_FOLLOWING_LBRAK_IN_arrays_1495 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_expression_IN_arrays_1497 = Set[ 44 ]
    TOKENS_FOLLOWING_RBRAK_IN_arrays_1499 = Set[ 1 ]
    TOKENS_FOLLOWING_variable_name_IN_functions_1523 = Set[ 33 ]
    TOKENS_FOLLOWING_LPAREN_IN_functions_1527 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_expression_list_IN_functions_1529 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_functions_1531 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_expression_list_1550 = Set[ 1, 12 ]
    TOKENS_FOLLOWING_COMMA_IN_expression_list_1555 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_expression_list_IN_expression_list_1557 = Set[ 1, 12 ]
    TOKENS_FOLLOWING_RBRACE_IN_synpred1_Rubik_632 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0

end
