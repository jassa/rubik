#!/usr/bin/env ruby
#
# Rubik.g
# --
# Generated using ANTLR version: 3.5
# Ruby runtime library version: 1.10.0
# Input grammar file: Rubik.g
# Generated at: 2013-11-09 17:52:55
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
    # 82:1: program : 'begin' ( block )+ 'end' ;
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


      # at line 83:7: 'begin' ( block )+ 'end'
      string_literal1 = match( R_BEGIN, TOKENS_FOLLOWING_R_BEGIN_IN_program_478 )
      if @state.backtracking == 0
        tree_for_string_literal1 = @adaptor.create_with_payload( string_literal1 )
        @adaptor.add_child( root_0, tree_for_string_literal1 )

      end

      # at file 83:15: ( block )+
      match_count_1 = 0
      while true
        alt_1 = 2
        look_1_0 = @input.peek( 1 )

        if ( look_1_0 == DEF || look_1_0 == DO || look_1_0.between?( ID, IF ) || look_1_0 == LBRACE || look_1_0 == R_RETURN || look_1_0 == VAR_TYPE || look_1_0 == T__61 )
          alt_1 = 1

        end
        case alt_1
        when 1
          # at line 83:15: block
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
    # 86:1: block : ( statement | statement_block );
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
      # at line 87:5: ( statement | statement_block )
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


        # at line 87:7: statement
        @state.following.push( TOKENS_FOLLOWING_statement_IN_block_500 )
        statement4 = statement
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, statement4.tree )
        end


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 88:7: statement_block
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
    # 91:1: statement_block : '{' ( statement )* '}' ;
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


      # at line 92:7: '{' ( statement )* '}'
      char_literal6 = match( LBRACE, TOKENS_FOLLOWING_LBRACE_IN_statement_block_525 )
      if @state.backtracking == 0
        tree_for_char_literal6 = @adaptor.create_with_payload( char_literal6 )
        @adaptor.add_child( root_0, tree_for_char_literal6 )

      end

      # at line 92:11: ( statement )*
      while true # decision 3
        alt_3 = 2
        look_3_0 = @input.peek( 1 )

        if ( look_3_0 == DEF || look_3_0 == DO || look_3_0.between?( ID, IF ) || look_3_0 == R_RETURN || look_3_0 == VAR_TYPE || look_3_0 == T__61 )
          alt_3 = 1

        end
        case alt_3
        when 1
          # at line 92:11: statement
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
    # 97:1: statement : ( variable_statement | assignment_statement | condition_statement | write_statement | loop_statement | return_statement | function );
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
      # at line 98:5: ( variable_statement | assignment_statement | condition_statement | write_statement | loop_statement | return_statement | function )
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


        # at line 98:7: variable_statement
        @state.following.push( TOKENS_FOLLOWING_variable_statement_IN_statement_549 )
        variable_statement9 = variable_statement
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, variable_statement9.tree )
        end


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 99:7: assignment_statement
        @state.following.push( TOKENS_FOLLOWING_assignment_statement_IN_statement_557 )
        assignment_statement10 = assignment_statement
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, assignment_statement10.tree )
        end


      when 3
        root_0 = @adaptor.create_flat_list


        # at line 100:7: condition_statement
        @state.following.push( TOKENS_FOLLOWING_condition_statement_IN_statement_565 )
        condition_statement11 = condition_statement
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, condition_statement11.tree )
        end


      when 4
        root_0 = @adaptor.create_flat_list


        # at line 101:7: write_statement
        @state.following.push( TOKENS_FOLLOWING_write_statement_IN_statement_573 )
        write_statement12 = write_statement
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, write_statement12.tree )
        end


      when 5
        root_0 = @adaptor.create_flat_list


        # at line 102:7: loop_statement
        @state.following.push( TOKENS_FOLLOWING_loop_statement_IN_statement_581 )
        loop_statement13 = loop_statement
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, loop_statement13.tree )
        end


      when 6
        root_0 = @adaptor.create_flat_list


        # at line 103:7: return_statement
        @state.following.push( TOKENS_FOLLOWING_return_statement_IN_statement_589 )
        return_statement14 = return_statement
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, return_statement14.tree )
        end


      when 7
        root_0 = @adaptor.create_flat_list


        # at line 104:7: function
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
    # 107:1: statement_end : ( ';' | ( '}' )=>| EOF );
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
      # at line 108:5: ( ';' | ( '}' )=>| EOF )
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


        # at line 108:7: ';'
        char_literal16 = match( SEMI, TOKENS_FOLLOWING_SEMI_IN_statement_end_614 )
        if @state.backtracking == 0
          tree_for_char_literal16 = @adaptor.create_with_payload( char_literal16 )
          @adaptor.add_child( root_0, tree_for_char_literal16 )

        end


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 109:7: ( '}' )=>

      when 3
        root_0 = @adaptor.create_flat_list


        # at line 110:7: EOF
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
    # 113:1: return_statement : 'return' expression statement_end !;
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


      # at line 114:7: 'return' expression statement_end !
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
    # 117:1: variable_statement : VAR_TYPE variable_declaration_list statement_end !;
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


      # at line 121:7: VAR_TYPE variable_declaration_list statement_end !
      __VAR_TYPE21__ = match( VAR_TYPE, TOKENS_FOLLOWING_VAR_TYPE_IN_variable_statement_679 )
      if @state.backtracking == 0
        tree_for_VAR_TYPE21 = @adaptor.create_with_payload( __VAR_TYPE21__ )
        @adaptor.add_child( root_0, tree_for_VAR_TYPE21 )

      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         @current_var_type = __VAR_TYPE21__.text 
        # <-- action
      end

      @state.following.push( TOKENS_FOLLOWING_variable_declaration_list_IN_variable_statement_683 )
      variable_declaration_list22 = variable_declaration_list
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, variable_declaration_list22.tree )
      end

      @state.following.push( TOKENS_FOLLOWING_statement_end_IN_variable_statement_685 )
      statement_end23 = statement_end
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
    # 124:1: variable_declaration_list : variable_declaration ( ',' variable_declaration )* ;
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


      # at line 125:7: variable_declaration ( ',' variable_declaration )*
      @state.following.push( TOKENS_FOLLOWING_variable_declaration_IN_variable_declaration_list_703 )
      variable_declaration24 = variable_declaration
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, variable_declaration24.tree )
      end

      # at line 125:28: ( ',' variable_declaration )*
      while true # decision 6
        alt_6 = 2
        look_6_0 = @input.peek( 1 )

        if ( look_6_0 == COMMA )
          alt_6 = 1

        end
        case alt_6
        when 1
          # at line 125:29: ',' variable_declaration
          char_literal25 = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_variable_declaration_list_706 )
          if @state.backtracking == 0
            tree_for_char_literal25 = @adaptor.create_with_payload( char_literal25 )
            @adaptor.add_child( root_0, tree_for_char_literal25 )

          end

          @state.following.push( TOKENS_FOLLOWING_variable_declaration_IN_variable_declaration_list_708 )
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
    # 128:1: variable_declaration : declaration_target ( '=' expression )? ;
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


      # at line 129:7: declaration_target ( '=' expression )?
      @state.following.push( TOKENS_FOLLOWING_declaration_target_IN_variable_declaration_727 )
      declaration_target27 = declaration_target
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, declaration_target27.tree )
      end

      # at line 129:26: ( '=' expression )?
      alt_7 = 2
      look_7_0 = @input.peek( 1 )

      if ( look_7_0 == ASGN )
        alt_7 = 1
      end
      case alt_7
      when 1
        # at line 129:27: '=' expression
        char_literal28 = match( ASGN, TOKENS_FOLLOWING_ASGN_IN_variable_declaration_730 )
        if @state.backtracking == 0
          tree_for_char_literal28 = @adaptor.create_with_payload( char_literal28 )
          @adaptor.add_child( root_0, tree_for_char_literal28 )

        end

        @state.following.push( TOKENS_FOLLOWING_expression_IN_variable_declaration_732 )
        expression29 = expression
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression29.tree )
        end


      end

      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action

                    define_variable(( declaration_target27 && @input.to_s( declaration_target27.start, declaration_target27.stop ) ), @current_var_type)
                
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
    # 135:1: declaration_target : variable_name ( '[' INT ']' )? ( '[' INT ']' )? ;
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


      # at line 136:7: variable_name ( '[' INT ']' )? ( '[' INT ']' )?
      @state.following.push( TOKENS_FOLLOWING_variable_name_IN_declaration_target_761 )
      variable_name30 = variable_name
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, variable_name30.tree )
      end

      # at line 136:21: ( '[' INT ']' )?
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
        # at line 136:22: '[' INT ']'
        char_literal31 = match( LBRAK, TOKENS_FOLLOWING_LBRAK_IN_declaration_target_764 )
        if @state.backtracking == 0
          tree_for_char_literal31 = @adaptor.create_with_payload( char_literal31 )
          @adaptor.add_child( root_0, tree_for_char_literal31 )

        end

        __INT32__ = match( INT, TOKENS_FOLLOWING_INT_IN_declaration_target_766 )
        if @state.backtracking == 0
          tree_for_INT32 = @adaptor.create_with_payload( __INT32__ )
          @adaptor.add_child( root_0, tree_for_INT32 )

        end

        char_literal33 = match( RBRAK, TOKENS_FOLLOWING_RBRAK_IN_declaration_target_768 )
        if @state.backtracking == 0
          tree_for_char_literal33 = @adaptor.create_with_payload( char_literal33 )
          @adaptor.add_child( root_0, tree_for_char_literal33 )

        end


      end
      # at line 136:36: ( '[' INT ']' )?
      alt_9 = 2
      look_9_0 = @input.peek( 1 )

      if ( look_9_0 == LBRAK )
        alt_9 = 1
      end
      case alt_9
      when 1
        # at line 136:37: '[' INT ']'
        char_literal34 = match( LBRAK, TOKENS_FOLLOWING_LBRAK_IN_declaration_target_773 )
        if @state.backtracking == 0
          tree_for_char_literal34 = @adaptor.create_with_payload( char_literal34 )
          @adaptor.add_child( root_0, tree_for_char_literal34 )

        end

        __INT35__ = match( INT, TOKENS_FOLLOWING_INT_IN_declaration_target_775 )
        if @state.backtracking == 0
          tree_for_INT35 = @adaptor.create_with_payload( __INT35__ )
          @adaptor.add_child( root_0, tree_for_INT35 )

        end

        char_literal36 = match( RBRAK, TOKENS_FOLLOWING_RBRAK_IN_declaration_target_777 )
        if @state.backtracking == 0
          tree_for_char_literal36 = @adaptor.create_with_payload( char_literal36 )
          @adaptor.add_child( root_0, tree_for_char_literal36 )

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
    # 139:1: assignment_statement : ID '=' expression statement_end !;
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


      # at line 140:7: ID '=' expression statement_end !
      __ID37__ = match( ID, TOKENS_FOLLOWING_ID_IN_assignment_statement_796 )
      if @state.backtracking == 0
        tree_for_ID37 = @adaptor.create_with_payload( __ID37__ )
        @adaptor.add_child( root_0, tree_for_ID37 )

      end

      char_literal38 = match( ASGN, TOKENS_FOLLOWING_ASGN_IN_assignment_statement_798 )
      if @state.backtracking == 0
        tree_for_char_literal38 = @adaptor.create_with_payload( char_literal38 )
        @adaptor.add_child( root_0, tree_for_char_literal38 )

      end

      @state.following.push( TOKENS_FOLLOWING_expression_IN_assignment_statement_800 )
      expression39 = expression
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, expression39.tree )
      end

      @state.following.push( TOKENS_FOLLOWING_statement_end_IN_assignment_statement_802 )
      statement_end40 = statement_end
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
    # 143:1: condition_statement : 'if' '(' expression ')' block ( 'else' block )? ;
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


      # at line 144:7: 'if' '(' expression ')' block ( 'else' block )?
      string_literal41 = match( IF, TOKENS_FOLLOWING_IF_IN_condition_statement_820 )
      if @state.backtracking == 0
        tree_for_string_literal41 = @adaptor.create_with_payload( string_literal41 )
        @adaptor.add_child( root_0, tree_for_string_literal41 )

      end

      char_literal42 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_condition_statement_822 )
      if @state.backtracking == 0
        tree_for_char_literal42 = @adaptor.create_with_payload( char_literal42 )
        @adaptor.add_child( root_0, tree_for_char_literal42 )

      end

      @state.following.push( TOKENS_FOLLOWING_expression_IN_condition_statement_824 )
      expression43 = expression
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, expression43.tree )
      end

      char_literal44 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_condition_statement_826 )
      if @state.backtracking == 0
        tree_for_char_literal44 = @adaptor.create_with_payload( char_literal44 )
        @adaptor.add_child( root_0, tree_for_char_literal44 )

      end

      @state.following.push( TOKENS_FOLLOWING_block_IN_condition_statement_828 )
      block45 = block
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, block45.tree )
      end

      # at line 144:37: ( 'else' block )?
      alt_10 = 2
      look_10_0 = @input.peek( 1 )

      if ( look_10_0 == ELSE )
        alt_10 = 1
      end
      case alt_10
      when 1
        # at line 144:38: 'else' block
        string_literal46 = match( ELSE, TOKENS_FOLLOWING_ELSE_IN_condition_statement_831 )
        if @state.backtracking == 0
          tree_for_string_literal46 = @adaptor.create_with_payload( string_literal46 )
          @adaptor.add_child( root_0, tree_for_string_literal46 )

        end

        @state.following.push( TOKENS_FOLLOWING_block_IN_condition_statement_833 )
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
    # 147:1: expression : exp ( relation_op exp )? ;
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


      # at line 148:7: exp ( relation_op exp )?
      @state.following.push( TOKENS_FOLLOWING_exp_IN_expression_852 )
      exp48 = exp
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, exp48.tree )
      end

      # at line 148:11: ( relation_op exp )?
      alt_11 = 2
      look_11_0 = @input.peek( 1 )

      if ( look_11_0 == EQ || look_11_0.between?( GEQ, GREATER ) || look_11_0.between?( LEQ, LESS ) || look_11_0 == NEQ )
        alt_11 = 1
      end
      case alt_11
      when 1
        # at line 148:12: relation_op exp
        @state.following.push( TOKENS_FOLLOWING_relation_op_IN_expression_855 )
        relation_op49 = relation_op
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, relation_op49.tree )
        end


        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           exp2(input.look(-1).text) 
          # <-- action
        end

        @state.following.push( TOKENS_FOLLOWING_exp_IN_expression_859 )
        exp50 = exp
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, exp50.tree )
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
    # 151:1: relation_op : ( '<' | '>' | '<=' | '>=' | '==' | '!=' );
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
    # 160:1: exp : term ( ( '+' | '-' ) exp )? ;
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


      # at line 161:7: term ( ( '+' | '-' ) exp )?
      @state.following.push( TOKENS_FOLLOWING_term_IN_exp_937 )
      term52 = term
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, term52.tree )
      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         exp4 
        # <-- action
      end

      # at line 161:21: ( ( '+' | '-' ) exp )?
      alt_12 = 2
      look_12_0 = @input.peek( 1 )

      if ( look_12_0 == MINUS || look_12_0 == PLUS )
        alt_12 = 1
      end
      case alt_12
      when 1
        # at line 161:22: ( '+' | '-' ) exp
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



        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           exp2(input.look(-1).text) 
          # <-- action
        end

        @state.following.push( TOKENS_FOLLOWING_exp_IN_exp_950 )
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
    # 164:1: term : factor ( ( '*' | '/' ) term )? ;
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


      # at line 165:7: factor ( ( '*' | '/' ) term )?
      @state.following.push( TOKENS_FOLLOWING_factor_IN_term_969 )
      factor55 = factor
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, factor55.tree )
      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         exp5 
        # <-- action
      end

      # at line 165:23: ( ( '*' | '/' ) term )?
      alt_13 = 2
      look_13_0 = @input.peek( 1 )

      if ( look_13_0 == DIV || look_13_0 == STAR )
        alt_13 = 1
      end
      case alt_13
      when 1
        # at line 165:24: ( '*' | '/' ) term
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



        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           exp2(input.look(-1).text) 
          # <-- action
        end

        @state.following.push( TOKENS_FOLLOWING_term_IN_term_982 )
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
    # 168:1: factor : ( '(' expression ')' | ( '-' )? primary );
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
      # at line 169:5: ( '(' expression ')' | ( '-' )? primary )
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


        # at line 169:7: '(' expression ')'
        char_literal58 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_factor_1001 )
        if @state.backtracking == 0
          tree_for_char_literal58 = @adaptor.create_with_payload( char_literal58 )
          @adaptor.add_child( root_0, tree_for_char_literal58 )

        end


        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           exp6 
          # <-- action
        end

        @state.following.push( TOKENS_FOLLOWING_expression_IN_factor_1005 )
        expression59 = expression
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression59.tree )
        end

        char_literal60 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_factor_1007 )
        if @state.backtracking == 0
          tree_for_char_literal60 = @adaptor.create_with_payload( char_literal60 )
          @adaptor.add_child( root_0, tree_for_char_literal60 )

        end


        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           exp7 
          # <-- action
        end


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 170:7: ( '-' )? primary
        # at line 170:7: ( '-' )?
        alt_14 = 2
        look_14_0 = @input.peek( 1 )

        if ( look_14_0 == MINUS )
          alt_14 = 1
        end
        case alt_14
        when 1
          # at line 170:7: '-'
          char_literal61 = match( MINUS, TOKENS_FOLLOWING_MINUS_IN_factor_1017 )
          if @state.backtracking == 0
            tree_for_char_literal61 = @adaptor.create_with_payload( char_literal61 )
            @adaptor.add_child( root_0, tree_for_char_literal61 )

          end


        end
        @state.following.push( TOKENS_FOLLOWING_primary_IN_factor_1020 )
        primary62 = primary
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, primary62.tree )
        end


        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           exp1(input.look(-1).text,
                          (type = input.look(-1).name) && type.downcase) 
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
        # trace_out( __method__, 17 )


      end

      return return_value
    end

    ExpressionListReturnValue = define_return_scope

    #
    # parser rule expression_list
    #
    # (in Rubik.g)
    # 174:1: expression_list : expression ( ',' expression )* ;
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


      # at line 175:7: expression ( ',' expression )*
      @state.following.push( TOKENS_FOLLOWING_expression_IN_expression_list_1039 )
      expression63 = expression
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, expression63.tree )
      end

      # at line 175:18: ( ',' expression )*
      while true # decision 16
        alt_16 = 2
        look_16_0 = @input.peek( 1 )

        if ( look_16_0 == COMMA )
          alt_16 = 1

        end
        case alt_16
        when 1
          # at line 175:19: ',' expression
          char_literal64 = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_expression_list_1042 )
          if @state.backtracking == 0
            tree_for_char_literal64 = @adaptor.create_with_payload( char_literal64 )
            @adaptor.add_child( root_0, tree_for_char_literal64 )

          end

          @state.following.push( TOKENS_FOLLOWING_expression_IN_expression_list_1044 )
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
    # 178:1: write_statement : 'print' '(' write_expression ( '.' write_expression )* ')' statement_end !;
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


      # at line 179:7: 'print' '(' write_expression ( '.' write_expression )* ')' statement_end !
      string_literal66 = match( T__61, TOKENS_FOLLOWING_T__61_IN_write_statement_1063 )
      if @state.backtracking == 0
        tree_for_string_literal66 = @adaptor.create_with_payload( string_literal66 )
        @adaptor.add_child( root_0, tree_for_string_literal66 )

      end

      char_literal67 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_write_statement_1065 )
      if @state.backtracking == 0
        tree_for_char_literal67 = @adaptor.create_with_payload( char_literal67 )
        @adaptor.add_child( root_0, tree_for_char_literal67 )

      end

      @state.following.push( TOKENS_FOLLOWING_write_expression_IN_write_statement_1067 )
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

      # at line 179:48: ( '.' write_expression )*
      while true # decision 17
        alt_17 = 2
        look_17_0 = @input.peek( 1 )

        if ( look_17_0 == DOT )
          alt_17 = 1

        end
        case alt_17
        when 1
          # at line 179:49: '.' write_expression
          char_literal69 = match( DOT, TOKENS_FOLLOWING_DOT_IN_write_statement_1072 )
          if @state.backtracking == 0
            tree_for_char_literal69 = @adaptor.create_with_payload( char_literal69 )
            @adaptor.add_child( root_0, tree_for_char_literal69 )

          end

          @state.following.push( TOKENS_FOLLOWING_write_expression_IN_write_statement_1074 )
          write_expression70 = write_expression
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, write_expression70.tree )
          end


          # syntactic predicate action gate test
          if @state.backtracking == 0
            # --> action
             r_print 
            # <-- action
          end


        else
          break # out of loop for decision 17
        end
      end # loop for decision 17

      char_literal71 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_write_statement_1080 )
      if @state.backtracking == 0
        tree_for_char_literal71 = @adaptor.create_with_payload( char_literal71 )
        @adaptor.add_child( root_0, tree_for_char_literal71 )

      end

      @state.following.push( TOKENS_FOLLOWING_statement_end_IN_write_statement_1082 )
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
    # 182:1: write_expression : ( expression | STRING );
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
      # at line 183:5: ( expression | STRING )
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


        # at line 183:7: expression
        @state.following.push( TOKENS_FOLLOWING_expression_IN_write_expression_1100 )
        expression73 = expression
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression73.tree )
        end


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 184:7: STRING
        __STRING74__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_write_expression_1108 )
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
    # 187:1: loop_statement : 'do' exp 'times' block ;
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


      # at line 188:7: 'do' exp 'times' block
      string_literal75 = match( DO, TOKENS_FOLLOWING_DO_IN_loop_statement_1125 )
      if @state.backtracking == 0
        tree_for_string_literal75 = @adaptor.create_with_payload( string_literal75 )
        @adaptor.add_child( root_0, tree_for_string_literal75 )

      end

      @state.following.push( TOKENS_FOLLOWING_exp_IN_loop_statement_1127 )
      exp76 = exp
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, exp76.tree )
      end

      string_literal77 = match( TIMES, TOKENS_FOLLOWING_TIMES_IN_loop_statement_1129 )
      if @state.backtracking == 0
        tree_for_string_literal77 = @adaptor.create_with_payload( string_literal77 )
        @adaptor.add_child( root_0, tree_for_string_literal77 )

      end

      @state.following.push( TOKENS_FOLLOWING_block_IN_loop_statement_1131 )
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
    # 191:1: function : 'def' VAR_TYPE variable_name function_parameters block ;
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


      # at line 195:7: 'def' VAR_TYPE variable_name function_parameters block
      string_literal79 = match( DEF, TOKENS_FOLLOWING_DEF_IN_function_1153 )
      if @state.backtracking == 0
        tree_for_string_literal79 = @adaptor.create_with_payload( string_literal79 )
        @adaptor.add_child( root_0, tree_for_string_literal79 )

      end

      __VAR_TYPE80__ = match( VAR_TYPE, TOKENS_FOLLOWING_VAR_TYPE_IN_function_1155 )
      if @state.backtracking == 0
        tree_for_VAR_TYPE80 = @adaptor.create_with_payload( __VAR_TYPE80__ )
        @adaptor.add_child( root_0, tree_for_VAR_TYPE80 )

      end

      @state.following.push( TOKENS_FOLLOWING_variable_name_IN_function_1157 )
      variable_name81 = variable_name
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, variable_name81.tree )
      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         @current_scope = ( variable_name81 && @input.to_s( variable_name81.start, variable_name81.stop ) ) 
        # <-- action
      end

      @state.following.push( TOKENS_FOLLOWING_function_parameters_IN_function_1161 )
      function_parameters82 = function_parameters
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, function_parameters82.tree )
      end

      @state.following.push( TOKENS_FOLLOWING_block_IN_function_1163 )
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
    # 208:1: function_parameters : '(' ( parameters )? ')' ;
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


      # at line 209:7: '(' ( parameters )? ')'
      char_literal84 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_function_parameters_1190 )
      if @state.backtracking == 0
        tree_for_char_literal84 = @adaptor.create_with_payload( char_literal84 )
        @adaptor.add_child( root_0, tree_for_char_literal84 )

      end

      # at line 209:11: ( parameters )?
      alt_19 = 2
      look_19_0 = @input.peek( 1 )

      if ( look_19_0 == VAR_TYPE )
        alt_19 = 1
      end
      case alt_19
      when 1
        # at line 209:11: parameters
        @state.following.push( TOKENS_FOLLOWING_parameters_IN_function_parameters_1192 )
        parameters85 = parameters
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, parameters85.tree )
        end


      end
      char_literal86 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_function_parameters_1195 )
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
    # 212:1: parameters : VAR_TYPE variable_name ( ',' VAR_TYPE variable_name )* ;
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


      # at line 213:7: VAR_TYPE variable_name ( ',' VAR_TYPE variable_name )*
      __VAR_TYPE87__ = match( VAR_TYPE, TOKENS_FOLLOWING_VAR_TYPE_IN_parameters_1212 )
      if @state.backtracking == 0
        tree_for_VAR_TYPE87 = @adaptor.create_with_payload( __VAR_TYPE87__ )
        @adaptor.add_child( root_0, tree_for_VAR_TYPE87 )

      end

      @state.following.push( TOKENS_FOLLOWING_variable_name_IN_parameters_1214 )
      variable_name88 = variable_name
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, variable_name88.tree )
      end

      # at line 213:30: ( ',' VAR_TYPE variable_name )*
      while true # decision 20
        alt_20 = 2
        look_20_0 = @input.peek( 1 )

        if ( look_20_0 == COMMA )
          alt_20 = 1

        end
        case alt_20
        when 1
          # at line 213:31: ',' VAR_TYPE variable_name
          char_literal89 = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_parameters_1217 )
          if @state.backtracking == 0
            tree_for_char_literal89 = @adaptor.create_with_payload( char_literal89 )
            @adaptor.add_child( root_0, tree_for_char_literal89 )

          end

          __VAR_TYPE90__ = match( VAR_TYPE, TOKENS_FOLLOWING_VAR_TYPE_IN_parameters_1219 )
          if @state.backtracking == 0
            tree_for_VAR_TYPE90 = @adaptor.create_with_payload( __VAR_TYPE90__ )
            @adaptor.add_child( root_0, tree_for_VAR_TYPE90 )

          end

          @state.following.push( TOKENS_FOLLOWING_variable_name_IN_parameters_1221 )
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
    # 216:1: robot : ( 'change_color' '(' COLOR ')' | 'change_direction' '(' DIR ')' | 'draw_circle' '(' expression ')' | 'draw_square' '(' expression ')' | 'draw_triangle' '(' expression ')' | 'pen_down' '(' ')' | 'pen_up' '(' ')' | 'reset' '(' ')' | 'talk' '(' expression ')' | 'move' '(' expression ')' );
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
      # at line 217:5: ( 'change_color' '(' COLOR ')' | 'change_direction' '(' DIR ')' | 'draw_circle' '(' expression ')' | 'draw_square' '(' expression ')' | 'draw_triangle' '(' expression ')' | 'pen_down' '(' ')' | 'pen_up' '(' ')' | 'reset' '(' ')' | 'talk' '(' expression ')' | 'move' '(' expression ')' )
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


        # at line 217:7: 'change_color' '(' COLOR ')'
        string_literal92 = match( CHANGE_COLOR, TOKENS_FOLLOWING_CHANGE_COLOR_IN_robot_1240 )
        if @state.backtracking == 0
          tree_for_string_literal92 = @adaptor.create_with_payload( string_literal92 )
          @adaptor.add_child( root_0, tree_for_string_literal92 )

        end

        char_literal93 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1242 )
        if @state.backtracking == 0
          tree_for_char_literal93 = @adaptor.create_with_payload( char_literal93 )
          @adaptor.add_child( root_0, tree_for_char_literal93 )

        end

        __COLOR94__ = match( COLOR, TOKENS_FOLLOWING_COLOR_IN_robot_1244 )
        if @state.backtracking == 0
          tree_for_COLOR94 = @adaptor.create_with_payload( __COLOR94__ )
          @adaptor.add_child( root_0, tree_for_COLOR94 )

        end

        char_literal95 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1246 )
        if @state.backtracking == 0
          tree_for_char_literal95 = @adaptor.create_with_payload( char_literal95 )
          @adaptor.add_child( root_0, tree_for_char_literal95 )

        end


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 218:7: 'change_direction' '(' DIR ')'
        string_literal96 = match( T__60, TOKENS_FOLLOWING_T__60_IN_robot_1254 )
        if @state.backtracking == 0
          tree_for_string_literal96 = @adaptor.create_with_payload( string_literal96 )
          @adaptor.add_child( root_0, tree_for_string_literal96 )

        end

        char_literal97 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1256 )
        if @state.backtracking == 0
          tree_for_char_literal97 = @adaptor.create_with_payload( char_literal97 )
          @adaptor.add_child( root_0, tree_for_char_literal97 )

        end

        __DIR98__ = match( DIR, TOKENS_FOLLOWING_DIR_IN_robot_1258 )
        if @state.backtracking == 0
          tree_for_DIR98 = @adaptor.create_with_payload( __DIR98__ )
          @adaptor.add_child( root_0, tree_for_DIR98 )

        end

        char_literal99 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1260 )
        if @state.backtracking == 0
          tree_for_char_literal99 = @adaptor.create_with_payload( char_literal99 )
          @adaptor.add_child( root_0, tree_for_char_literal99 )

        end


      when 3
        root_0 = @adaptor.create_flat_list


        # at line 219:7: 'draw_circle' '(' expression ')'
        string_literal100 = match( DRAW_CIRCLE, TOKENS_FOLLOWING_DRAW_CIRCLE_IN_robot_1268 )
        if @state.backtracking == 0
          tree_for_string_literal100 = @adaptor.create_with_payload( string_literal100 )
          @adaptor.add_child( root_0, tree_for_string_literal100 )

        end

        char_literal101 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1270 )
        if @state.backtracking == 0
          tree_for_char_literal101 = @adaptor.create_with_payload( char_literal101 )
          @adaptor.add_child( root_0, tree_for_char_literal101 )

        end

        @state.following.push( TOKENS_FOLLOWING_expression_IN_robot_1272 )
        expression102 = expression
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression102.tree )
        end

        char_literal103 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1274 )
        if @state.backtracking == 0
          tree_for_char_literal103 = @adaptor.create_with_payload( char_literal103 )
          @adaptor.add_child( root_0, tree_for_char_literal103 )

        end


      when 4
        root_0 = @adaptor.create_flat_list


        # at line 220:7: 'draw_square' '(' expression ')'
        string_literal104 = match( DRAW_SQUARE, TOKENS_FOLLOWING_DRAW_SQUARE_IN_robot_1282 )
        if @state.backtracking == 0
          tree_for_string_literal104 = @adaptor.create_with_payload( string_literal104 )
          @adaptor.add_child( root_0, tree_for_string_literal104 )

        end

        char_literal105 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1284 )
        if @state.backtracking == 0
          tree_for_char_literal105 = @adaptor.create_with_payload( char_literal105 )
          @adaptor.add_child( root_0, tree_for_char_literal105 )

        end

        @state.following.push( TOKENS_FOLLOWING_expression_IN_robot_1286 )
        expression106 = expression
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression106.tree )
        end

        char_literal107 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1288 )
        if @state.backtracking == 0
          tree_for_char_literal107 = @adaptor.create_with_payload( char_literal107 )
          @adaptor.add_child( root_0, tree_for_char_literal107 )

        end


      when 5
        root_0 = @adaptor.create_flat_list


        # at line 221:7: 'draw_triangle' '(' expression ')'
        string_literal108 = match( DRAW_TRIANGLE, TOKENS_FOLLOWING_DRAW_TRIANGLE_IN_robot_1296 )
        if @state.backtracking == 0
          tree_for_string_literal108 = @adaptor.create_with_payload( string_literal108 )
          @adaptor.add_child( root_0, tree_for_string_literal108 )

        end

        char_literal109 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1298 )
        if @state.backtracking == 0
          tree_for_char_literal109 = @adaptor.create_with_payload( char_literal109 )
          @adaptor.add_child( root_0, tree_for_char_literal109 )

        end

        @state.following.push( TOKENS_FOLLOWING_expression_IN_robot_1300 )
        expression110 = expression
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression110.tree )
        end

        char_literal111 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1302 )
        if @state.backtracking == 0
          tree_for_char_literal111 = @adaptor.create_with_payload( char_literal111 )
          @adaptor.add_child( root_0, tree_for_char_literal111 )

        end


      when 6
        root_0 = @adaptor.create_flat_list


        # at line 222:7: 'pen_down' '(' ')'
        string_literal112 = match( PEN_DOWN, TOKENS_FOLLOWING_PEN_DOWN_IN_robot_1310 )
        if @state.backtracking == 0
          tree_for_string_literal112 = @adaptor.create_with_payload( string_literal112 )
          @adaptor.add_child( root_0, tree_for_string_literal112 )

        end

        char_literal113 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1312 )
        if @state.backtracking == 0
          tree_for_char_literal113 = @adaptor.create_with_payload( char_literal113 )
          @adaptor.add_child( root_0, tree_for_char_literal113 )

        end

        char_literal114 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1314 )
        if @state.backtracking == 0
          tree_for_char_literal114 = @adaptor.create_with_payload( char_literal114 )
          @adaptor.add_child( root_0, tree_for_char_literal114 )

        end


      when 7
        root_0 = @adaptor.create_flat_list


        # at line 223:7: 'pen_up' '(' ')'
        string_literal115 = match( PEN_UP, TOKENS_FOLLOWING_PEN_UP_IN_robot_1322 )
        if @state.backtracking == 0
          tree_for_string_literal115 = @adaptor.create_with_payload( string_literal115 )
          @adaptor.add_child( root_0, tree_for_string_literal115 )

        end

        char_literal116 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1324 )
        if @state.backtracking == 0
          tree_for_char_literal116 = @adaptor.create_with_payload( char_literal116 )
          @adaptor.add_child( root_0, tree_for_char_literal116 )

        end

        char_literal117 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1326 )
        if @state.backtracking == 0
          tree_for_char_literal117 = @adaptor.create_with_payload( char_literal117 )
          @adaptor.add_child( root_0, tree_for_char_literal117 )

        end


      when 8
        root_0 = @adaptor.create_flat_list


        # at line 224:7: 'reset' '(' ')'
        string_literal118 = match( R_RESET, TOKENS_FOLLOWING_R_RESET_IN_robot_1334 )
        if @state.backtracking == 0
          tree_for_string_literal118 = @adaptor.create_with_payload( string_literal118 )
          @adaptor.add_child( root_0, tree_for_string_literal118 )

        end

        char_literal119 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1336 )
        if @state.backtracking == 0
          tree_for_char_literal119 = @adaptor.create_with_payload( char_literal119 )
          @adaptor.add_child( root_0, tree_for_char_literal119 )

        end

        char_literal120 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1338 )
        if @state.backtracking == 0
          tree_for_char_literal120 = @adaptor.create_with_payload( char_literal120 )
          @adaptor.add_child( root_0, tree_for_char_literal120 )

        end


      when 9
        root_0 = @adaptor.create_flat_list


        # at line 225:7: 'talk' '(' expression ')'
        string_literal121 = match( TLK, TOKENS_FOLLOWING_TLK_IN_robot_1346 )
        if @state.backtracking == 0
          tree_for_string_literal121 = @adaptor.create_with_payload( string_literal121 )
          @adaptor.add_child( root_0, tree_for_string_literal121 )

        end

        char_literal122 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1348 )
        if @state.backtracking == 0
          tree_for_char_literal122 = @adaptor.create_with_payload( char_literal122 )
          @adaptor.add_child( root_0, tree_for_char_literal122 )

        end

        @state.following.push( TOKENS_FOLLOWING_expression_IN_robot_1350 )
        expression123 = expression
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression123.tree )
        end

        char_literal124 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1352 )
        if @state.backtracking == 0
          tree_for_char_literal124 = @adaptor.create_with_payload( char_literal124 )
          @adaptor.add_child( root_0, tree_for_char_literal124 )

        end


      when 10
        root_0 = @adaptor.create_flat_list


        # at line 226:7: 'move' '(' expression ')'
        string_literal125 = match( R_MOVE, TOKENS_FOLLOWING_R_MOVE_IN_robot_1360 )
        if @state.backtracking == 0
          tree_for_string_literal125 = @adaptor.create_with_payload( string_literal125 )
          @adaptor.add_child( root_0, tree_for_string_literal125 )

        end

        char_literal126 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1362 )
        if @state.backtracking == 0
          tree_for_char_literal126 = @adaptor.create_with_payload( char_literal126 )
          @adaptor.add_child( root_0, tree_for_char_literal126 )

        end

        @state.following.push( TOKENS_FOLLOWING_expression_IN_robot_1364 )
        expression127 = expression
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression127.tree )
        end

        char_literal128 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1366 )
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
    # 231:1: variable_name : ID ;
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


      # at line 232:7: ID
      __ID129__ = match( ID, TOKENS_FOLLOWING_ID_IN_variable_name_1385 )
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
    # 237:1: primary : ( BOOLEAN | CHAR | FLOAT | INT | variable_name | variable_name '[' expression ']' ( '[' expression ']' )? | variable_name '(' expression_list ')' );
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
      char_literal136 = nil
      char_literal138 = nil
      char_literal139 = nil
      char_literal141 = nil
      char_literal143 = nil
      char_literal145 = nil
      variable_name134 = nil
      variable_name135 = nil
      expression137 = nil
      expression140 = nil
      variable_name142 = nil
      expression_list144 = nil


      tree_for_BOOLEAN130 = nil
      tree_for_CHAR131 = nil
      tree_for_FLOAT132 = nil
      tree_for_INT133 = nil
      tree_for_char_literal136 = nil
      tree_for_char_literal138 = nil
      tree_for_char_literal139 = nil
      tree_for_char_literal141 = nil
      tree_for_char_literal143 = nil
      tree_for_char_literal145 = nil

      begin
      # at line 238:5: ( BOOLEAN | CHAR | FLOAT | INT | variable_name | variable_name '[' expression ']' ( '[' expression ']' )? | variable_name '(' expression_list ')' )
      alt_23 = 7
      case look_23 = @input.peek( 1 )
      when BOOLEAN then alt_23 = 1
      when CHAR then alt_23 = 2
      when FLOAT then alt_23 = 3
      when INT then alt_23 = 4
      when ID then case look_23 = @input.peek( 2 )
      when EOF, COMMA, DEF, DIV, DO, DOT, ELSE, EQ, GEQ, GREATER, ID, IF, LBRACE, LEQ, LESS, MINUS, NEQ, PLUS, RBRACE, RBRAK, RPAREN, R_END, R_RETURN, SEMI, STAR, TIMES, VAR_TYPE, T__61 then alt_23 = 5
      when LBRAK then alt_23 = 6
      when LPAREN then alt_23 = 7
      else
        @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )



        raise NoViableAlternative( "", 23, 5 )

      end
      else
        @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )



        raise NoViableAlternative( "", 23, 0 )

      end
      case alt_23
      when 1
        root_0 = @adaptor.create_flat_list


        # at line 238:7: BOOLEAN
        __BOOLEAN130__ = match( BOOLEAN, TOKENS_FOLLOWING_BOOLEAN_IN_primary_1404 )
        if @state.backtracking == 0
          tree_for_BOOLEAN130 = @adaptor.create_with_payload( __BOOLEAN130__ )
          @adaptor.add_child( root_0, tree_for_BOOLEAN130 )

        end


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 239:7: CHAR
        __CHAR131__ = match( CHAR, TOKENS_FOLLOWING_CHAR_IN_primary_1412 )
        if @state.backtracking == 0
          tree_for_CHAR131 = @adaptor.create_with_payload( __CHAR131__ )
          @adaptor.add_child( root_0, tree_for_CHAR131 )

        end


      when 3
        root_0 = @adaptor.create_flat_list


        # at line 240:7: FLOAT
        __FLOAT132__ = match( FLOAT, TOKENS_FOLLOWING_FLOAT_IN_primary_1420 )
        if @state.backtracking == 0
          tree_for_FLOAT132 = @adaptor.create_with_payload( __FLOAT132__ )
          @adaptor.add_child( root_0, tree_for_FLOAT132 )

        end


      when 4
        root_0 = @adaptor.create_flat_list


        # at line 241:7: INT
        __INT133__ = match( INT, TOKENS_FOLLOWING_INT_IN_primary_1428 )
        if @state.backtracking == 0
          tree_for_INT133 = @adaptor.create_with_payload( __INT133__ )
          @adaptor.add_child( root_0, tree_for_INT133 )

        end


      when 5
        root_0 = @adaptor.create_flat_list


        # at line 242:7: variable_name
        @state.following.push( TOKENS_FOLLOWING_variable_name_IN_primary_1436 )
        variable_name134 = variable_name
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, variable_name134.tree )
        end


      when 6
        root_0 = @adaptor.create_flat_list


        # at line 243:7: variable_name '[' expression ']' ( '[' expression ']' )?
        @state.following.push( TOKENS_FOLLOWING_variable_name_IN_primary_1444 )
        variable_name135 = variable_name
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, variable_name135.tree )
        end

        char_literal136 = match( LBRAK, TOKENS_FOLLOWING_LBRAK_IN_primary_1446 )
        if @state.backtracking == 0
          tree_for_char_literal136 = @adaptor.create_with_payload( char_literal136 )
          @adaptor.add_child( root_0, tree_for_char_literal136 )

        end

        @state.following.push( TOKENS_FOLLOWING_expression_IN_primary_1448 )
        expression137 = expression
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression137.tree )
        end

        char_literal138 = match( RBRAK, TOKENS_FOLLOWING_RBRAK_IN_primary_1450 )
        if @state.backtracking == 0
          tree_for_char_literal138 = @adaptor.create_with_payload( char_literal138 )
          @adaptor.add_child( root_0, tree_for_char_literal138 )

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
          char_literal139 = match( LBRAK, TOKENS_FOLLOWING_LBRAK_IN_primary_1453 )
          if @state.backtracking == 0
            tree_for_char_literal139 = @adaptor.create_with_payload( char_literal139 )
            @adaptor.add_child( root_0, tree_for_char_literal139 )

          end

          @state.following.push( TOKENS_FOLLOWING_expression_IN_primary_1455 )
          expression140 = expression
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, expression140.tree )
          end

          char_literal141 = match( RBRAK, TOKENS_FOLLOWING_RBRAK_IN_primary_1457 )
          if @state.backtracking == 0
            tree_for_char_literal141 = @adaptor.create_with_payload( char_literal141 )
            @adaptor.add_child( root_0, tree_for_char_literal141 )

          end


        end

      when 7
        root_0 = @adaptor.create_flat_list


        # at line 244:7: variable_name '(' expression_list ')'
        @state.following.push( TOKENS_FOLLOWING_variable_name_IN_primary_1467 )
        variable_name142 = variable_name
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, variable_name142.tree )
        end

        char_literal143 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_primary_1469 )
        if @state.backtracking == 0
          tree_for_char_literal143 = @adaptor.create_with_payload( char_literal143 )
          @adaptor.add_child( root_0, tree_for_char_literal143 )

        end

        @state.following.push( TOKENS_FOLLOWING_expression_list_IN_primary_1471 )
        expression_list144 = expression_list
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression_list144.tree )
        end

        char_literal145 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_primary_1473 )
        if @state.backtracking == 0
          tree_for_char_literal145 = @adaptor.create_with_payload( char_literal145 )
          @adaptor.add_child( root_0, tree_for_char_literal145 )

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
    # 109:7: synpred1_Rubik : '}' ;
    #
    # This is an imaginary rule inserted by ANTLR to
    # implement a syntactic predicate decision
    #
    def synpred1_Rubik
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )


      # at line 109:9: '}'
      match( RBRACE, TOKENS_FOLLOWING_RBRACE_IN_synpred1_Rubik_624 )

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 28 )


    end


    TOKENS_FOLLOWING_R_BEGIN_IN_program_478 = Set[ 14, 17, 27, 28, 30, 51, 58, 61 ]
    TOKENS_FOLLOWING_block_IN_program_480 = Set[ 14, 17, 27, 28, 30, 48, 51, 58, 61 ]
    TOKENS_FOLLOWING_R_END_IN_program_483 = Set[ 1 ]
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
    TOKENS_FOLLOWING_VAR_TYPE_IN_variable_statement_679 = Set[ 27 ]
    TOKENS_FOLLOWING_variable_declaration_list_IN_variable_statement_683 = Set[ 52 ]
    TOKENS_FOLLOWING_statement_end_IN_variable_statement_685 = Set[ 1 ]
    TOKENS_FOLLOWING_variable_declaration_IN_variable_declaration_list_703 = Set[ 1, 13 ]
    TOKENS_FOLLOWING_COMMA_IN_variable_declaration_list_706 = Set[ 27 ]
    TOKENS_FOLLOWING_variable_declaration_IN_variable_declaration_list_708 = Set[ 1, 13 ]
    TOKENS_FOLLOWING_declaration_target_IN_variable_declaration_727 = Set[ 1, 5 ]
    TOKENS_FOLLOWING_ASGN_IN_variable_declaration_730 = Set[ 7, 11, 24, 27, 29, 34, 35 ]
    TOKENS_FOLLOWING_expression_IN_variable_declaration_732 = Set[ 1 ]
    TOKENS_FOLLOWING_variable_name_IN_declaration_target_761 = Set[ 1, 31 ]
    TOKENS_FOLLOWING_LBRAK_IN_declaration_target_764 = Set[ 29 ]
    TOKENS_FOLLOWING_INT_IN_declaration_target_766 = Set[ 45 ]
    TOKENS_FOLLOWING_RBRAK_IN_declaration_target_768 = Set[ 1, 31 ]
    TOKENS_FOLLOWING_LBRAK_IN_declaration_target_773 = Set[ 29 ]
    TOKENS_FOLLOWING_INT_IN_declaration_target_775 = Set[ 45 ]
    TOKENS_FOLLOWING_RBRAK_IN_declaration_target_777 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_assignment_statement_796 = Set[ 5 ]
    TOKENS_FOLLOWING_ASGN_IN_assignment_statement_798 = Set[ 7, 11, 24, 27, 29, 34, 35 ]
    TOKENS_FOLLOWING_expression_IN_assignment_statement_800 = Set[ 52 ]
    TOKENS_FOLLOWING_statement_end_IN_assignment_statement_802 = Set[ 1 ]
    TOKENS_FOLLOWING_IF_IN_condition_statement_820 = Set[ 34 ]
    TOKENS_FOLLOWING_LPAREN_IN_condition_statement_822 = Set[ 7, 11, 24, 27, 29, 34, 35 ]
    TOKENS_FOLLOWING_expression_IN_condition_statement_824 = Set[ 46 ]
    TOKENS_FOLLOWING_RPAREN_IN_condition_statement_826 = Set[ 14, 17, 27, 28, 30, 51, 58, 61 ]
    TOKENS_FOLLOWING_block_IN_condition_statement_828 = Set[ 1, 22 ]
    TOKENS_FOLLOWING_ELSE_IN_condition_statement_831 = Set[ 14, 17, 27, 28, 30, 51, 58, 61 ]
    TOKENS_FOLLOWING_block_IN_condition_statement_833 = Set[ 1 ]
    TOKENS_FOLLOWING_exp_IN_expression_852 = Set[ 1, 23, 25, 26, 32, 33, 37 ]
    TOKENS_FOLLOWING_relation_op_IN_expression_855 = Set[ 7, 11, 24, 27, 29, 34, 35 ]
    TOKENS_FOLLOWING_exp_IN_expression_859 = Set[ 1 ]
    TOKENS_FOLLOWING_term_IN_exp_937 = Set[ 1, 35, 43 ]
    TOKENS_FOLLOWING_set_IN_exp_942 = Set[ 7, 11, 24, 27, 29, 34, 35 ]
    TOKENS_FOLLOWING_exp_IN_exp_950 = Set[ 1 ]
    TOKENS_FOLLOWING_factor_IN_term_969 = Set[ 1, 16, 53 ]
    TOKENS_FOLLOWING_set_IN_term_974 = Set[ 7, 11, 24, 27, 29, 34, 35 ]
    TOKENS_FOLLOWING_term_IN_term_982 = Set[ 1 ]
    TOKENS_FOLLOWING_LPAREN_IN_factor_1001 = Set[ 7, 11, 24, 27, 29, 34, 35 ]
    TOKENS_FOLLOWING_expression_IN_factor_1005 = Set[ 46 ]
    TOKENS_FOLLOWING_RPAREN_IN_factor_1007 = Set[ 1 ]
    TOKENS_FOLLOWING_MINUS_IN_factor_1017 = Set[ 7, 11, 24, 27, 29 ]
    TOKENS_FOLLOWING_primary_IN_factor_1020 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_expression_list_1039 = Set[ 1, 13 ]
    TOKENS_FOLLOWING_COMMA_IN_expression_list_1042 = Set[ 7, 11, 24, 27, 29, 34, 35 ]
    TOKENS_FOLLOWING_expression_IN_expression_list_1044 = Set[ 1, 13 ]
    TOKENS_FOLLOWING_T__61_IN_write_statement_1063 = Set[ 34 ]
    TOKENS_FOLLOWING_LPAREN_IN_write_statement_1065 = Set[ 7, 11, 24, 27, 29, 34, 35, 54 ]
    TOKENS_FOLLOWING_write_expression_IN_write_statement_1067 = Set[ 18, 46 ]
    TOKENS_FOLLOWING_DOT_IN_write_statement_1072 = Set[ 7, 11, 24, 27, 29, 34, 35, 54 ]
    TOKENS_FOLLOWING_write_expression_IN_write_statement_1074 = Set[ 18, 46 ]
    TOKENS_FOLLOWING_RPAREN_IN_write_statement_1080 = Set[ 52 ]
    TOKENS_FOLLOWING_statement_end_IN_write_statement_1082 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_write_expression_1100 = Set[ 1 ]
    TOKENS_FOLLOWING_STRING_IN_write_expression_1108 = Set[ 1 ]
    TOKENS_FOLLOWING_DO_IN_loop_statement_1125 = Set[ 7, 11, 24, 27, 29, 34, 35 ]
    TOKENS_FOLLOWING_exp_IN_loop_statement_1127 = Set[ 55 ]
    TOKENS_FOLLOWING_TIMES_IN_loop_statement_1129 = Set[ 14, 17, 27, 28, 30, 51, 58, 61 ]
    TOKENS_FOLLOWING_block_IN_loop_statement_1131 = Set[ 1 ]
    TOKENS_FOLLOWING_DEF_IN_function_1153 = Set[ 58 ]
    TOKENS_FOLLOWING_VAR_TYPE_IN_function_1155 = Set[ 27 ]
    TOKENS_FOLLOWING_variable_name_IN_function_1157 = Set[ 34 ]
    TOKENS_FOLLOWING_function_parameters_IN_function_1161 = Set[ 14, 17, 27, 28, 30, 51, 58, 61 ]
    TOKENS_FOLLOWING_block_IN_function_1163 = Set[ 1 ]
    TOKENS_FOLLOWING_LPAREN_IN_function_parameters_1190 = Set[ 46, 58 ]
    TOKENS_FOLLOWING_parameters_IN_function_parameters_1192 = Set[ 46 ]
    TOKENS_FOLLOWING_RPAREN_IN_function_parameters_1195 = Set[ 1 ]
    TOKENS_FOLLOWING_VAR_TYPE_IN_parameters_1212 = Set[ 27 ]
    TOKENS_FOLLOWING_variable_name_IN_parameters_1214 = Set[ 1, 13 ]
    TOKENS_FOLLOWING_COMMA_IN_parameters_1217 = Set[ 58 ]
    TOKENS_FOLLOWING_VAR_TYPE_IN_parameters_1219 = Set[ 27 ]
    TOKENS_FOLLOWING_variable_name_IN_parameters_1221 = Set[ 1, 13 ]
    TOKENS_FOLLOWING_CHANGE_COLOR_IN_robot_1240 = Set[ 34 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1242 = Set[ 12 ]
    TOKENS_FOLLOWING_COLOR_IN_robot_1244 = Set[ 46 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1246 = Set[ 1 ]
    TOKENS_FOLLOWING_T__60_IN_robot_1254 = Set[ 34 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1256 = Set[ 15 ]
    TOKENS_FOLLOWING_DIR_IN_robot_1258 = Set[ 46 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1260 = Set[ 1 ]
    TOKENS_FOLLOWING_DRAW_CIRCLE_IN_robot_1268 = Set[ 34 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1270 = Set[ 7, 11, 24, 27, 29, 34, 35 ]
    TOKENS_FOLLOWING_expression_IN_robot_1272 = Set[ 46 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1274 = Set[ 1 ]
    TOKENS_FOLLOWING_DRAW_SQUARE_IN_robot_1282 = Set[ 34 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1284 = Set[ 7, 11, 24, 27, 29, 34, 35 ]
    TOKENS_FOLLOWING_expression_IN_robot_1286 = Set[ 46 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1288 = Set[ 1 ]
    TOKENS_FOLLOWING_DRAW_TRIANGLE_IN_robot_1296 = Set[ 34 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1298 = Set[ 7, 11, 24, 27, 29, 34, 35 ]
    TOKENS_FOLLOWING_expression_IN_robot_1300 = Set[ 46 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1302 = Set[ 1 ]
    TOKENS_FOLLOWING_PEN_DOWN_IN_robot_1310 = Set[ 34 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1312 = Set[ 46 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1314 = Set[ 1 ]
    TOKENS_FOLLOWING_PEN_UP_IN_robot_1322 = Set[ 34 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1324 = Set[ 46 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1326 = Set[ 1 ]
    TOKENS_FOLLOWING_R_RESET_IN_robot_1334 = Set[ 34 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1336 = Set[ 46 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1338 = Set[ 1 ]
    TOKENS_FOLLOWING_TLK_IN_robot_1346 = Set[ 34 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1348 = Set[ 7, 11, 24, 27, 29, 34, 35 ]
    TOKENS_FOLLOWING_expression_IN_robot_1350 = Set[ 46 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1352 = Set[ 1 ]
    TOKENS_FOLLOWING_R_MOVE_IN_robot_1360 = Set[ 34 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1362 = Set[ 7, 11, 24, 27, 29, 34, 35 ]
    TOKENS_FOLLOWING_expression_IN_robot_1364 = Set[ 46 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1366 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_variable_name_1385 = Set[ 1 ]
    TOKENS_FOLLOWING_BOOLEAN_IN_primary_1404 = Set[ 1 ]
    TOKENS_FOLLOWING_CHAR_IN_primary_1412 = Set[ 1 ]
    TOKENS_FOLLOWING_FLOAT_IN_primary_1420 = Set[ 1 ]
    TOKENS_FOLLOWING_INT_IN_primary_1428 = Set[ 1 ]
    TOKENS_FOLLOWING_variable_name_IN_primary_1436 = Set[ 1 ]
    TOKENS_FOLLOWING_variable_name_IN_primary_1444 = Set[ 31 ]
    TOKENS_FOLLOWING_LBRAK_IN_primary_1446 = Set[ 7, 11, 24, 27, 29, 34, 35 ]
    TOKENS_FOLLOWING_expression_IN_primary_1448 = Set[ 45 ]
    TOKENS_FOLLOWING_RBRAK_IN_primary_1450 = Set[ 1, 31 ]
    TOKENS_FOLLOWING_LBRAK_IN_primary_1453 = Set[ 7, 11, 24, 27, 29, 34, 35 ]
    TOKENS_FOLLOWING_expression_IN_primary_1455 = Set[ 45 ]
    TOKENS_FOLLOWING_RBRAK_IN_primary_1457 = Set[ 1 ]
    TOKENS_FOLLOWING_variable_name_IN_primary_1467 = Set[ 34 ]
    TOKENS_FOLLOWING_LPAREN_IN_primary_1469 = Set[ 7, 11, 24, 27, 29, 34, 35 ]
    TOKENS_FOLLOWING_expression_list_IN_primary_1471 = Set[ 46 ]
    TOKENS_FOLLOWING_RPAREN_IN_primary_1473 = Set[ 1 ]
    TOKENS_FOLLOWING_RBRACE_IN_synpred1_Rubik_624 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0

end
