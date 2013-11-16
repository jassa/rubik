#!/usr/bin/env ruby
#
# Rubik.g
# --
# Generated using ANTLR version: 3.5
# Ruby runtime library version: 1.10.0
# Input grammar file: Rubik.g
# Generated at: 2013-11-18 12:12:30
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


          @inserta_fin = 0
          @check_bool = "not bool"
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
    # 84:1: program : ( function )* 'begin' statement_end ! ( block )+ 'end' statement_end !;
    #
    def program
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 1 )


      return_value = ProgramReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal2 = nil
      string_literal5 = nil
      function1 = nil
      statement_end3 = nil
      block4 = nil
      statement_end6 = nil


      tree_for_string_literal2 = nil
      tree_for_string_literal5 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 85:7: ( function )* 'begin' statement_end ! ( block )+ 'end' statement_end !
      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         goto_main 
        # <-- action
      end

      # at line 85:21: ( function )*
      while true # decision 1
        alt_1 = 2
        look_1_0 = @input.peek( 1 )

        if ( look_1_0 == DEF )
          alt_1 = 1

        end
        case alt_1
        when 1
          # at line 85:21: function
          @state.following.push( TOKENS_FOLLOWING_function_IN_program_480 )
          function1 = function
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, function1.tree )
          end


        else
          break # out of loop for decision 1
        end
      end # loop for decision 1

      string_literal2 = match( R_BEGIN, TOKENS_FOLLOWING_R_BEGIN_IN_program_483 )
      if @state.backtracking == 0
        tree_for_string_literal2 = @adaptor.create_with_payload( string_literal2 )
        @adaptor.add_child( root_0, tree_for_string_literal2 )

      end

      @state.following.push( TOKENS_FOLLOWING_statement_end_IN_program_485 )
      statement_end3 = statement_end
      @state.following.pop

      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         fill_main 
        # <-- action
      end

      # at file 86:9: ( block )+
      match_count_2 = 0
      while true
        alt_2 = 2
        look_2_0 = @input.peek( 1 )

        if ( look_2_0 == DEF || look_2_0 == DO || look_2_0.between?( ID, IF ) || look_2_0 == LBRACE || look_2_0 == R_RETURN || look_2_0 == VAR_TYPE || look_2_0.between?( T__60, T__61 ) )
          alt_2 = 1

        end
        case alt_2
        when 1
          # at line 86:9: block
          @state.following.push( TOKENS_FOLLOWING_block_IN_program_498 )
          block4 = block
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, block4.tree )
          end


        else
          match_count_2 > 0 and break
          @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )


          eee = EarlyExit(2)


          raise eee
        end
        match_count_2 += 1
      end


      string_literal5 = match( R_END, TOKENS_FOLLOWING_R_END_IN_program_501 )
      if @state.backtracking == 0
        tree_for_string_literal5 = @adaptor.create_with_payload( string_literal5 )
        @adaptor.add_child( root_0, tree_for_string_literal5 )

      end

      @state.following.push( TOKENS_FOLLOWING_statement_end_IN_program_503 )
      statement_end6 = statement_end
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
        # trace_out( __method__, 1 )


      end

      return return_value
    end

    BlockReturnValue = define_return_scope

    #
    # parser rule block
    #
    # (in Rubik.g)
    # 89:1: block : ( statement | statement_block );
    #
    def block
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 2 )


      return_value = BlockReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      statement7 = nil
      statement_block8 = nil



      begin
      # at line 90:5: ( statement | statement_block )
      alt_3 = 2
      look_3_0 = @input.peek( 1 )

      if ( look_3_0 == DEF || look_3_0 == DO || look_3_0.between?( ID, IF ) || look_3_0 == R_RETURN || look_3_0 == VAR_TYPE || look_3_0.between?( T__60, T__61 ) )
        alt_3 = 1
      elsif ( look_3_0 == LBRACE )
        alt_3 = 2
      else
        @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )



        raise NoViableAlternative( "", 3, 0 )

      end
      case alt_3
      when 1
        root_0 = @adaptor.create_flat_list


        # at line 90:7: statement
        @state.following.push( TOKENS_FOLLOWING_statement_IN_block_521 )
        statement7 = statement
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, statement7.tree )
        end


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 91:7: statement_block
        @state.following.push( TOKENS_FOLLOWING_statement_block_IN_block_529 )
        statement_block8 = statement_block
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, statement_block8.tree )
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
    # 94:1: statement_block : '{' ( statement )* '}' ;
    #
    def statement_block
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 3 )


      return_value = StatementBlockReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal9 = nil
      char_literal11 = nil
      statement10 = nil


      tree_for_char_literal9 = nil
      tree_for_char_literal11 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 95:7: '{' ( statement )* '}'
      char_literal9 = match( LBRACE, TOKENS_FOLLOWING_LBRACE_IN_statement_block_546 )
      if @state.backtracking == 0
        tree_for_char_literal9 = @adaptor.create_with_payload( char_literal9 )
        @adaptor.add_child( root_0, tree_for_char_literal9 )

      end

      # at line 95:11: ( statement )*
      while true # decision 4
        alt_4 = 2
        look_4_0 = @input.peek( 1 )

        if ( look_4_0 == DEF || look_4_0 == DO || look_4_0.between?( ID, IF ) || look_4_0 == R_RETURN || look_4_0 == VAR_TYPE || look_4_0.between?( T__60, T__61 ) )
          alt_4 = 1

        end
        case alt_4
        when 1
          # at line 95:11: statement
          @state.following.push( TOKENS_FOLLOWING_statement_IN_statement_block_548 )
          statement10 = statement
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, statement10.tree )
          end


        else
          break # out of loop for decision 4
        end
      end # loop for decision 4

      char_literal11 = match( RBRACE, TOKENS_FOLLOWING_RBRACE_IN_statement_block_551 )
      if @state.backtracking == 0
        tree_for_char_literal11 = @adaptor.create_with_payload( char_literal11 )
        @adaptor.add_child( root_0, tree_for_char_literal11 )

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
    # 100:1: statement : ( variable_statement | assignment_statement | condition_statement | write_statement | read_statement | loop_statement | return_statement | function );
    #
    def statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 4 )


      return_value = StatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      variable_statement12 = nil
      assignment_statement13 = nil
      condition_statement14 = nil
      write_statement15 = nil
      read_statement16 = nil
      loop_statement17 = nil
      return_statement18 = nil
      function19 = nil



      begin
      # at line 101:5: ( variable_statement | assignment_statement | condition_statement | write_statement | read_statement | loop_statement | return_statement | function )
      alt_5 = 8
      case look_5 = @input.peek( 1 )
      when VAR_TYPE then alt_5 = 1
      when ID then alt_5 = 2
      when IF then alt_5 = 3
      when T__61 then alt_5 = 4
      when T__60 then alt_5 = 5
      when DO then alt_5 = 6
      when R_RETURN then alt_5 = 7
      when DEF then alt_5 = 8
      else
        @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )



        raise NoViableAlternative( "", 5, 0 )

      end
      case alt_5
      when 1
        root_0 = @adaptor.create_flat_list


        # at line 101:7: variable_statement
        @state.following.push( TOKENS_FOLLOWING_variable_statement_IN_statement_570 )
        variable_statement12 = variable_statement
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, variable_statement12.tree )
        end


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 102:7: assignment_statement
        @state.following.push( TOKENS_FOLLOWING_assignment_statement_IN_statement_578 )
        assignment_statement13 = assignment_statement
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, assignment_statement13.tree )
        end


      when 3
        root_0 = @adaptor.create_flat_list


        # at line 103:7: condition_statement
        @state.following.push( TOKENS_FOLLOWING_condition_statement_IN_statement_586 )
        condition_statement14 = condition_statement
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, condition_statement14.tree )
        end


      when 4
        root_0 = @adaptor.create_flat_list


        # at line 104:7: write_statement
        @state.following.push( TOKENS_FOLLOWING_write_statement_IN_statement_594 )
        write_statement15 = write_statement
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, write_statement15.tree )
        end


      when 5
        root_0 = @adaptor.create_flat_list


        # at line 105:7: read_statement
        @state.following.push( TOKENS_FOLLOWING_read_statement_IN_statement_602 )
        read_statement16 = read_statement
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, read_statement16.tree )
        end


      when 6
        root_0 = @adaptor.create_flat_list


        # at line 106:7: loop_statement
        @state.following.push( TOKENS_FOLLOWING_loop_statement_IN_statement_610 )
        loop_statement17 = loop_statement
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, loop_statement17.tree )
        end


      when 7
        root_0 = @adaptor.create_flat_list


        # at line 107:7: return_statement
        @state.following.push( TOKENS_FOLLOWING_return_statement_IN_statement_618 )
        return_statement18 = return_statement
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, return_statement18.tree )
        end


      when 8
        root_0 = @adaptor.create_flat_list


        # at line 108:7: function
        @state.following.push( TOKENS_FOLLOWING_function_IN_statement_626 )
        function19 = function
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, function19.tree )
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
    # 111:1: statement_end : ( ';' | ( '}' )=>| EOF );
    #
    def statement_end
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 5 )


      return_value = StatementEndReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal20 = nil
      __EOF21__ = nil


      tree_for_char_literal20 = nil
      tree_for_EOF21 = nil

      begin
      # at line 112:5: ( ';' | ( '}' )=>| EOF )
      alt_6 = 3
      look_6_0 = @input.peek( 1 )

      if ( look_6_0 == SEMI )
        alt_6 = 1
      elsif ( look_6_0 == VAR_TYPE ) and ( syntactic_predicate?( :synpred1_Rubik ) )
        alt_6 = 2
      elsif ( look_6_0 == ID ) and ( syntactic_predicate?( :synpred1_Rubik ) )
        alt_6 = 2
      elsif ( look_6_0 == IF ) and ( syntactic_predicate?( :synpred1_Rubik ) )
        alt_6 = 2
      elsif ( look_6_0 == T__61 ) and ( syntactic_predicate?( :synpred1_Rubik ) )
        alt_6 = 2
      elsif ( look_6_0 == T__60 ) and ( syntactic_predicate?( :synpred1_Rubik ) )
        alt_6 = 2
      elsif ( look_6_0 == DO ) and ( syntactic_predicate?( :synpred1_Rubik ) )
        alt_6 = 2
      elsif ( look_6_0 == R_RETURN ) and ( syntactic_predicate?( :synpred1_Rubik ) )
        alt_6 = 2
      elsif ( look_6_0 == DEF ) and ( syntactic_predicate?( :synpred1_Rubik ) )
        alt_6 = 2
      elsif ( look_6_0 == LBRACE ) and ( syntactic_predicate?( :synpred1_Rubik ) )
        alt_6 = 2
      elsif ( look_6_0 == EOF )
        look_6_11 = @input.peek( 2 )

        if ( look_6_11 == EOF || look_6_11 == DEF || look_6_11 == DO || look_6_11 == ELSE || look_6_11.between?( ID, IF ) || look_6_11 == LBRACE || look_6_11 == RBRACE || look_6_11.between?( R_BEGIN, R_END ) || look_6_11 == R_RETURN || look_6_11 == VAR_TYPE || look_6_11.between?( T__60, T__61 ) )
          alt_6 = 3
        else
          @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )



          raise NoViableAlternative( "", 6, 11 )

        end
      elsif ( look_6_0 == R_END ) and ( syntactic_predicate?( :synpred1_Rubik ) )
        alt_6 = 2
      elsif ( look_6_0 == ELSE ) and ( syntactic_predicate?( :synpred1_Rubik ) )
        alt_6 = 2
      elsif ( look_6_0 == R_BEGIN ) and ( syntactic_predicate?( :synpred1_Rubik ) )
        alt_6 = 2
      elsif ( look_6_0 == RBRACE ) and ( syntactic_predicate?( :synpred1_Rubik ) )
        alt_6 = 2
      else
        @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )



        raise NoViableAlternative( "", 6, 0 )

      end
      case alt_6
      when 1
        root_0 = @adaptor.create_flat_list


        # at line 112:7: ';'
        char_literal20 = match( SEMI, TOKENS_FOLLOWING_SEMI_IN_statement_end_643 )
        if @state.backtracking == 0
          tree_for_char_literal20 = @adaptor.create_with_payload( char_literal20 )
          @adaptor.add_child( root_0, tree_for_char_literal20 )

        end


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 113:7: ( '}' )=>

      when 3
        root_0 = @adaptor.create_flat_list


        # at line 114:7: EOF
        __EOF21__ = match( EOF, TOKENS_FOLLOWING_EOF_IN_statement_end_664 )
        if @state.backtracking == 0
          tree_for_EOF21 = @adaptor.create_with_payload( __EOF21__ )
          @adaptor.add_child( root_0, tree_for_EOF21 )

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
    # 117:1: return_statement : 'return' expression statement_end !;
    #
    def return_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 6 )


      return_value = ReturnStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal22 = nil
      expression23 = nil
      statement_end24 = nil


      tree_for_string_literal22 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 118:7: 'return' expression statement_end !
      string_literal22 = match( R_RETURN, TOKENS_FOLLOWING_R_RETURN_IN_return_statement_681 )
      if @state.backtracking == 0
        tree_for_string_literal22 = @adaptor.create_with_payload( string_literal22 )
        @adaptor.add_child( root_0, tree_for_string_literal22 )

      end

      @state.following.push( TOKENS_FOLLOWING_expression_IN_return_statement_683 )
      expression23 = expression
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, expression23.tree )
      end

      @state.following.push( TOKENS_FOLLOWING_statement_end_IN_return_statement_685 )
      statement_end24 = statement_end
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
    # 121:1: variable_statement : VAR_TYPE variable_declaration_list statement_end !;
    #
    def variable_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 7 )


      return_value = VariableStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __VAR_TYPE25__ = nil
      variable_declaration_list26 = nil
      statement_end27 = nil


      tree_for_VAR_TYPE25 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 125:7: VAR_TYPE variable_declaration_list statement_end !
      __VAR_TYPE25__ = match( VAR_TYPE, TOKENS_FOLLOWING_VAR_TYPE_IN_variable_statement_708 )
      if @state.backtracking == 0
        tree_for_VAR_TYPE25 = @adaptor.create_with_payload( __VAR_TYPE25__ )
        @adaptor.add_child( root_0, tree_for_VAR_TYPE25 )

      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         @current_var_type = __VAR_TYPE25__.text 
        # <-- action
      end

      @state.following.push( TOKENS_FOLLOWING_variable_declaration_list_IN_variable_statement_712 )
      variable_declaration_list26 = variable_declaration_list
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, variable_declaration_list26.tree )
      end

      @state.following.push( TOKENS_FOLLOWING_statement_end_IN_variable_statement_714 )
      statement_end27 = statement_end
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
    # 128:1: variable_declaration_list : variable_declaration ( ',' variable_declaration )* ;
    #
    def variable_declaration_list
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 8 )


      return_value = VariableDeclarationListReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal29 = nil
      variable_declaration28 = nil
      variable_declaration30 = nil


      tree_for_char_literal29 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 129:7: variable_declaration ( ',' variable_declaration )*
      @state.following.push( TOKENS_FOLLOWING_variable_declaration_IN_variable_declaration_list_732 )
      variable_declaration28 = variable_declaration
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, variable_declaration28.tree )
      end

      # at line 129:28: ( ',' variable_declaration )*
      while true # decision 7
        alt_7 = 2
        look_7_0 = @input.peek( 1 )

        if ( look_7_0 == COMMA )
          alt_7 = 1

        end
        case alt_7
        when 1
          # at line 129:29: ',' variable_declaration
          char_literal29 = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_variable_declaration_list_735 )
          if @state.backtracking == 0
            tree_for_char_literal29 = @adaptor.create_with_payload( char_literal29 )
            @adaptor.add_child( root_0, tree_for_char_literal29 )

          end

          @state.following.push( TOKENS_FOLLOWING_variable_declaration_IN_variable_declaration_list_737 )
          variable_declaration30 = variable_declaration
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, variable_declaration30.tree )
          end


        else
          break # out of loop for decision 7
        end
      end # loop for decision 7


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
    # 132:1: variable_declaration : declaration_target ( '=' expression )? ;
    #
    def variable_declaration
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 9 )


      return_value = VariableDeclarationReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal32 = nil
      declaration_target31 = nil
      expression33 = nil


      tree_for_char_literal32 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 133:7: declaration_target ( '=' expression )?
      @state.following.push( TOKENS_FOLLOWING_declaration_target_IN_variable_declaration_756 )
      declaration_target31 = declaration_target
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, declaration_target31.tree )
      end

      # at line 133:26: ( '=' expression )?
      alt_8 = 2
      look_8_0 = @input.peek( 1 )

      if ( look_8_0 == ASGN )
        alt_8 = 1
      end
      case alt_8
      when 1
        # at line 133:27: '=' expression
        char_literal32 = match( ASGN, TOKENS_FOLLOWING_ASGN_IN_variable_declaration_759 )
        if @state.backtracking == 0
          tree_for_char_literal32 = @adaptor.create_with_payload( char_literal32 )
          @adaptor.add_child( root_0, tree_for_char_literal32 )

        end

        @state.following.push( TOKENS_FOLLOWING_expression_IN_variable_declaration_761 )
        expression33 = expression
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression33.tree )
        end


      end

      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action

                    define_variable(( declaration_target31 && @input.to_s( declaration_target31.start, declaration_target31.stop ) ), @current_var_type)
                
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
    # 139:1: declaration_target : variable_name ( '[' INT ']' )? ( '[' INT ']' )? ;
    #
    def declaration_target
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 10 )


      return_value = DeclarationTargetReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal35 = nil
      __INT36__ = nil
      char_literal37 = nil
      char_literal38 = nil
      __INT39__ = nil
      char_literal40 = nil
      variable_name34 = nil


      tree_for_char_literal35 = nil
      tree_for_INT36 = nil
      tree_for_char_literal37 = nil
      tree_for_char_literal38 = nil
      tree_for_INT39 = nil
      tree_for_char_literal40 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 140:7: variable_name ( '[' INT ']' )? ( '[' INT ']' )?
      @state.following.push( TOKENS_FOLLOWING_variable_name_IN_declaration_target_790 )
      variable_name34 = variable_name
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, variable_name34.tree )
      end

      # at line 140:21: ( '[' INT ']' )?
      alt_9 = 2
      look_9_0 = @input.peek( 1 )

      if ( look_9_0 == LBRAK )
        look_9_1 = @input.peek( 2 )

        if ( look_9_1 == INT )
          look_9_3 = @input.peek( 3 )

          if ( look_9_3 == RBRAK )
            alt_9 = 1
          end
        end
      end
      case alt_9
      when 1
        # at line 140:22: '[' INT ']'
        char_literal35 = match( LBRAK, TOKENS_FOLLOWING_LBRAK_IN_declaration_target_793 )
        if @state.backtracking == 0
          tree_for_char_literal35 = @adaptor.create_with_payload( char_literal35 )
          @adaptor.add_child( root_0, tree_for_char_literal35 )

        end

        __INT36__ = match( INT, TOKENS_FOLLOWING_INT_IN_declaration_target_795 )
        if @state.backtracking == 0
          tree_for_INT36 = @adaptor.create_with_payload( __INT36__ )
          @adaptor.add_child( root_0, tree_for_INT36 )

        end

        char_literal37 = match( RBRAK, TOKENS_FOLLOWING_RBRAK_IN_declaration_target_797 )
        if @state.backtracking == 0
          tree_for_char_literal37 = @adaptor.create_with_payload( char_literal37 )
          @adaptor.add_child( root_0, tree_for_char_literal37 )

        end


      end
      # at line 140:36: ( '[' INT ']' )?
      alt_10 = 2
      look_10_0 = @input.peek( 1 )

      if ( look_10_0 == LBRAK )
        alt_10 = 1
      end
      case alt_10
      when 1
        # at line 140:37: '[' INT ']'
        char_literal38 = match( LBRAK, TOKENS_FOLLOWING_LBRAK_IN_declaration_target_802 )
        if @state.backtracking == 0
          tree_for_char_literal38 = @adaptor.create_with_payload( char_literal38 )
          @adaptor.add_child( root_0, tree_for_char_literal38 )

        end

        __INT39__ = match( INT, TOKENS_FOLLOWING_INT_IN_declaration_target_804 )
        if @state.backtracking == 0
          tree_for_INT39 = @adaptor.create_with_payload( __INT39__ )
          @adaptor.add_child( root_0, tree_for_INT39 )

        end

        char_literal40 = match( RBRAK, TOKENS_FOLLOWING_RBRAK_IN_declaration_target_806 )
        if @state.backtracking == 0
          tree_for_char_literal40 = @adaptor.create_with_payload( char_literal40 )
          @adaptor.add_child( root_0, tree_for_char_literal40 )

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
    # 143:1: assignment_statement : ID '=' expression statement_end !;
    #
    def assignment_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 11 )


      return_value = AssignmentStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __ID41__ = nil
      char_literal42 = nil
      expression43 = nil
      statement_end44 = nil


      tree_for_ID41 = nil
      tree_for_char_literal42 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 144:7: ID '=' expression statement_end !
      __ID41__ = match( ID, TOKENS_FOLLOWING_ID_IN_assignment_statement_825 )
      if @state.backtracking == 0
        tree_for_ID41 = @adaptor.create_with_payload( __ID41__ )
        @adaptor.add_child( root_0, tree_for_ID41 )

      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         assign(__ID41__.text) 
        # <-- action
      end

      char_literal42 = match( ASGN, TOKENS_FOLLOWING_ASGN_IN_assignment_statement_829 )
      if @state.backtracking == 0
        tree_for_char_literal42 = @adaptor.create_with_payload( char_literal42 )
        @adaptor.add_child( root_0, tree_for_char_literal42 )

      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         exp2('=') 
        # <-- action
      end

      @state.following.push( TOKENS_FOLLOWING_expression_IN_assignment_statement_833 )
      expression43 = expression
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, expression43.tree )
      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         exp9 
        # <-- action
      end

      @state.following.push( TOKENS_FOLLOWING_statement_end_IN_assignment_statement_837 )
      statement_end44 = statement_end
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
    # 147:1: condition_statement : 'if' '(' expression ')' block ( 'else' block )? ;
    #
    def condition_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 12 )


      return_value = ConditionStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal45 = nil
      char_literal46 = nil
      char_literal48 = nil
      string_literal50 = nil
      expression47 = nil
      block49 = nil
      block51 = nil


      tree_for_string_literal45 = nil
      tree_for_char_literal46 = nil
      tree_for_char_literal48 = nil
      tree_for_string_literal50 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 148:7: 'if' '(' expression ')' block ( 'else' block )?
      string_literal45 = match( IF, TOKENS_FOLLOWING_IF_IN_condition_statement_855 )
      if @state.backtracking == 0
        tree_for_string_literal45 = @adaptor.create_with_payload( string_literal45 )
        @adaptor.add_child( root_0, tree_for_string_literal45 )

      end

      char_literal46 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_condition_statement_857 )
      if @state.backtracking == 0
        tree_for_char_literal46 = @adaptor.create_with_payload( char_literal46 )
        @adaptor.add_child( root_0, tree_for_char_literal46 )

      end

      @state.following.push( TOKENS_FOLLOWING_expression_IN_condition_statement_859 )
      expression47 = expression
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, expression47.tree )
      end

      char_literal48 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_condition_statement_861 )
      if @state.backtracking == 0
        tree_for_char_literal48 = @adaptor.create_with_payload( char_literal48 )
        @adaptor.add_child( root_0, tree_for_char_literal48 )

      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         if1 
        # <-- action
      end

      @state.following.push( TOKENS_FOLLOWING_block_IN_condition_statement_864 )
      block49 = block
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, block49.tree )
      end

      # at line 148:44: ( 'else' block )?
      alt_11 = 2
      look_11_0 = @input.peek( 1 )

      if ( look_11_0 == ELSE )
        alt_11 = 1
      end
      case alt_11
      when 1
        # at line 148:45: 'else' block
        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           if2 
          # <-- action
        end

        string_literal50 = match( ELSE, TOKENS_FOLLOWING_ELSE_IN_condition_statement_869 )
        if @state.backtracking == 0
          tree_for_string_literal50 = @adaptor.create_with_payload( string_literal50 )
          @adaptor.add_child( root_0, tree_for_string_literal50 )

        end

        @state.following.push( TOKENS_FOLLOWING_block_IN_condition_statement_871 )
        block51 = block
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, block51.tree )
        end


      end

      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
        if3
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
        # trace_out( __method__, 12 )


      end

      return return_value
    end

    ExpressionReturnValue = define_return_scope

    #
    # parser rule expression
    #
    # (in Rubik.g)
    # 151:1: expression : exp ( relation_op exp )? ;
    #
    def expression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 13 )


      return_value = ExpressionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      exp52 = nil
      relation_op53 = nil
      exp54 = nil



      begin
      root_0 = @adaptor.create_flat_list


      # at line 152:7: exp ( relation_op exp )?
      @state.following.push( TOKENS_FOLLOWING_exp_IN_expression_892 )
      exp52 = exp
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, exp52.tree )
      end

      # at line 152:11: ( relation_op exp )?
      alt_12 = 2
      look_12_0 = @input.peek( 1 )

      if ( look_12_0 == EQ || look_12_0.between?( GEQ, GREATER ) || look_12_0.between?( LEQ, LESS ) || look_12_0 == NEQ )
        alt_12 = 1
      end
      case alt_12
      when 1
        # at line 152:12: relation_op exp
        @state.following.push( TOKENS_FOLLOWING_relation_op_IN_expression_895 )
        relation_op53 = relation_op
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, relation_op53.tree )
        end


        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           exp2(input.look(-1).text) 
          # <-- action
        end

        @state.following.push( TOKENS_FOLLOWING_exp_IN_expression_899 )
        exp54 = exp
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, exp54.tree )
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
    # 155:1: relation_op : ( '<' | '>' | '<=' | '>=' | '==' | '!=' );
    #
    def relation_op
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 14 )


      return_value = RelationOpReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      set55 = nil


      tree_for_set55 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 
      set55 = @input.look

      if @input.peek(1) == EQ || @input.peek( 1 ).between?( GEQ, GREATER ) || @input.peek( 1 ).between?( LEQ, LESS ) || @input.peek(1) == NEQ
        @input.consume
        if @state.backtracking == 0
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set55 ) )
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
    # 164:1: exp : term ( ( '+' | '-' ) exp )? ;
    #
    def exp
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )


      return_value = ExpReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      set57 = nil
      term56 = nil
      exp58 = nil


      tree_for_set57 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 165:7: term ( ( '+' | '-' ) exp )?
      @state.following.push( TOKENS_FOLLOWING_term_IN_exp_977 )
      term56 = term
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, term56.tree )
      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         exp4 
        # <-- action
      end

      # at line 165:21: ( ( '+' | '-' ) exp )?
      alt_13 = 2
      look_13_0 = @input.peek( 1 )

      if ( look_13_0 == MINUS || look_13_0 == PLUS )
        alt_13 = 1
      end
      case alt_13
      when 1
        # at line 165:22: ( '+' | '-' ) exp
        set57 = @input.look

        if @input.peek(1) == MINUS || @input.peek(1) == PLUS
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

        @state.following.push( TOKENS_FOLLOWING_exp_IN_exp_990 )
        exp58 = exp
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, exp58.tree )
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
    # 168:1: term : factor ( ( '*' | '/' ) term )? ;
    #
    def term
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )


      return_value = TermReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      set60 = nil
      factor59 = nil
      term61 = nil


      tree_for_set60 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 169:7: factor ( ( '*' | '/' ) term )?
      @state.following.push( TOKENS_FOLLOWING_factor_IN_term_1009 )
      factor59 = factor
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, factor59.tree )
      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         exp5 
        # <-- action
      end

      # at line 169:23: ( ( '*' | '/' ) term )?
      alt_14 = 2
      look_14_0 = @input.peek( 1 )

      if ( look_14_0 == DIV || look_14_0 == STAR )
        alt_14 = 1
      end
      case alt_14
      when 1
        # at line 169:24: ( '*' | '/' ) term
        set60 = @input.look

        if @input.peek(1) == DIV || @input.peek(1) == STAR
          @input.consume
          if @state.backtracking == 0
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set60 ) )
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

        @state.following.push( TOKENS_FOLLOWING_term_IN_term_1022 )
        term61 = term
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, term61.tree )
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
    # 172:1: factor : ( '(' expression ')' | ( '-' )? primary );
    #
    def factor
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )


      return_value = FactorReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal62 = nil
      char_literal64 = nil
      char_literal65 = nil
      expression63 = nil
      primary66 = nil


      tree_for_char_literal62 = nil
      tree_for_char_literal64 = nil
      tree_for_char_literal65 = nil

      begin
      # at line 173:5: ( '(' expression ')' | ( '-' )? primary )
      alt_16 = 2
      look_16_0 = @input.peek( 1 )

      if ( look_16_0 == LPAREN )
        alt_16 = 1
      elsif ( look_16_0 == BOOLEAN || look_16_0 == FLOAT || look_16_0 == ID || look_16_0 == INT || look_16_0 == MINUS || look_16_0 == STRING )
        alt_16 = 2
      else
        @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )



        raise NoViableAlternative( "", 16, 0 )

      end
      case alt_16
      when 1
        root_0 = @adaptor.create_flat_list


        # at line 173:7: '(' expression ')'
        char_literal62 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_factor_1041 )
        if @state.backtracking == 0
          tree_for_char_literal62 = @adaptor.create_with_payload( char_literal62 )
          @adaptor.add_child( root_0, tree_for_char_literal62 )

        end


        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           exp6 
          # <-- action
        end

        @state.following.push( TOKENS_FOLLOWING_expression_IN_factor_1045 )
        expression63 = expression
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression63.tree )
        end

        char_literal64 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_factor_1047 )
        if @state.backtracking == 0
          tree_for_char_literal64 = @adaptor.create_with_payload( char_literal64 )
          @adaptor.add_child( root_0, tree_for_char_literal64 )

        end


        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           exp7 
          # <-- action
        end


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 174:7: ( '-' )? primary
        # at line 174:7: ( '-' )?
        alt_15 = 2
        look_15_0 = @input.peek( 1 )

        if ( look_15_0 == MINUS )
          alt_15 = 1
        end
        case alt_15
        when 1
          # at line 174:7: '-'
          char_literal65 = match( MINUS, TOKENS_FOLLOWING_MINUS_IN_factor_1057 )
          if @state.backtracking == 0
            tree_for_char_literal65 = @adaptor.create_with_payload( char_literal65 )
            @adaptor.add_child( root_0, tree_for_char_literal65 )

          end


        end
        @state.following.push( TOKENS_FOLLOWING_primary_IN_factor_1060 )
        primary66 = primary
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, primary66.tree )
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
    # 177:1: write_statement : 'print' '(' write_expression ( '.' write_expression )* ')' statement_end !;
    #
    def write_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )


      return_value = WriteStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal67 = nil
      char_literal68 = nil
      char_literal70 = nil
      char_literal72 = nil
      write_expression69 = nil
      write_expression71 = nil
      statement_end73 = nil


      tree_for_string_literal67 = nil
      tree_for_char_literal68 = nil
      tree_for_char_literal70 = nil
      tree_for_char_literal72 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 178:7: 'print' '(' write_expression ( '.' write_expression )* ')' statement_end !
      string_literal67 = match( T__61, TOKENS_FOLLOWING_T__61_IN_write_statement_1077 )
      if @state.backtracking == 0
        tree_for_string_literal67 = @adaptor.create_with_payload( string_literal67 )
        @adaptor.add_child( root_0, tree_for_string_literal67 )

      end

      char_literal68 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_write_statement_1079 )
      if @state.backtracking == 0
        tree_for_char_literal68 = @adaptor.create_with_payload( char_literal68 )
        @adaptor.add_child( root_0, tree_for_char_literal68 )

      end

      @state.following.push( TOKENS_FOLLOWING_write_expression_IN_write_statement_1081 )
      write_expression69 = write_expression
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, write_expression69.tree )
      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         r_print 
        # <-- action
      end

      # at line 178:48: ( '.' write_expression )*
      while true # decision 17
        alt_17 = 2
        look_17_0 = @input.peek( 1 )

        if ( look_17_0 == DOT )
          alt_17 = 1

        end
        case alt_17
        when 1
          # at line 178:49: '.' write_expression
          char_literal70 = match( DOT, TOKENS_FOLLOWING_DOT_IN_write_statement_1086 )
          if @state.backtracking == 0
            tree_for_char_literal70 = @adaptor.create_with_payload( char_literal70 )
            @adaptor.add_child( root_0, tree_for_char_literal70 )

          end

          @state.following.push( TOKENS_FOLLOWING_write_expression_IN_write_statement_1088 )
          write_expression71 = write_expression
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, write_expression71.tree )
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

      char_literal72 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_write_statement_1094 )
      if @state.backtracking == 0
        tree_for_char_literal72 = @adaptor.create_with_payload( char_literal72 )
        @adaptor.add_child( root_0, tree_for_char_literal72 )

      end

      @state.following.push( TOKENS_FOLLOWING_statement_end_IN_write_statement_1096 )
      statement_end73 = statement_end
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
    # 181:1: write_expression : expression ;
    #
    def write_expression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )


      return_value = WriteExpressionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      expression74 = nil



      begin
      root_0 = @adaptor.create_flat_list


      # at line 182:7: expression
      @state.following.push( TOKENS_FOLLOWING_expression_IN_write_expression_1114 )
      expression74 = expression
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, expression74.tree )
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
    # 185:1: read_statement : 'gets' '(' ')' statement_end !;
    #
    def read_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )


      return_value = ReadStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal75 = nil
      char_literal76 = nil
      char_literal77 = nil
      statement_end78 = nil


      tree_for_string_literal75 = nil
      tree_for_char_literal76 = nil
      tree_for_char_literal77 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 186:7: 'gets' '(' ')' statement_end !
      string_literal75 = match( T__60, TOKENS_FOLLOWING_T__60_IN_read_statement_1131 )
      if @state.backtracking == 0
        tree_for_string_literal75 = @adaptor.create_with_payload( string_literal75 )
        @adaptor.add_child( root_0, tree_for_string_literal75 )

      end

      char_literal76 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_read_statement_1133 )
      if @state.backtracking == 0
        tree_for_char_literal76 = @adaptor.create_with_payload( char_literal76 )
        @adaptor.add_child( root_0, tree_for_char_literal76 )

      end

      char_literal77 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_read_statement_1135 )
      if @state.backtracking == 0
        tree_for_char_literal77 = @adaptor.create_with_payload( char_literal77 )
        @adaptor.add_child( root_0, tree_for_char_literal77 )

      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         r_gets 
        # <-- action
      end

      @state.following.push( TOKENS_FOLLOWING_statement_end_IN_read_statement_1139 )
      statement_end78 = statement_end
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
    # 189:1: loop_statement : 'do' exp 'times' block ;
    #
    def loop_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )


      return_value = LoopStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal79 = nil
      string_literal81 = nil
      exp80 = nil
      block82 = nil


      tree_for_string_literal79 = nil
      tree_for_string_literal81 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 190:7: 'do' exp 'times' block
      string_literal79 = match( DO, TOKENS_FOLLOWING_DO_IN_loop_statement_1157 )
      if @state.backtracking == 0
        tree_for_string_literal79 = @adaptor.create_with_payload( string_literal79 )
        @adaptor.add_child( root_0, tree_for_string_literal79 )

      end

      @state.following.push( TOKENS_FOLLOWING_exp_IN_loop_statement_1159 )
      exp80 = exp
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, exp80.tree )
      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
        times1
        # <-- action
      end

      string_literal81 = match( TIMES, TOKENS_FOLLOWING_TIMES_IN_loop_statement_1162 )
      if @state.backtracking == 0
        tree_for_string_literal81 = @adaptor.create_with_payload( string_literal81 )
        @adaptor.add_child( root_0, tree_for_string_literal81 )

      end

      @state.following.push( TOKENS_FOLLOWING_block_IN_loop_statement_1164 )
      block82 = block
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, block82.tree )
      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
        times2
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
        # trace_out( __method__, 21 )


      end

      return return_value
    end

    FunctionReturnValue = define_return_scope

    #
    # parser rule function
    #
    # (in Rubik.g)
    # 193:1: function : 'def' VAR_TYPE variable_name function_parameters block ;
    #
    def function
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )


      return_value = FunctionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal83 = nil
      __VAR_TYPE84__ = nil
      variable_name85 = nil
      function_parameters86 = nil
      block87 = nil


      tree_for_string_literal83 = nil
      tree_for_VAR_TYPE84 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 197:7: 'def' VAR_TYPE variable_name function_parameters block
      string_literal83 = match( DEF, TOKENS_FOLLOWING_DEF_IN_function_1188 )
      if @state.backtracking == 0
        tree_for_string_literal83 = @adaptor.create_with_payload( string_literal83 )
        @adaptor.add_child( root_0, tree_for_string_literal83 )

      end

      __VAR_TYPE84__ = match( VAR_TYPE, TOKENS_FOLLOWING_VAR_TYPE_IN_function_1190 )
      if @state.backtracking == 0
        tree_for_VAR_TYPE84 = @adaptor.create_with_payload( __VAR_TYPE84__ )
        @adaptor.add_child( root_0, tree_for_VAR_TYPE84 )

      end

      @state.following.push( TOKENS_FOLLOWING_variable_name_IN_function_1192 )
      variable_name85 = variable_name
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, variable_name85.tree )
      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         @current_scope = ( variable_name85 && @input.to_s( variable_name85.start, variable_name85.stop ) ); func1(__VAR_TYPE84__.text) 
        # <-- action
      end

      @state.following.push( TOKENS_FOLLOWING_function_parameters_IN_function_1196 )
      function_parameters86 = function_parameters
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, function_parameters86.tree )
      end

      @state.following.push( TOKENS_FOLLOWING_block_IN_function_1198 )
      block87 = block
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, block87.tree )
      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         func3(( block87 && @input.to_s( block87.start, block87.stop ) )) 
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
    # 200:1: function_parameters : '(' ( parameters )? ')' ;
    #
    def function_parameters
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 23 )


      return_value = FunctionParametersReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal88 = nil
      char_literal90 = nil
      parameters89 = nil


      tree_for_char_literal88 = nil
      tree_for_char_literal90 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 201:7: '(' ( parameters )? ')'
      char_literal88 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_function_parameters_1217 )
      if @state.backtracking == 0
        tree_for_char_literal88 = @adaptor.create_with_payload( char_literal88 )
        @adaptor.add_child( root_0, tree_for_char_literal88 )

      end

      # at line 201:11: ( parameters )?
      alt_18 = 2
      look_18_0 = @input.peek( 1 )

      if ( look_18_0 == VAR_TYPE )
        alt_18 = 1
      end
      case alt_18
      when 1
        # at line 201:11: parameters
        @state.following.push( TOKENS_FOLLOWING_parameters_IN_function_parameters_1219 )
        parameters89 = parameters
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, parameters89.tree )
        end


      end
      char_literal90 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_function_parameters_1222 )
      if @state.backtracking == 0
        tree_for_char_literal90 = @adaptor.create_with_payload( char_literal90 )
        @adaptor.add_child( root_0, tree_for_char_literal90 )

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
    # 204:1: parameters : VAR_TYPE variable_name ( ',' parameters )* ;
    #
    def parameters
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )


      return_value = ParametersReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __VAR_TYPE91__ = nil
      char_literal93 = nil
      variable_name92 = nil
      parameters94 = nil


      tree_for_VAR_TYPE91 = nil
      tree_for_char_literal93 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 205:7: VAR_TYPE variable_name ( ',' parameters )*
      __VAR_TYPE91__ = match( VAR_TYPE, TOKENS_FOLLOWING_VAR_TYPE_IN_parameters_1239 )
      if @state.backtracking == 0
        tree_for_VAR_TYPE91 = @adaptor.create_with_payload( __VAR_TYPE91__ )
        @adaptor.add_child( root_0, tree_for_VAR_TYPE91 )

      end

      @state.following.push( TOKENS_FOLLOWING_variable_name_IN_parameters_1241 )
      variable_name92 = variable_name
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, variable_name92.tree )
      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         func2(( variable_name92 && @input.to_s( variable_name92.start, variable_name92.stop ) ), __VAR_TYPE91__.text) 
        # <-- action
      end

      # at line 205:77: ( ',' parameters )*
      while true # decision 19
        alt_19 = 2
        look_19_0 = @input.peek( 1 )

        if ( look_19_0 == COMMA )
          alt_19 = 1

        end
        case alt_19
        when 1
          # at line 205:78: ',' parameters
          char_literal93 = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_parameters_1246 )
          if @state.backtracking == 0
            tree_for_char_literal93 = @adaptor.create_with_payload( char_literal93 )
            @adaptor.add_child( root_0, tree_for_char_literal93 )

          end

          @state.following.push( TOKENS_FOLLOWING_parameters_IN_parameters_1248 )
          parameters94 = parameters
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, parameters94.tree )
          end


        else
          break # out of loop for decision 19
        end
      end # loop for decision 19


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
    # 208:1: robot : ( 'change_color' '(' COLOR ')' | 'change_direction' '(' DIR ')' | 'draw_circle' '(' expression ')' | 'draw_square' '(' expression ')' | 'draw_triangle' '(' expression ')' | 'pen_down' '(' ')' | 'pen_up' '(' ')' | 'reset' '(' ')' | 'talk' '(' expression ')' | 'move' '(' expression ')' );
    #
    def robot
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )


      return_value = RobotReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal95 = nil
      char_literal96 = nil
      __COLOR97__ = nil
      char_literal98 = nil
      string_literal99 = nil
      char_literal100 = nil
      __DIR101__ = nil
      char_literal102 = nil
      string_literal103 = nil
      char_literal104 = nil
      char_literal106 = nil
      string_literal107 = nil
      char_literal108 = nil
      char_literal110 = nil
      string_literal111 = nil
      char_literal112 = nil
      char_literal114 = nil
      string_literal115 = nil
      char_literal116 = nil
      char_literal117 = nil
      string_literal118 = nil
      char_literal119 = nil
      char_literal120 = nil
      string_literal121 = nil
      char_literal122 = nil
      char_literal123 = nil
      string_literal124 = nil
      char_literal125 = nil
      char_literal127 = nil
      string_literal128 = nil
      char_literal129 = nil
      char_literal131 = nil
      expression105 = nil
      expression109 = nil
      expression113 = nil
      expression126 = nil
      expression130 = nil


      tree_for_string_literal95 = nil
      tree_for_char_literal96 = nil
      tree_for_COLOR97 = nil
      tree_for_char_literal98 = nil
      tree_for_string_literal99 = nil
      tree_for_char_literal100 = nil
      tree_for_DIR101 = nil
      tree_for_char_literal102 = nil
      tree_for_string_literal103 = nil
      tree_for_char_literal104 = nil
      tree_for_char_literal106 = nil
      tree_for_string_literal107 = nil
      tree_for_char_literal108 = nil
      tree_for_char_literal110 = nil
      tree_for_string_literal111 = nil
      tree_for_char_literal112 = nil
      tree_for_char_literal114 = nil
      tree_for_string_literal115 = nil
      tree_for_char_literal116 = nil
      tree_for_char_literal117 = nil
      tree_for_string_literal118 = nil
      tree_for_char_literal119 = nil
      tree_for_char_literal120 = nil
      tree_for_string_literal121 = nil
      tree_for_char_literal122 = nil
      tree_for_char_literal123 = nil
      tree_for_string_literal124 = nil
      tree_for_char_literal125 = nil
      tree_for_char_literal127 = nil
      tree_for_string_literal128 = nil
      tree_for_char_literal129 = nil
      tree_for_char_literal131 = nil

      begin
      # at line 209:5: ( 'change_color' '(' COLOR ')' | 'change_direction' '(' DIR ')' | 'draw_circle' '(' expression ')' | 'draw_square' '(' expression ')' | 'draw_triangle' '(' expression ')' | 'pen_down' '(' ')' | 'pen_up' '(' ')' | 'reset' '(' ')' | 'talk' '(' expression ')' | 'move' '(' expression ')' )
      alt_20 = 10
      case look_20 = @input.peek( 1 )
      when CHANGE_COLOR then alt_20 = 1
      when T__59 then alt_20 = 2
      when DRAW_CIRCLE then alt_20 = 3
      when DRAW_SQUARE then alt_20 = 4
      when DRAW_TRIANGLE then alt_20 = 5
      when PEN_DOWN then alt_20 = 6
      when PEN_UP then alt_20 = 7
      when R_RESET then alt_20 = 8
      when TLK then alt_20 = 9
      when R_MOVE then alt_20 = 10
      else
        @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )



        raise NoViableAlternative( "", 20, 0 )

      end
      case alt_20
      when 1
        root_0 = @adaptor.create_flat_list


        # at line 209:7: 'change_color' '(' COLOR ')'
        string_literal95 = match( CHANGE_COLOR, TOKENS_FOLLOWING_CHANGE_COLOR_IN_robot_1267 )
        if @state.backtracking == 0
          tree_for_string_literal95 = @adaptor.create_with_payload( string_literal95 )
          @adaptor.add_child( root_0, tree_for_string_literal95 )

        end

        char_literal96 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1269 )
        if @state.backtracking == 0
          tree_for_char_literal96 = @adaptor.create_with_payload( char_literal96 )
          @adaptor.add_child( root_0, tree_for_char_literal96 )

        end

        __COLOR97__ = match( COLOR, TOKENS_FOLLOWING_COLOR_IN_robot_1271 )
        if @state.backtracking == 0
          tree_for_COLOR97 = @adaptor.create_with_payload( __COLOR97__ )
          @adaptor.add_child( root_0, tree_for_COLOR97 )

        end

        char_literal98 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1273 )
        if @state.backtracking == 0
          tree_for_char_literal98 = @adaptor.create_with_payload( char_literal98 )
          @adaptor.add_child( root_0, tree_for_char_literal98 )

        end


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 210:7: 'change_direction' '(' DIR ')'
        string_literal99 = match( T__59, TOKENS_FOLLOWING_T__59_IN_robot_1281 )
        if @state.backtracking == 0
          tree_for_string_literal99 = @adaptor.create_with_payload( string_literal99 )
          @adaptor.add_child( root_0, tree_for_string_literal99 )

        end

        char_literal100 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1283 )
        if @state.backtracking == 0
          tree_for_char_literal100 = @adaptor.create_with_payload( char_literal100 )
          @adaptor.add_child( root_0, tree_for_char_literal100 )

        end

        __DIR101__ = match( DIR, TOKENS_FOLLOWING_DIR_IN_robot_1285 )
        if @state.backtracking == 0
          tree_for_DIR101 = @adaptor.create_with_payload( __DIR101__ )
          @adaptor.add_child( root_0, tree_for_DIR101 )

        end

        char_literal102 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1287 )
        if @state.backtracking == 0
          tree_for_char_literal102 = @adaptor.create_with_payload( char_literal102 )
          @adaptor.add_child( root_0, tree_for_char_literal102 )

        end


      when 3
        root_0 = @adaptor.create_flat_list


        # at line 211:7: 'draw_circle' '(' expression ')'
        string_literal103 = match( DRAW_CIRCLE, TOKENS_FOLLOWING_DRAW_CIRCLE_IN_robot_1295 )
        if @state.backtracking == 0
          tree_for_string_literal103 = @adaptor.create_with_payload( string_literal103 )
          @adaptor.add_child( root_0, tree_for_string_literal103 )

        end

        char_literal104 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1297 )
        if @state.backtracking == 0
          tree_for_char_literal104 = @adaptor.create_with_payload( char_literal104 )
          @adaptor.add_child( root_0, tree_for_char_literal104 )

        end

        @state.following.push( TOKENS_FOLLOWING_expression_IN_robot_1299 )
        expression105 = expression
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression105.tree )
        end

        char_literal106 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1301 )
        if @state.backtracking == 0
          tree_for_char_literal106 = @adaptor.create_with_payload( char_literal106 )
          @adaptor.add_child( root_0, tree_for_char_literal106 )

        end


      when 4
        root_0 = @adaptor.create_flat_list


        # at line 212:7: 'draw_square' '(' expression ')'
        string_literal107 = match( DRAW_SQUARE, TOKENS_FOLLOWING_DRAW_SQUARE_IN_robot_1309 )
        if @state.backtracking == 0
          tree_for_string_literal107 = @adaptor.create_with_payload( string_literal107 )
          @adaptor.add_child( root_0, tree_for_string_literal107 )

        end

        char_literal108 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1311 )
        if @state.backtracking == 0
          tree_for_char_literal108 = @adaptor.create_with_payload( char_literal108 )
          @adaptor.add_child( root_0, tree_for_char_literal108 )

        end

        @state.following.push( TOKENS_FOLLOWING_expression_IN_robot_1313 )
        expression109 = expression
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression109.tree )
        end

        char_literal110 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1315 )
        if @state.backtracking == 0
          tree_for_char_literal110 = @adaptor.create_with_payload( char_literal110 )
          @adaptor.add_child( root_0, tree_for_char_literal110 )

        end


      when 5
        root_0 = @adaptor.create_flat_list


        # at line 213:7: 'draw_triangle' '(' expression ')'
        string_literal111 = match( DRAW_TRIANGLE, TOKENS_FOLLOWING_DRAW_TRIANGLE_IN_robot_1323 )
        if @state.backtracking == 0
          tree_for_string_literal111 = @adaptor.create_with_payload( string_literal111 )
          @adaptor.add_child( root_0, tree_for_string_literal111 )

        end

        char_literal112 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1325 )
        if @state.backtracking == 0
          tree_for_char_literal112 = @adaptor.create_with_payload( char_literal112 )
          @adaptor.add_child( root_0, tree_for_char_literal112 )

        end

        @state.following.push( TOKENS_FOLLOWING_expression_IN_robot_1327 )
        expression113 = expression
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression113.tree )
        end

        char_literal114 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1329 )
        if @state.backtracking == 0
          tree_for_char_literal114 = @adaptor.create_with_payload( char_literal114 )
          @adaptor.add_child( root_0, tree_for_char_literal114 )

        end


      when 6
        root_0 = @adaptor.create_flat_list


        # at line 214:7: 'pen_down' '(' ')'
        string_literal115 = match( PEN_DOWN, TOKENS_FOLLOWING_PEN_DOWN_IN_robot_1337 )
        if @state.backtracking == 0
          tree_for_string_literal115 = @adaptor.create_with_payload( string_literal115 )
          @adaptor.add_child( root_0, tree_for_string_literal115 )

        end

        char_literal116 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1339 )
        if @state.backtracking == 0
          tree_for_char_literal116 = @adaptor.create_with_payload( char_literal116 )
          @adaptor.add_child( root_0, tree_for_char_literal116 )

        end

        char_literal117 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1341 )
        if @state.backtracking == 0
          tree_for_char_literal117 = @adaptor.create_with_payload( char_literal117 )
          @adaptor.add_child( root_0, tree_for_char_literal117 )

        end


      when 7
        root_0 = @adaptor.create_flat_list


        # at line 215:7: 'pen_up' '(' ')'
        string_literal118 = match( PEN_UP, TOKENS_FOLLOWING_PEN_UP_IN_robot_1349 )
        if @state.backtracking == 0
          tree_for_string_literal118 = @adaptor.create_with_payload( string_literal118 )
          @adaptor.add_child( root_0, tree_for_string_literal118 )

        end

        char_literal119 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1351 )
        if @state.backtracking == 0
          tree_for_char_literal119 = @adaptor.create_with_payload( char_literal119 )
          @adaptor.add_child( root_0, tree_for_char_literal119 )

        end

        char_literal120 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1353 )
        if @state.backtracking == 0
          tree_for_char_literal120 = @adaptor.create_with_payload( char_literal120 )
          @adaptor.add_child( root_0, tree_for_char_literal120 )

        end


      when 8
        root_0 = @adaptor.create_flat_list


        # at line 216:7: 'reset' '(' ')'
        string_literal121 = match( R_RESET, TOKENS_FOLLOWING_R_RESET_IN_robot_1361 )
        if @state.backtracking == 0
          tree_for_string_literal121 = @adaptor.create_with_payload( string_literal121 )
          @adaptor.add_child( root_0, tree_for_string_literal121 )

        end

        char_literal122 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1363 )
        if @state.backtracking == 0
          tree_for_char_literal122 = @adaptor.create_with_payload( char_literal122 )
          @adaptor.add_child( root_0, tree_for_char_literal122 )

        end

        char_literal123 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1365 )
        if @state.backtracking == 0
          tree_for_char_literal123 = @adaptor.create_with_payload( char_literal123 )
          @adaptor.add_child( root_0, tree_for_char_literal123 )

        end


      when 9
        root_0 = @adaptor.create_flat_list


        # at line 217:7: 'talk' '(' expression ')'
        string_literal124 = match( TLK, TOKENS_FOLLOWING_TLK_IN_robot_1373 )
        if @state.backtracking == 0
          tree_for_string_literal124 = @adaptor.create_with_payload( string_literal124 )
          @adaptor.add_child( root_0, tree_for_string_literal124 )

        end

        char_literal125 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1375 )
        if @state.backtracking == 0
          tree_for_char_literal125 = @adaptor.create_with_payload( char_literal125 )
          @adaptor.add_child( root_0, tree_for_char_literal125 )

        end

        @state.following.push( TOKENS_FOLLOWING_expression_IN_robot_1377 )
        expression126 = expression
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression126.tree )
        end

        char_literal127 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1379 )
        if @state.backtracking == 0
          tree_for_char_literal127 = @adaptor.create_with_payload( char_literal127 )
          @adaptor.add_child( root_0, tree_for_char_literal127 )

        end


      when 10
        root_0 = @adaptor.create_flat_list


        # at line 218:7: 'move' '(' expression ')'
        string_literal128 = match( R_MOVE, TOKENS_FOLLOWING_R_MOVE_IN_robot_1387 )
        if @state.backtracking == 0
          tree_for_string_literal128 = @adaptor.create_with_payload( string_literal128 )
          @adaptor.add_child( root_0, tree_for_string_literal128 )

        end

        char_literal129 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1389 )
        if @state.backtracking == 0
          tree_for_char_literal129 = @adaptor.create_with_payload( char_literal129 )
          @adaptor.add_child( root_0, tree_for_char_literal129 )

        end

        @state.following.push( TOKENS_FOLLOWING_expression_IN_robot_1391 )
        expression130 = expression
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression130.tree )
        end

        char_literal131 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1393 )
        if @state.backtracking == 0
          tree_for_char_literal131 = @adaptor.create_with_payload( char_literal131 )
          @adaptor.add_child( root_0, tree_for_char_literal131 )

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
    # 223:1: variable_name : ID ;
    #
    def variable_name
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )


      return_value = VariableNameReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __ID132__ = nil


      tree_for_ID132 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 224:7: ID
      __ID132__ = match( ID, TOKENS_FOLLOWING_ID_IN_variable_name_1412 )
      if @state.backtracking == 0
        tree_for_ID132 = @adaptor.create_with_payload( __ID132__ )
        @adaptor.add_child( root_0, tree_for_ID132 )

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
    # 229:1: primary : ( primitive | functions | arrays );
    #
    def primary
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )


      return_value = PrimaryReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      primitive133 = nil
      functions134 = nil
      arrays135 = nil



      begin
      # at line 230:5: ( primitive | functions | arrays )
      alt_21 = 3
      look_21_0 = @input.peek( 1 )

      if ( look_21_0 == BOOLEAN || look_21_0 == FLOAT || look_21_0 == INT || look_21_0 == STRING )
        alt_21 = 1
      elsif ( look_21_0 == ID )
        case look_21 = @input.peek( 2 )
        when EOF, COMMA, DEF, DIV, DO, DOT, ELSE, EQ, GEQ, GREATER, ID, IF, LBRACE, LEQ, LESS, MINUS, NEQ, PLUS, RBRACE, RBRAK, RPAREN, R_BEGIN, R_END, R_RETURN, SEMI, STAR, TIMES, VAR_TYPE, T__60, T__61 then alt_21 = 1
        when LPAREN then alt_21 = 2
        when LBRAK then alt_21 = 3
        else
          @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )



          raise NoViableAlternative( "", 21, 2 )

        end
      else
        @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )



        raise NoViableAlternative( "", 21, 0 )

      end
      case alt_21
      when 1
        root_0 = @adaptor.create_flat_list


        # at line 230:7: primitive
        @state.following.push( TOKENS_FOLLOWING_primitive_IN_primary_1431 )
        primitive133 = primitive
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, primitive133.tree )
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


        # at line 232:7: functions
        @state.following.push( TOKENS_FOLLOWING_functions_IN_primary_1441 )
        functions134 = functions
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, functions134.tree )
        end


      when 3
        root_0 = @adaptor.create_flat_list


        # at line 233:7: arrays
        @state.following.push( TOKENS_FOLLOWING_arrays_IN_primary_1449 )
        arrays135 = arrays
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, arrays135.tree )
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
    # 236:1: primitive : ( BOOLEAN | STRING | FLOAT | INT | variable_name );
    #
    def primitive
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )


      return_value = PrimitiveReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __BOOLEAN136__ = nil
      __STRING137__ = nil
      __FLOAT138__ = nil
      __INT139__ = nil
      variable_name140 = nil


      tree_for_BOOLEAN136 = nil
      tree_for_STRING137 = nil
      tree_for_FLOAT138 = nil
      tree_for_INT139 = nil

      begin
      # at line 237:5: ( BOOLEAN | STRING | FLOAT | INT | variable_name )
      alt_22 = 5
      case look_22 = @input.peek( 1 )
      when BOOLEAN then alt_22 = 1
      when STRING then alt_22 = 2
      when FLOAT then alt_22 = 3
      when INT then alt_22 = 4
      when ID then alt_22 = 5
      else
        @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )



        raise NoViableAlternative( "", 22, 0 )

      end
      case alt_22
      when 1
        root_0 = @adaptor.create_flat_list


        # at line 237:7: BOOLEAN
        __BOOLEAN136__ = match( BOOLEAN, TOKENS_FOLLOWING_BOOLEAN_IN_primitive_1466 )
        if @state.backtracking == 0
          tree_for_BOOLEAN136 = @adaptor.create_with_payload( __BOOLEAN136__ )
          @adaptor.add_child( root_0, tree_for_BOOLEAN136 )

        end


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 238:7: STRING
        __STRING137__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_primitive_1474 )
        if @state.backtracking == 0
          tree_for_STRING137 = @adaptor.create_with_payload( __STRING137__ )
          @adaptor.add_child( root_0, tree_for_STRING137 )

        end


      when 3
        root_0 = @adaptor.create_flat_list


        # at line 239:7: FLOAT
        __FLOAT138__ = match( FLOAT, TOKENS_FOLLOWING_FLOAT_IN_primitive_1482 )
        if @state.backtracking == 0
          tree_for_FLOAT138 = @adaptor.create_with_payload( __FLOAT138__ )
          @adaptor.add_child( root_0, tree_for_FLOAT138 )

        end


      when 4
        root_0 = @adaptor.create_flat_list


        # at line 240:7: INT
        __INT139__ = match( INT, TOKENS_FOLLOWING_INT_IN_primitive_1490 )
        if @state.backtracking == 0
          tree_for_INT139 = @adaptor.create_with_payload( __INT139__ )
          @adaptor.add_child( root_0, tree_for_INT139 )

        end


      when 5
        root_0 = @adaptor.create_flat_list


        # at line 241:7: variable_name
        @state.following.push( TOKENS_FOLLOWING_variable_name_IN_primitive_1498 )
        variable_name140 = variable_name
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, variable_name140.tree )
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
    # 244:1: arrays : variable_name '[' expression ']' ( '[' expression ']' )? ;
    #
    def arrays
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 29 )


      return_value = ArraysReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal142 = nil
      char_literal144 = nil
      char_literal145 = nil
      char_literal147 = nil
      variable_name141 = nil
      expression143 = nil
      expression146 = nil


      tree_for_char_literal142 = nil
      tree_for_char_literal144 = nil
      tree_for_char_literal145 = nil
      tree_for_char_literal147 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 245:7: variable_name '[' expression ']' ( '[' expression ']' )?
      @state.following.push( TOKENS_FOLLOWING_variable_name_IN_arrays_1515 )
      variable_name141 = variable_name
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, variable_name141.tree )
      end

      char_literal142 = match( LBRAK, TOKENS_FOLLOWING_LBRAK_IN_arrays_1517 )
      if @state.backtracking == 0
        tree_for_char_literal142 = @adaptor.create_with_payload( char_literal142 )
        @adaptor.add_child( root_0, tree_for_char_literal142 )

      end

      @state.following.push( TOKENS_FOLLOWING_expression_IN_arrays_1519 )
      expression143 = expression
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, expression143.tree )
      end

      char_literal144 = match( RBRAK, TOKENS_FOLLOWING_RBRAK_IN_arrays_1521 )
      if @state.backtracking == 0
        tree_for_char_literal144 = @adaptor.create_with_payload( char_literal144 )
        @adaptor.add_child( root_0, tree_for_char_literal144 )

      end

      # at line 245:40: ( '[' expression ']' )?
      alt_23 = 2
      look_23_0 = @input.peek( 1 )

      if ( look_23_0 == LBRAK )
        alt_23 = 1
      end
      case alt_23
      when 1
        # at line 245:41: '[' expression ']'
        char_literal145 = match( LBRAK, TOKENS_FOLLOWING_LBRAK_IN_arrays_1524 )
        if @state.backtracking == 0
          tree_for_char_literal145 = @adaptor.create_with_payload( char_literal145 )
          @adaptor.add_child( root_0, tree_for_char_literal145 )

        end

        @state.following.push( TOKENS_FOLLOWING_expression_IN_arrays_1526 )
        expression146 = expression
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression146.tree )
        end

        char_literal147 = match( RBRAK, TOKENS_FOLLOWING_RBRAK_IN_arrays_1528 )
        if @state.backtracking == 0
          tree_for_char_literal147 = @adaptor.create_with_payload( char_literal147 )
          @adaptor.add_child( root_0, tree_for_char_literal147 )

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
    # 248:1: functions : variable_name '(' expression_list ')' ;
    #
    def functions
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )


      return_value = FunctionsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal149 = nil
      char_literal151 = nil
      variable_name148 = nil
      expression_list150 = nil


      tree_for_char_literal149 = nil
      tree_for_char_literal151 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 252:7: variable_name '(' expression_list ')'
      @state.following.push( TOKENS_FOLLOWING_variable_name_IN_functions_1552 )
      variable_name148 = variable_name
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, variable_name148.tree )
      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         call_func1(( variable_name148 && @input.to_s( variable_name148.start, variable_name148.stop ) )) 
        # <-- action
      end

      char_literal149 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_functions_1556 )
      if @state.backtracking == 0
        tree_for_char_literal149 = @adaptor.create_with_payload( char_literal149 )
        @adaptor.add_child( root_0, tree_for_char_literal149 )

      end

      @state.following.push( TOKENS_FOLLOWING_expression_list_IN_functions_1558 )
      expression_list150 = expression_list
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, expression_list150.tree )
      end

      char_literal151 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_functions_1560 )
      if @state.backtracking == 0
        tree_for_char_literal151 = @adaptor.create_with_payload( char_literal151 )
        @adaptor.add_child( root_0, tree_for_char_literal151 )

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
    # 255:1: expression_list : expression ( ',' expression_list )* ;
    #
    def expression_list
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 31 )


      return_value = ExpressionListReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal153 = nil
      expression152 = nil
      expression_list154 = nil


      tree_for_char_literal153 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 256:7: expression ( ',' expression_list )*
      @state.following.push( TOKENS_FOLLOWING_expression_IN_expression_list_1579 )
      expression152 = expression
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, expression152.tree )
      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         call_func2 
        # <-- action
      end

      # at line 256:33: ( ',' expression_list )*
      while true # decision 24
        alt_24 = 2
        look_24_0 = @input.peek( 1 )

        if ( look_24_0 == COMMA )
          alt_24 = 1

        end
        case alt_24
        when 1
          # at line 256:34: ',' expression_list
          char_literal153 = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_expression_list_1584 )
          if @state.backtracking == 0
            tree_for_char_literal153 = @adaptor.create_with_payload( char_literal153 )
            @adaptor.add_child( root_0, tree_for_char_literal153 )

          end

          @state.following.push( TOKENS_FOLLOWING_expression_list_IN_expression_list_1586 )
          expression_list154 = expression_list
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, expression_list154.tree )
          end


        else
          break # out of loop for decision 24
        end
      end # loop for decision 24


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
    # 113:7: synpred1_Rubik : '}' ;
    #
    # This is an imaginary rule inserted by ANTLR to
    # implement a syntactic predicate decision
    #
    def synpred1_Rubik
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 32 )


      # at line 113:9: '}'
      match( RBRACE, TOKENS_FOLLOWING_RBRACE_IN_synpred1_Rubik_653 )

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 32 )


    end


    TOKENS_FOLLOWING_function_IN_program_480 = Set[ 13, 46 ]
    TOKENS_FOLLOWING_R_BEGIN_IN_program_483 = Set[ 13, 16, 26, 27, 29, 50, 51, 57, 60, 61 ]
    TOKENS_FOLLOWING_statement_end_IN_program_485 = Set[ 13, 16, 26, 27, 29, 50, 57, 60, 61 ]
    TOKENS_FOLLOWING_block_IN_program_498 = Set[ 13, 16, 26, 27, 29, 47, 50, 57, 60, 61 ]
    TOKENS_FOLLOWING_R_END_IN_program_501 = Set[ 51 ]
    TOKENS_FOLLOWING_statement_end_IN_program_503 = Set[ 1 ]
    TOKENS_FOLLOWING_statement_IN_block_521 = Set[ 1 ]
    TOKENS_FOLLOWING_statement_block_IN_block_529 = Set[ 1 ]
    TOKENS_FOLLOWING_LBRACE_IN_statement_block_546 = Set[ 13, 16, 26, 27, 43, 50, 57, 60, 61 ]
    TOKENS_FOLLOWING_statement_IN_statement_block_548 = Set[ 13, 16, 26, 27, 43, 50, 57, 60, 61 ]
    TOKENS_FOLLOWING_RBRACE_IN_statement_block_551 = Set[ 1 ]
    TOKENS_FOLLOWING_variable_statement_IN_statement_570 = Set[ 1 ]
    TOKENS_FOLLOWING_assignment_statement_IN_statement_578 = Set[ 1 ]
    TOKENS_FOLLOWING_condition_statement_IN_statement_586 = Set[ 1 ]
    TOKENS_FOLLOWING_write_statement_IN_statement_594 = Set[ 1 ]
    TOKENS_FOLLOWING_read_statement_IN_statement_602 = Set[ 1 ]
    TOKENS_FOLLOWING_loop_statement_IN_statement_610 = Set[ 1 ]
    TOKENS_FOLLOWING_return_statement_IN_statement_618 = Set[ 1 ]
    TOKENS_FOLLOWING_function_IN_statement_626 = Set[ 1 ]
    TOKENS_FOLLOWING_SEMI_IN_statement_end_643 = Set[ 1 ]
    TOKENS_FOLLOWING_EOF_IN_statement_end_664 = Set[ 1 ]
    TOKENS_FOLLOWING_R_RETURN_IN_return_statement_681 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_expression_IN_return_statement_683 = Set[ 51 ]
    TOKENS_FOLLOWING_statement_end_IN_return_statement_685 = Set[ 1 ]
    TOKENS_FOLLOWING_VAR_TYPE_IN_variable_statement_708 = Set[ 26 ]
    TOKENS_FOLLOWING_variable_declaration_list_IN_variable_statement_712 = Set[ 51 ]
    TOKENS_FOLLOWING_statement_end_IN_variable_statement_714 = Set[ 1 ]
    TOKENS_FOLLOWING_variable_declaration_IN_variable_declaration_list_732 = Set[ 1, 12 ]
    TOKENS_FOLLOWING_COMMA_IN_variable_declaration_list_735 = Set[ 26 ]
    TOKENS_FOLLOWING_variable_declaration_IN_variable_declaration_list_737 = Set[ 1, 12 ]
    TOKENS_FOLLOWING_declaration_target_IN_variable_declaration_756 = Set[ 1, 5 ]
    TOKENS_FOLLOWING_ASGN_IN_variable_declaration_759 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_expression_IN_variable_declaration_761 = Set[ 1 ]
    TOKENS_FOLLOWING_variable_name_IN_declaration_target_790 = Set[ 1, 30 ]
    TOKENS_FOLLOWING_LBRAK_IN_declaration_target_793 = Set[ 28 ]
    TOKENS_FOLLOWING_INT_IN_declaration_target_795 = Set[ 44 ]
    TOKENS_FOLLOWING_RBRAK_IN_declaration_target_797 = Set[ 1, 30 ]
    TOKENS_FOLLOWING_LBRAK_IN_declaration_target_802 = Set[ 28 ]
    TOKENS_FOLLOWING_INT_IN_declaration_target_804 = Set[ 44 ]
    TOKENS_FOLLOWING_RBRAK_IN_declaration_target_806 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_assignment_statement_825 = Set[ 5 ]
    TOKENS_FOLLOWING_ASGN_IN_assignment_statement_829 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_expression_IN_assignment_statement_833 = Set[ 51 ]
    TOKENS_FOLLOWING_statement_end_IN_assignment_statement_837 = Set[ 1 ]
    TOKENS_FOLLOWING_IF_IN_condition_statement_855 = Set[ 33 ]
    TOKENS_FOLLOWING_LPAREN_IN_condition_statement_857 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_expression_IN_condition_statement_859 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_condition_statement_861 = Set[ 13, 16, 26, 27, 29, 50, 57, 60, 61 ]
    TOKENS_FOLLOWING_block_IN_condition_statement_864 = Set[ 1, 21 ]
    TOKENS_FOLLOWING_ELSE_IN_condition_statement_869 = Set[ 13, 16, 26, 27, 29, 50, 57, 60, 61 ]
    TOKENS_FOLLOWING_block_IN_condition_statement_871 = Set[ 1 ]
    TOKENS_FOLLOWING_exp_IN_expression_892 = Set[ 1, 22, 24, 25, 31, 32, 36 ]
    TOKENS_FOLLOWING_relation_op_IN_expression_895 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_exp_IN_expression_899 = Set[ 1 ]
    TOKENS_FOLLOWING_term_IN_exp_977 = Set[ 1, 34, 42 ]
    TOKENS_FOLLOWING_set_IN_exp_982 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_exp_IN_exp_990 = Set[ 1 ]
    TOKENS_FOLLOWING_factor_IN_term_1009 = Set[ 1, 15, 52 ]
    TOKENS_FOLLOWING_set_IN_term_1014 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_term_IN_term_1022 = Set[ 1 ]
    TOKENS_FOLLOWING_LPAREN_IN_factor_1041 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_expression_IN_factor_1045 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_factor_1047 = Set[ 1 ]
    TOKENS_FOLLOWING_MINUS_IN_factor_1057 = Set[ 7, 23, 26, 28, 53 ]
    TOKENS_FOLLOWING_primary_IN_factor_1060 = Set[ 1 ]
    TOKENS_FOLLOWING_T__61_IN_write_statement_1077 = Set[ 33 ]
    TOKENS_FOLLOWING_LPAREN_IN_write_statement_1079 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_write_expression_IN_write_statement_1081 = Set[ 17, 45 ]
    TOKENS_FOLLOWING_DOT_IN_write_statement_1086 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_write_expression_IN_write_statement_1088 = Set[ 17, 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_write_statement_1094 = Set[ 51 ]
    TOKENS_FOLLOWING_statement_end_IN_write_statement_1096 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_write_expression_1114 = Set[ 1 ]
    TOKENS_FOLLOWING_T__60_IN_read_statement_1131 = Set[ 33 ]
    TOKENS_FOLLOWING_LPAREN_IN_read_statement_1133 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_read_statement_1135 = Set[ 51 ]
    TOKENS_FOLLOWING_statement_end_IN_read_statement_1139 = Set[ 1 ]
    TOKENS_FOLLOWING_DO_IN_loop_statement_1157 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_exp_IN_loop_statement_1159 = Set[ 54 ]
    TOKENS_FOLLOWING_TIMES_IN_loop_statement_1162 = Set[ 13, 16, 26, 27, 29, 50, 57, 60, 61 ]
    TOKENS_FOLLOWING_block_IN_loop_statement_1164 = Set[ 1 ]
    TOKENS_FOLLOWING_DEF_IN_function_1188 = Set[ 57 ]
    TOKENS_FOLLOWING_VAR_TYPE_IN_function_1190 = Set[ 26 ]
    TOKENS_FOLLOWING_variable_name_IN_function_1192 = Set[ 33 ]
    TOKENS_FOLLOWING_function_parameters_IN_function_1196 = Set[ 13, 16, 26, 27, 29, 50, 57, 60, 61 ]
    TOKENS_FOLLOWING_block_IN_function_1198 = Set[ 1 ]
    TOKENS_FOLLOWING_LPAREN_IN_function_parameters_1217 = Set[ 45, 57 ]
    TOKENS_FOLLOWING_parameters_IN_function_parameters_1219 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_function_parameters_1222 = Set[ 1 ]
    TOKENS_FOLLOWING_VAR_TYPE_IN_parameters_1239 = Set[ 26 ]
    TOKENS_FOLLOWING_variable_name_IN_parameters_1241 = Set[ 1, 12 ]
    TOKENS_FOLLOWING_COMMA_IN_parameters_1246 = Set[ 57 ]
    TOKENS_FOLLOWING_parameters_IN_parameters_1248 = Set[ 1, 12 ]
    TOKENS_FOLLOWING_CHANGE_COLOR_IN_robot_1267 = Set[ 33 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1269 = Set[ 11 ]
    TOKENS_FOLLOWING_COLOR_IN_robot_1271 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1273 = Set[ 1 ]
    TOKENS_FOLLOWING_T__59_IN_robot_1281 = Set[ 33 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1283 = Set[ 14 ]
    TOKENS_FOLLOWING_DIR_IN_robot_1285 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1287 = Set[ 1 ]
    TOKENS_FOLLOWING_DRAW_CIRCLE_IN_robot_1295 = Set[ 33 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1297 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_expression_IN_robot_1299 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1301 = Set[ 1 ]
    TOKENS_FOLLOWING_DRAW_SQUARE_IN_robot_1309 = Set[ 33 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1311 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_expression_IN_robot_1313 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1315 = Set[ 1 ]
    TOKENS_FOLLOWING_DRAW_TRIANGLE_IN_robot_1323 = Set[ 33 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1325 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_expression_IN_robot_1327 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1329 = Set[ 1 ]
    TOKENS_FOLLOWING_PEN_DOWN_IN_robot_1337 = Set[ 33 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1339 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1341 = Set[ 1 ]
    TOKENS_FOLLOWING_PEN_UP_IN_robot_1349 = Set[ 33 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1351 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1353 = Set[ 1 ]
    TOKENS_FOLLOWING_R_RESET_IN_robot_1361 = Set[ 33 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1363 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1365 = Set[ 1 ]
    TOKENS_FOLLOWING_TLK_IN_robot_1373 = Set[ 33 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1375 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_expression_IN_robot_1377 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1379 = Set[ 1 ]
    TOKENS_FOLLOWING_R_MOVE_IN_robot_1387 = Set[ 33 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1389 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_expression_IN_robot_1391 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1393 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_variable_name_1412 = Set[ 1 ]
    TOKENS_FOLLOWING_primitive_IN_primary_1431 = Set[ 1 ]
    TOKENS_FOLLOWING_functions_IN_primary_1441 = Set[ 1 ]
    TOKENS_FOLLOWING_arrays_IN_primary_1449 = Set[ 1 ]
    TOKENS_FOLLOWING_BOOLEAN_IN_primitive_1466 = Set[ 1 ]
    TOKENS_FOLLOWING_STRING_IN_primitive_1474 = Set[ 1 ]
    TOKENS_FOLLOWING_FLOAT_IN_primitive_1482 = Set[ 1 ]
    TOKENS_FOLLOWING_INT_IN_primitive_1490 = Set[ 1 ]
    TOKENS_FOLLOWING_variable_name_IN_primitive_1498 = Set[ 1 ]
    TOKENS_FOLLOWING_variable_name_IN_arrays_1515 = Set[ 30 ]
    TOKENS_FOLLOWING_LBRAK_IN_arrays_1517 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_expression_IN_arrays_1519 = Set[ 44 ]
    TOKENS_FOLLOWING_RBRAK_IN_arrays_1521 = Set[ 1, 30 ]
    TOKENS_FOLLOWING_LBRAK_IN_arrays_1524 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_expression_IN_arrays_1526 = Set[ 44 ]
    TOKENS_FOLLOWING_RBRAK_IN_arrays_1528 = Set[ 1 ]
    TOKENS_FOLLOWING_variable_name_IN_functions_1552 = Set[ 33 ]
    TOKENS_FOLLOWING_LPAREN_IN_functions_1556 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_expression_list_IN_functions_1558 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_functions_1560 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_expression_list_1579 = Set[ 1, 12 ]
    TOKENS_FOLLOWING_COMMA_IN_expression_list_1584 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_expression_list_IN_expression_list_1586 = Set[ 1, 12 ]
    TOKENS_FOLLOWING_RBRACE_IN_synpred1_Rubik_653 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0

end
