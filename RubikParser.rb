#!/usr/bin/env ruby
#
# Rubik.g
# --
# Generated using ANTLR version: 3.5
# Ruby runtime library version: 1.10.0
# Input grammar file: Rubik.g
# Generated at: 2013-11-27 10:02:02
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
    define_tokens( :EOF => -1, :T__58 => 58, :T__59 => 59, :AND => 4, :ASGN => 5, 
                   :BLOCK => 6, :BOOLEAN => 7, :BREAK => 8, :CHANGE_COLOR => 9, 
                   :CHANGE_DIR => 10, :COLOR => 11, :COMMA => 12, :DEF => 13, 
                   :DIR => 14, :DIV => 15, :DO => 16, :DOT => 17, :DRAW_CIRCLE => 18, 
                   :DRAW_RECTANGLE => 19, :DRAW_SQUARE => 20, :ELSE => 21, 
                   :EQ => 22, :FLOAT => 23, :GEQ => 24, :GREATER => 25, 
                   :ID => 26, :IF => 27, :INT => 28, :LBRACE => 29, :LBRAK => 30, 
                   :LEQ => 31, :LESS => 32, :LPAREN => 33, :MINUS => 34, 
                   :NEG => 35, :NEQ => 36, :NEWLINE => 37, :NULL => 38, 
                   :OR => 39, :PEN_DOWN => 40, :PEN_UP => 41, :PLUS => 42, 
                   :RBRACE => 43, :RBRAK => 44, :RPAREN => 45, :R_BEGIN => 46, 
                   :R_END => 47, :R_MOVE => 48, :R_RESET => 49, :R_RETURN => 50, 
                   :SEMI => 51, :STAR => 52, :STRING => 53, :TIMES => 54, 
                   :TLK => 55, :VAR_TYPE => 56, :WS => 57 )


    # register the proper human-readable name or literal value
    # for each token type
    #
    # this is necessary because anonymous tokens, which are
    # created from literal values in the grammar, do not
    # have descriptive names
    register_names( "AND", "ASGN", "BLOCK", "BOOLEAN", "BREAK", "CHANGE_COLOR", 
                    "CHANGE_DIR", "COLOR", "COMMA", "DEF", "DIR", "DIV", 
                    "DO", "DOT", "DRAW_CIRCLE", "DRAW_RECTANGLE", "DRAW_SQUARE", 
                    "ELSE", "EQ", "FLOAT", "GEQ", "GREATER", "ID", "IF", 
                    "INT", "LBRACE", "LBRAK", "LEQ", "LESS", "LPAREN", "MINUS", 
                    "NEG", "NEQ", "NEWLINE", "NULL", "OR", "PEN_DOWN", "PEN_UP", 
                    "PLUS", "RBRACE", "RBRAK", "RPAREN", "R_BEGIN", "R_END", 
                    "R_MOVE", "R_RESET", "R_RETURN", "SEMI", "STAR", "STRING", 
                    "TIMES", "TLK", "VAR_TYPE", "WS", "'gets'", "'print'" )


  end


  class Parser < ANTLR3::Parser
    @grammar_home = Rubik
    include ANTLR3::ASTBuilder

    RULE_METHODS = [ :program, :block, :statement_block, :statement, :statement_end, 
                     :robot_statement, :return_statement, :variable_statement, 
                     :variable_declaration_list, :variable_declaration, 
                     :declaration_target, :assignment_statement, :condition_statement, 
                     :expression, :relation_op, :exp, :term, :factor, :write_statement, 
                     :write_expression, :read_statement, :loop_statement, 
                     :function, :function_parameters, :parameters, :robot, 
                     :variable_name, :primary, :primitive, :arrays, :functions, 
                     :expression_list, :synpred1_Rubik ].freeze

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
          @check_bool = nil
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
    # 82:1: program : ( function )* 'begin' statement_end ! ( block )+ 'end' statement_end !;
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


      # at line 83:7: ( function )* 'begin' statement_end ! ( block )+ 'end' statement_end !
      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         goto_main 
        # <-- action
      end

      # at line 83:21: ( function )*
      while true # decision 1
        alt_1 = 2
        look_1_0 = @input.peek( 1 )

        if ( look_1_0 == DEF )
          alt_1 = 1

        end
        case alt_1
        when 1
          # at line 83:21: function
          @state.following.push( TOKENS_FOLLOWING_function_IN_program_471 )
          function1 = function
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, function1.tree )
          end


        else
          break # out of loop for decision 1
        end
      end # loop for decision 1

      string_literal2 = match( R_BEGIN, TOKENS_FOLLOWING_R_BEGIN_IN_program_474 )
      if @state.backtracking == 0
        tree_for_string_literal2 = @adaptor.create_with_payload( string_literal2 )
        @adaptor.add_child( root_0, tree_for_string_literal2 )

      end

      @state.following.push( TOKENS_FOLLOWING_statement_end_IN_program_476 )
      statement_end3 = statement_end
      @state.following.pop

      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         fill_main 
        # <-- action
      end

      # at file 84:9: ( block )+
      match_count_2 = 0
      while true
        alt_2 = 2
        look_2_0 = @input.peek( 1 )

        if ( look_2_0.between?( CHANGE_COLOR, CHANGE_DIR ) || look_2_0 == DEF || look_2_0 == DO || look_2_0.between?( DRAW_CIRCLE, DRAW_SQUARE ) || look_2_0.between?( ID, IF ) || look_2_0 == LBRACE || look_2_0.between?( PEN_DOWN, PEN_UP ) || look_2_0.between?( R_MOVE, R_RETURN ) || look_2_0.between?( TLK, VAR_TYPE ) || look_2_0.between?( T__58, T__59 ) )
          alt_2 = 1

        end
        case alt_2
        when 1
          # at line 84:9: block
          @state.following.push( TOKENS_FOLLOWING_block_IN_program_489 )
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


      string_literal5 = match( R_END, TOKENS_FOLLOWING_R_END_IN_program_492 )
      if @state.backtracking == 0
        tree_for_string_literal5 = @adaptor.create_with_payload( string_literal5 )
        @adaptor.add_child( root_0, tree_for_string_literal5 )

      end

      @state.following.push( TOKENS_FOLLOWING_statement_end_IN_program_494 )
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
    # 87:1: block : ( statement | statement_block );
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
      # at line 88:5: ( statement | statement_block )
      alt_3 = 2
      look_3_0 = @input.peek( 1 )

      if ( look_3_0.between?( CHANGE_COLOR, CHANGE_DIR ) || look_3_0 == DEF || look_3_0 == DO || look_3_0.between?( DRAW_CIRCLE, DRAW_SQUARE ) || look_3_0.between?( ID, IF ) || look_3_0.between?( PEN_DOWN, PEN_UP ) || look_3_0.between?( R_MOVE, R_RETURN ) || look_3_0.between?( TLK, VAR_TYPE ) || look_3_0.between?( T__58, T__59 ) )
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


        # at line 88:7: statement
        @state.following.push( TOKENS_FOLLOWING_statement_IN_block_512 )
        statement7 = statement
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, statement7.tree )
        end


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 89:7: statement_block
        @state.following.push( TOKENS_FOLLOWING_statement_block_IN_block_520 )
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
    # 92:1: statement_block : '{' ( statement )* '}' ;
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


      # at line 93:7: '{' ( statement )* '}'
      char_literal9 = match( LBRACE, TOKENS_FOLLOWING_LBRACE_IN_statement_block_537 )
      if @state.backtracking == 0
        tree_for_char_literal9 = @adaptor.create_with_payload( char_literal9 )
        @adaptor.add_child( root_0, tree_for_char_literal9 )

      end

      # at line 93:11: ( statement )*
      while true # decision 4
        alt_4 = 2
        look_4_0 = @input.peek( 1 )

        if ( look_4_0.between?( CHANGE_COLOR, CHANGE_DIR ) || look_4_0 == DEF || look_4_0 == DO || look_4_0.between?( DRAW_CIRCLE, DRAW_SQUARE ) || look_4_0.between?( ID, IF ) || look_4_0.between?( PEN_DOWN, PEN_UP ) || look_4_0.between?( R_MOVE, R_RETURN ) || look_4_0.between?( TLK, VAR_TYPE ) || look_4_0.between?( T__58, T__59 ) )
          alt_4 = 1

        end
        case alt_4
        when 1
          # at line 93:11: statement
          @state.following.push( TOKENS_FOLLOWING_statement_IN_statement_block_539 )
          statement10 = statement
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, statement10.tree )
          end


        else
          break # out of loop for decision 4
        end
      end # loop for decision 4

      char_literal11 = match( RBRACE, TOKENS_FOLLOWING_RBRACE_IN_statement_block_542 )
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
    # 98:1: statement : ( robot_statement | variable_statement | assignment_statement | condition_statement | write_statement | read_statement | loop_statement | return_statement | function );
    #
    def statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 4 )


      return_value = StatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      robot_statement12 = nil
      variable_statement13 = nil
      assignment_statement14 = nil
      condition_statement15 = nil
      write_statement16 = nil
      read_statement17 = nil
      loop_statement18 = nil
      return_statement19 = nil
      function20 = nil



      begin
      # at line 99:5: ( robot_statement | variable_statement | assignment_statement | condition_statement | write_statement | read_statement | loop_statement | return_statement | function )
      alt_5 = 9
      case look_5 = @input.peek( 1 )
      when CHANGE_COLOR, CHANGE_DIR, DRAW_CIRCLE, DRAW_RECTANGLE, DRAW_SQUARE, PEN_DOWN, PEN_UP, R_MOVE, R_RESET, TLK then alt_5 = 1
      when VAR_TYPE then alt_5 = 2
      when ID then alt_5 = 3
      when IF then alt_5 = 4
      when T__59 then alt_5 = 5
      when T__58 then alt_5 = 6
      when DO then alt_5 = 7
      when R_RETURN then alt_5 = 8
      when DEF then alt_5 = 9
      else
        @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )



        raise NoViableAlternative( "", 5, 0 )

      end
      case alt_5
      when 1
        root_0 = @adaptor.create_flat_list


        # at line 99:7: robot_statement
        @state.following.push( TOKENS_FOLLOWING_robot_statement_IN_statement_561 )
        robot_statement12 = robot_statement
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, robot_statement12.tree )
        end


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 100:7: variable_statement
        @state.following.push( TOKENS_FOLLOWING_variable_statement_IN_statement_569 )
        variable_statement13 = variable_statement
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, variable_statement13.tree )
        end


      when 3
        root_0 = @adaptor.create_flat_list


        # at line 101:7: assignment_statement
        @state.following.push( TOKENS_FOLLOWING_assignment_statement_IN_statement_577 )
        assignment_statement14 = assignment_statement
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, assignment_statement14.tree )
        end


      when 4
        root_0 = @adaptor.create_flat_list


        # at line 102:7: condition_statement
        @state.following.push( TOKENS_FOLLOWING_condition_statement_IN_statement_585 )
        condition_statement15 = condition_statement
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, condition_statement15.tree )
        end


      when 5
        root_0 = @adaptor.create_flat_list


        # at line 103:7: write_statement
        @state.following.push( TOKENS_FOLLOWING_write_statement_IN_statement_593 )
        write_statement16 = write_statement
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, write_statement16.tree )
        end


      when 6
        root_0 = @adaptor.create_flat_list


        # at line 104:7: read_statement
        @state.following.push( TOKENS_FOLLOWING_read_statement_IN_statement_601 )
        read_statement17 = read_statement
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, read_statement17.tree )
        end


      when 7
        root_0 = @adaptor.create_flat_list


        # at line 105:7: loop_statement
        @state.following.push( TOKENS_FOLLOWING_loop_statement_IN_statement_609 )
        loop_statement18 = loop_statement
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, loop_statement18.tree )
        end


      when 8
        root_0 = @adaptor.create_flat_list


        # at line 106:7: return_statement
        @state.following.push( TOKENS_FOLLOWING_return_statement_IN_statement_617 )
        return_statement19 = return_statement
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, return_statement19.tree )
        end


      when 9
        root_0 = @adaptor.create_flat_list


        # at line 107:7: function
        @state.following.push( TOKENS_FOLLOWING_function_IN_statement_625 )
        function20 = function
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, function20.tree )
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
    # 110:1: statement_end : ( ';' | ( '}' )=>| EOF );
    #
    def statement_end
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 5 )


      return_value = StatementEndReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal21 = nil
      __EOF22__ = nil


      tree_for_char_literal21 = nil
      tree_for_EOF22 = nil

      begin
      # at line 111:5: ( ';' | ( '}' )=>| EOF )
      alt_6 = 3
      look_6_0 = @input.peek( 1 )

      if ( look_6_0 == SEMI )
        alt_6 = 1
      elsif ( look_6_0 == CHANGE_COLOR ) and ( syntactic_predicate?( :synpred1_Rubik ) )
        alt_6 = 2
      elsif ( look_6_0 == CHANGE_DIR ) and ( syntactic_predicate?( :synpred1_Rubik ) )
        alt_6 = 2
      elsif ( look_6_0 == TLK ) and ( syntactic_predicate?( :synpred1_Rubik ) )
        alt_6 = 2
      elsif ( look_6_0 == PEN_DOWN ) and ( syntactic_predicate?( :synpred1_Rubik ) )
        alt_6 = 2
      elsif ( look_6_0 == PEN_UP ) and ( syntactic_predicate?( :synpred1_Rubik ) )
        alt_6 = 2
      elsif ( look_6_0 == R_RESET ) and ( syntactic_predicate?( :synpred1_Rubik ) )
        alt_6 = 2
      elsif ( look_6_0 == DRAW_CIRCLE ) and ( syntactic_predicate?( :synpred1_Rubik ) )
        alt_6 = 2
      elsif ( look_6_0 == DRAW_SQUARE ) and ( syntactic_predicate?( :synpred1_Rubik ) )
        alt_6 = 2
      elsif ( look_6_0 == DRAW_RECTANGLE ) and ( syntactic_predicate?( :synpred1_Rubik ) )
        alt_6 = 2
      elsif ( look_6_0 == R_MOVE ) and ( syntactic_predicate?( :synpred1_Rubik ) )
        alt_6 = 2
      elsif ( look_6_0 == VAR_TYPE ) and ( syntactic_predicate?( :synpred1_Rubik ) )
        alt_6 = 2
      elsif ( look_6_0 == ID ) and ( syntactic_predicate?( :synpred1_Rubik ) )
        alt_6 = 2
      elsif ( look_6_0 == IF ) and ( syntactic_predicate?( :synpred1_Rubik ) )
        alt_6 = 2
      elsif ( look_6_0 == T__59 ) and ( syntactic_predicate?( :synpred1_Rubik ) )
        alt_6 = 2
      elsif ( look_6_0 == T__58 ) and ( syntactic_predicate?( :synpred1_Rubik ) )
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
        look_6_21 = @input.peek( 2 )

        if ( look_6_21 == EOF || look_6_21.between?( CHANGE_COLOR, CHANGE_DIR ) || look_6_21 == DEF || look_6_21 == DO || look_6_21.between?( DRAW_CIRCLE, ELSE ) || look_6_21.between?( ID, IF ) || look_6_21 == LBRACE || look_6_21.between?( PEN_DOWN, PEN_UP ) || look_6_21 == RBRACE || look_6_21.between?( R_BEGIN, R_RETURN ) || look_6_21.between?( TLK, VAR_TYPE ) || look_6_21.between?( T__58, T__59 ) )
          alt_6 = 3
        else
          @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )



          raise NoViableAlternative( "", 6, 21 )

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


        # at line 111:7: ';'
        char_literal21 = match( SEMI, TOKENS_FOLLOWING_SEMI_IN_statement_end_642 )
        if @state.backtracking == 0
          tree_for_char_literal21 = @adaptor.create_with_payload( char_literal21 )
          @adaptor.add_child( root_0, tree_for_char_literal21 )

        end


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 112:7: ( '}' )=>

      when 3
        root_0 = @adaptor.create_flat_list


        # at line 113:7: EOF
        __EOF22__ = match( EOF, TOKENS_FOLLOWING_EOF_IN_statement_end_663 )
        if @state.backtracking == 0
          tree_for_EOF22 = @adaptor.create_with_payload( __EOF22__ )
          @adaptor.add_child( root_0, tree_for_EOF22 )

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

    RobotStatementReturnValue = define_return_scope

    #
    # parser rule robot_statement
    #
    # (in Rubik.g)
    # 116:1: robot_statement : robot statement_end !;
    #
    def robot_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 6 )


      return_value = RobotStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      robot23 = nil
      statement_end24 = nil



      begin
      root_0 = @adaptor.create_flat_list


      # at line 117:7: robot statement_end !
      @state.following.push( TOKENS_FOLLOWING_robot_IN_robot_statement_680 )
      robot23 = robot
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, robot23.tree )
      end

      @state.following.push( TOKENS_FOLLOWING_statement_end_IN_robot_statement_682 )
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

    ReturnStatementReturnValue = define_return_scope

    #
    # parser rule return_statement
    #
    # (in Rubik.g)
    # 120:1: return_statement : 'return' expression statement_end !;
    #
    def return_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 7 )


      return_value = ReturnStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal25 = nil
      expression26 = nil
      statement_end27 = nil


      tree_for_string_literal25 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 121:7: 'return' expression statement_end !
      string_literal25 = match( R_RETURN, TOKENS_FOLLOWING_R_RETURN_IN_return_statement_700 )
      if @state.backtracking == 0
        tree_for_string_literal25 = @adaptor.create_with_payload( string_literal25 )
        @adaptor.add_child( root_0, tree_for_string_literal25 )

      end

      @state.following.push( TOKENS_FOLLOWING_expression_IN_return_statement_702 )
      expression26 = expression
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, expression26.tree )
      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         return_expression 
        # <-- action
      end

      @state.following.push( TOKENS_FOLLOWING_statement_end_IN_return_statement_706 )
      statement_end27 = statement_end
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

    VariableStatementReturnValue = define_return_scope

    #
    # parser rule variable_statement
    #
    # (in Rubik.g)
    # 124:1: variable_statement : VAR_TYPE variable_declaration_list statement_end !;
    #
    def variable_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 8 )


      return_value = VariableStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __VAR_TYPE28__ = nil
      variable_declaration_list29 = nil
      statement_end30 = nil


      tree_for_VAR_TYPE28 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 128:7: VAR_TYPE variable_declaration_list statement_end !
      __VAR_TYPE28__ = match( VAR_TYPE, TOKENS_FOLLOWING_VAR_TYPE_IN_variable_statement_729 )
      if @state.backtracking == 0
        tree_for_VAR_TYPE28 = @adaptor.create_with_payload( __VAR_TYPE28__ )
        @adaptor.add_child( root_0, tree_for_VAR_TYPE28 )

      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         @current_var_type = __VAR_TYPE28__.text 
        # <-- action
      end

      @state.following.push( TOKENS_FOLLOWING_variable_declaration_list_IN_variable_statement_733 )
      variable_declaration_list29 = variable_declaration_list
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, variable_declaration_list29.tree )
      end

      @state.following.push( TOKENS_FOLLOWING_statement_end_IN_variable_statement_735 )
      statement_end30 = statement_end
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
        # trace_out( __method__, 8 )


      end

      return return_value
    end

    VariableDeclarationListReturnValue = define_return_scope

    #
    # parser rule variable_declaration_list
    #
    # (in Rubik.g)
    # 131:1: variable_declaration_list : variable_declaration ( ',' variable_declaration )* ;
    #
    def variable_declaration_list
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 9 )


      return_value = VariableDeclarationListReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal32 = nil
      variable_declaration31 = nil
      variable_declaration33 = nil


      tree_for_char_literal32 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 132:7: variable_declaration ( ',' variable_declaration )*
      @state.following.push( TOKENS_FOLLOWING_variable_declaration_IN_variable_declaration_list_753 )
      variable_declaration31 = variable_declaration
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, variable_declaration31.tree )
      end

      # at line 132:28: ( ',' variable_declaration )*
      while true # decision 7
        alt_7 = 2
        look_7_0 = @input.peek( 1 )

        if ( look_7_0 == COMMA )
          alt_7 = 1

        end
        case alt_7
        when 1
          # at line 132:29: ',' variable_declaration
          char_literal32 = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_variable_declaration_list_756 )
          if @state.backtracking == 0
            tree_for_char_literal32 = @adaptor.create_with_payload( char_literal32 )
            @adaptor.add_child( root_0, tree_for_char_literal32 )

          end

          @state.following.push( TOKENS_FOLLOWING_variable_declaration_IN_variable_declaration_list_758 )
          variable_declaration33 = variable_declaration
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, variable_declaration33.tree )
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
        # trace_out( __method__, 9 )


      end

      return return_value
    end

    VariableDeclarationReturnValue = define_return_scope

    #
    # parser rule variable_declaration
    #
    # (in Rubik.g)
    # 135:1: variable_declaration : declaration_target ( '=' expression )? ;
    #
    def variable_declaration
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 10 )


      return_value = VariableDeclarationReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal35 = nil
      declaration_target34 = nil
      expression36 = nil


      tree_for_char_literal35 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 136:7: declaration_target ( '=' expression )?
      @state.following.push( TOKENS_FOLLOWING_declaration_target_IN_variable_declaration_777 )
      declaration_target34 = declaration_target
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, declaration_target34.tree )
      end

      # at line 136:26: ( '=' expression )?
      alt_8 = 2
      look_8_0 = @input.peek( 1 )

      if ( look_8_0 == ASGN )
        alt_8 = 1
      end
      case alt_8
      when 1
        # at line 136:27: '=' expression
        char_literal35 = match( ASGN, TOKENS_FOLLOWING_ASGN_IN_variable_declaration_780 )
        if @state.backtracking == 0
          tree_for_char_literal35 = @adaptor.create_with_payload( char_literal35 )
          @adaptor.add_child( root_0, tree_for_char_literal35 )

        end

        @state.following.push( TOKENS_FOLLOWING_expression_IN_variable_declaration_782 )
        expression36 = expression
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression36.tree )
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

    DeclarationTargetReturnValue = define_return_scope

    #
    # parser rule declaration_target
    #
    # (in Rubik.g)
    # 139:1: declaration_target : variable_name ( '[' INT ']' )? ;
    #
    def declaration_target
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 11 )


      return_value = DeclarationTargetReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal38 = nil
      __INT39__ = nil
      char_literal40 = nil
      variable_name37 = nil


      tree_for_char_literal38 = nil
      tree_for_INT39 = nil
      tree_for_char_literal40 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 140:7: variable_name ( '[' INT ']' )?
      @state.following.push( TOKENS_FOLLOWING_variable_name_IN_declaration_target_801 )
      variable_name37 = variable_name
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, variable_name37.tree )
      end

      # at line 140:21: ( '[' INT ']' )?
      alt_9 = 2
      look_9_0 = @input.peek( 1 )

      if ( look_9_0 == LBRAK )
        alt_9 = 1
      end
      case alt_9
      when 1
        # at line 140:22: '[' INT ']'
        char_literal38 = match( LBRAK, TOKENS_FOLLOWING_LBRAK_IN_declaration_target_804 )
        if @state.backtracking == 0
          tree_for_char_literal38 = @adaptor.create_with_payload( char_literal38 )
          @adaptor.add_child( root_0, tree_for_char_literal38 )

        end

        __INT39__ = match( INT, TOKENS_FOLLOWING_INT_IN_declaration_target_806 )
        if @state.backtracking == 0
          tree_for_INT39 = @adaptor.create_with_payload( __INT39__ )
          @adaptor.add_child( root_0, tree_for_INT39 )

        end

        char_literal40 = match( RBRAK, TOKENS_FOLLOWING_RBRAK_IN_declaration_target_808 )
        if @state.backtracking == 0
          tree_for_char_literal40 = @adaptor.create_with_payload( char_literal40 )
          @adaptor.add_child( root_0, tree_for_char_literal40 )

        end


      end

      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         define_variable(( variable_name37 && @input.to_s( variable_name37.start, variable_name37.stop ) ), @current_var_type, (__INT39__.nil? ? 1 : __INT39__.text)) 
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

    AssignmentStatementReturnValue = define_return_scope

    #
    # parser rule assignment_statement
    #
    # (in Rubik.g)
    # 143:1: assignment_statement : variable_name ( '[' exp ']' )? '=' expression statement_end !;
    #
    def assignment_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 12 )


      return_value = AssignmentStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal42 = nil
      char_literal44 = nil
      char_literal45 = nil
      variable_name41 = nil
      exp43 = nil
      expression46 = nil
      statement_end47 = nil


      tree_for_char_literal42 = nil
      tree_for_char_literal44 = nil
      tree_for_char_literal45 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 144:7: variable_name ( '[' exp ']' )? '=' expression statement_end !
      @state.following.push( TOKENS_FOLLOWING_variable_name_IN_assignment_statement_829 )
      variable_name41 = variable_name
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, variable_name41.tree )
      end

      # at line 144:21: ( '[' exp ']' )?
      alt_10 = 2
      look_10_0 = @input.peek( 1 )

      if ( look_10_0 == LBRAK )
        alt_10 = 1
      end
      case alt_10
      when 1
        # at line 144:22: '[' exp ']'
        char_literal42 = match( LBRAK, TOKENS_FOLLOWING_LBRAK_IN_assignment_statement_832 )
        if @state.backtracking == 0
          tree_for_char_literal42 = @adaptor.create_with_payload( char_literal42 )
          @adaptor.add_child( root_0, tree_for_char_literal42 )

        end

        @state.following.push( TOKENS_FOLLOWING_exp_IN_assignment_statement_834 )
        exp43 = exp
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, exp43.tree )
        end

        char_literal44 = match( RBRAK, TOKENS_FOLLOWING_RBRAK_IN_assignment_statement_836 )
        if @state.backtracking == 0
          tree_for_char_literal44 = @adaptor.create_with_payload( char_literal44 )
          @adaptor.add_child( root_0, tree_for_char_literal44 )

        end


      end

      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         assign(( variable_name41 && @input.to_s( variable_name41.start, variable_name41.stop ) ), ( exp43 && @input.to_s( exp43.start, exp43.stop ) )) 
        # <-- action
      end

      char_literal45 = match( ASGN, TOKENS_FOLLOWING_ASGN_IN_assignment_statement_842 )
      if @state.backtracking == 0
        tree_for_char_literal45 = @adaptor.create_with_payload( char_literal45 )
        @adaptor.add_child( root_0, tree_for_char_literal45 )

      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         exp2('=') 
        # <-- action
      end

      @state.following.push( TOKENS_FOLLOWING_expression_IN_assignment_statement_846 )
      expression46 = expression
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, expression46.tree )
      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         exp9 
        # <-- action
      end

      @state.following.push( TOKENS_FOLLOWING_statement_end_IN_assignment_statement_850 )
      statement_end47 = statement_end
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
        # trace_out( __method__, 12 )


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
      # trace_in( __method__, 13 )


      return_value = ConditionStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal48 = nil
      char_literal49 = nil
      char_literal51 = nil
      string_literal53 = nil
      expression50 = nil
      block52 = nil
      block54 = nil


      tree_for_string_literal48 = nil
      tree_for_char_literal49 = nil
      tree_for_char_literal51 = nil
      tree_for_string_literal53 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 148:7: 'if' '(' expression ')' block ( 'else' block )?
      string_literal48 = match( IF, TOKENS_FOLLOWING_IF_IN_condition_statement_868 )
      if @state.backtracking == 0
        tree_for_string_literal48 = @adaptor.create_with_payload( string_literal48 )
        @adaptor.add_child( root_0, tree_for_string_literal48 )

      end

      char_literal49 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_condition_statement_870 )
      if @state.backtracking == 0
        tree_for_char_literal49 = @adaptor.create_with_payload( char_literal49 )
        @adaptor.add_child( root_0, tree_for_char_literal49 )

      end

      @state.following.push( TOKENS_FOLLOWING_expression_IN_condition_statement_872 )
      expression50 = expression
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, expression50.tree )
      end

      char_literal51 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_condition_statement_874 )
      if @state.backtracking == 0
        tree_for_char_literal51 = @adaptor.create_with_payload( char_literal51 )
        @adaptor.add_child( root_0, tree_for_char_literal51 )

      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         if1 
        # <-- action
      end

      @state.following.push( TOKENS_FOLLOWING_block_IN_condition_statement_877 )
      block52 = block
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, block52.tree )
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

        string_literal53 = match( ELSE, TOKENS_FOLLOWING_ELSE_IN_condition_statement_882 )
        if @state.backtracking == 0
          tree_for_string_literal53 = @adaptor.create_with_payload( string_literal53 )
          @adaptor.add_child( root_0, tree_for_string_literal53 )

        end

        @state.following.push( TOKENS_FOLLOWING_block_IN_condition_statement_884 )
        block54 = block
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, block54.tree )
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
        # trace_out( __method__, 13 )


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
      # trace_in( __method__, 14 )


      return_value = ExpressionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      exp55 = nil
      relation_op56 = nil
      exp57 = nil



      begin
      root_0 = @adaptor.create_flat_list


      # at line 152:7: exp ( relation_op exp )?
      @state.following.push( TOKENS_FOLLOWING_exp_IN_expression_905 )
      exp55 = exp
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, exp55.tree )
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
        @state.following.push( TOKENS_FOLLOWING_relation_op_IN_expression_908 )
        relation_op56 = relation_op
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, relation_op56.tree )
        end


        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           exp2(input.look(-1).text) 
          # <-- action
        end

        @state.following.push( TOKENS_FOLLOWING_exp_IN_expression_912 )
        exp57 = exp
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, exp57.tree )
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
        # trace_out( __method__, 14 )


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
      # trace_in( __method__, 15 )


      return_value = RelationOpReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      set58 = nil


      tree_for_set58 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 
      set58 = @input.look

      if @input.peek(1) == EQ || @input.peek( 1 ).between?( GEQ, GREATER ) || @input.peek( 1 ).between?( LEQ, LESS ) || @input.peek(1) == NEQ
        @input.consume
        if @state.backtracking == 0
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set58 ) )
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
        # trace_out( __method__, 15 )


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
      # trace_in( __method__, 16 )


      return_value = ExpReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      set60 = nil
      term59 = nil
      exp61 = nil


      tree_for_set60 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 165:7: term ( ( '+' | '-' ) exp )?
      @state.following.push( TOKENS_FOLLOWING_term_IN_exp_990 )
      term59 = term
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, term59.tree )
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
        set60 = @input.look

        if @input.peek(1) == MINUS || @input.peek(1) == PLUS
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

        @state.following.push( TOKENS_FOLLOWING_exp_IN_exp_1003 )
        exp61 = exp
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, exp61.tree )
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

    TermReturnValue = define_return_scope

    #
    # parser rule term
    #
    # (in Rubik.g)
    # 168:1: term : factor ( ( '*' | '/' ) term )? ;
    #
    def term
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )


      return_value = TermReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      set63 = nil
      factor62 = nil
      term64 = nil


      tree_for_set63 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 169:7: factor ( ( '*' | '/' ) term )?
      @state.following.push( TOKENS_FOLLOWING_factor_IN_term_1022 )
      factor62 = factor
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, factor62.tree )
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
        set63 = @input.look

        if @input.peek(1) == DIV || @input.peek(1) == STAR
          @input.consume
          if @state.backtracking == 0
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set63 ) )
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

        @state.following.push( TOKENS_FOLLOWING_term_IN_term_1035 )
        term64 = term
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, term64.tree )
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

    FactorReturnValue = define_return_scope

    #
    # parser rule factor
    #
    # (in Rubik.g)
    # 172:1: factor : ( '(' expression ')' | ( '-' )? primary );
    #
    def factor
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )


      return_value = FactorReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal65 = nil
      char_literal67 = nil
      char_literal68 = nil
      expression66 = nil
      primary69 = nil


      tree_for_char_literal65 = nil
      tree_for_char_literal67 = nil
      tree_for_char_literal68 = nil

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
        char_literal65 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_factor_1054 )
        if @state.backtracking == 0
          tree_for_char_literal65 = @adaptor.create_with_payload( char_literal65 )
          @adaptor.add_child( root_0, tree_for_char_literal65 )

        end


        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           exp6 
          # <-- action
        end

        @state.following.push( TOKENS_FOLLOWING_expression_IN_factor_1058 )
        expression66 = expression
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression66.tree )
        end

        char_literal67 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_factor_1060 )
        if @state.backtracking == 0
          tree_for_char_literal67 = @adaptor.create_with_payload( char_literal67 )
          @adaptor.add_child( root_0, tree_for_char_literal67 )

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
          char_literal68 = match( MINUS, TOKENS_FOLLOWING_MINUS_IN_factor_1070 )
          if @state.backtracking == 0
            tree_for_char_literal68 = @adaptor.create_with_payload( char_literal68 )
            @adaptor.add_child( root_0, tree_for_char_literal68 )

          end


        end
        @state.following.push( TOKENS_FOLLOWING_primary_IN_factor_1073 )
        primary69 = primary
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, primary69.tree )
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
        # trace_out( __method__, 18 )


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
      # trace_in( __method__, 19 )


      return_value = WriteStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal70 = nil
      char_literal71 = nil
      char_literal73 = nil
      char_literal75 = nil
      write_expression72 = nil
      write_expression74 = nil
      statement_end76 = nil


      tree_for_string_literal70 = nil
      tree_for_char_literal71 = nil
      tree_for_char_literal73 = nil
      tree_for_char_literal75 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 178:7: 'print' '(' write_expression ( '.' write_expression )* ')' statement_end !
      string_literal70 = match( T__59, TOKENS_FOLLOWING_T__59_IN_write_statement_1090 )
      if @state.backtracking == 0
        tree_for_string_literal70 = @adaptor.create_with_payload( string_literal70 )
        @adaptor.add_child( root_0, tree_for_string_literal70 )

      end

      char_literal71 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_write_statement_1092 )
      if @state.backtracking == 0
        tree_for_char_literal71 = @adaptor.create_with_payload( char_literal71 )
        @adaptor.add_child( root_0, tree_for_char_literal71 )

      end

      @state.following.push( TOKENS_FOLLOWING_write_expression_IN_write_statement_1094 )
      write_expression72 = write_expression
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, write_expression72.tree )
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
          char_literal73 = match( DOT, TOKENS_FOLLOWING_DOT_IN_write_statement_1099 )
          if @state.backtracking == 0
            tree_for_char_literal73 = @adaptor.create_with_payload( char_literal73 )
            @adaptor.add_child( root_0, tree_for_char_literal73 )

          end

          @state.following.push( TOKENS_FOLLOWING_write_expression_IN_write_statement_1101 )
          write_expression74 = write_expression
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, write_expression74.tree )
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

      char_literal75 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_write_statement_1107 )
      if @state.backtracking == 0
        tree_for_char_literal75 = @adaptor.create_with_payload( char_literal75 )
        @adaptor.add_child( root_0, tree_for_char_literal75 )

      end

      @state.following.push( TOKENS_FOLLOWING_statement_end_IN_write_statement_1109 )
      statement_end76 = statement_end
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
    # 181:1: write_expression : expression ;
    #
    def write_expression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )


      return_value = WriteExpressionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      expression77 = nil



      begin
      root_0 = @adaptor.create_flat_list


      # at line 182:7: expression
      @state.following.push( TOKENS_FOLLOWING_expression_IN_write_expression_1127 )
      expression77 = expression
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, expression77.tree )
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

    ReadStatementReturnValue = define_return_scope

    #
    # parser rule read_statement
    #
    # (in Rubik.g)
    # 185:1: read_statement : 'gets' '(' ')' statement_end !;
    #
    def read_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )


      return_value = ReadStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal78 = nil
      char_literal79 = nil
      char_literal80 = nil
      statement_end81 = nil


      tree_for_string_literal78 = nil
      tree_for_char_literal79 = nil
      tree_for_char_literal80 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 186:7: 'gets' '(' ')' statement_end !
      string_literal78 = match( T__58, TOKENS_FOLLOWING_T__58_IN_read_statement_1144 )
      if @state.backtracking == 0
        tree_for_string_literal78 = @adaptor.create_with_payload( string_literal78 )
        @adaptor.add_child( root_0, tree_for_string_literal78 )

      end

      char_literal79 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_read_statement_1146 )
      if @state.backtracking == 0
        tree_for_char_literal79 = @adaptor.create_with_payload( char_literal79 )
        @adaptor.add_child( root_0, tree_for_char_literal79 )

      end

      char_literal80 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_read_statement_1148 )
      if @state.backtracking == 0
        tree_for_char_literal80 = @adaptor.create_with_payload( char_literal80 )
        @adaptor.add_child( root_0, tree_for_char_literal80 )

      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         r_gets 
        # <-- action
      end

      @state.following.push( TOKENS_FOLLOWING_statement_end_IN_read_statement_1152 )
      statement_end81 = statement_end
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
        # trace_out( __method__, 21 )


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
      # trace_in( __method__, 22 )


      return_value = LoopStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal82 = nil
      string_literal84 = nil
      exp83 = nil
      block85 = nil


      tree_for_string_literal82 = nil
      tree_for_string_literal84 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 190:7: 'do' exp 'times' block
      string_literal82 = match( DO, TOKENS_FOLLOWING_DO_IN_loop_statement_1170 )
      if @state.backtracking == 0
        tree_for_string_literal82 = @adaptor.create_with_payload( string_literal82 )
        @adaptor.add_child( root_0, tree_for_string_literal82 )

      end

      @state.following.push( TOKENS_FOLLOWING_exp_IN_loop_statement_1172 )
      exp83 = exp
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, exp83.tree )
      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
        times1
        # <-- action
      end

      string_literal84 = match( TIMES, TOKENS_FOLLOWING_TIMES_IN_loop_statement_1175 )
      if @state.backtracking == 0
        tree_for_string_literal84 = @adaptor.create_with_payload( string_literal84 )
        @adaptor.add_child( root_0, tree_for_string_literal84 )

      end

      @state.following.push( TOKENS_FOLLOWING_block_IN_loop_statement_1177 )
      block85 = block
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, block85.tree )
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
        # trace_out( __method__, 22 )


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
      # trace_in( __method__, 23 )


      return_value = FunctionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal86 = nil
      __VAR_TYPE87__ = nil
      variable_name88 = nil
      function_parameters89 = nil
      block90 = nil


      tree_for_string_literal86 = nil
      tree_for_VAR_TYPE87 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 197:7: 'def' VAR_TYPE variable_name function_parameters block
      string_literal86 = match( DEF, TOKENS_FOLLOWING_DEF_IN_function_1201 )
      if @state.backtracking == 0
        tree_for_string_literal86 = @adaptor.create_with_payload( string_literal86 )
        @adaptor.add_child( root_0, tree_for_string_literal86 )

      end

      __VAR_TYPE87__ = match( VAR_TYPE, TOKENS_FOLLOWING_VAR_TYPE_IN_function_1203 )
      if @state.backtracking == 0
        tree_for_VAR_TYPE87 = @adaptor.create_with_payload( __VAR_TYPE87__ )
        @adaptor.add_child( root_0, tree_for_VAR_TYPE87 )

      end

      @state.following.push( TOKENS_FOLLOWING_variable_name_IN_function_1205 )
      variable_name88 = variable_name
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, variable_name88.tree )
      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         @current_scope = ( variable_name88 && @input.to_s( variable_name88.start, variable_name88.stop ) ); func1(__VAR_TYPE87__.text) 
        # <-- action
      end

      @state.following.push( TOKENS_FOLLOWING_function_parameters_IN_function_1209 )
      function_parameters89 = function_parameters
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, function_parameters89.tree )
      end

      @state.following.push( TOKENS_FOLLOWING_block_IN_function_1211 )
      block90 = block
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, block90.tree )
      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         func3(( block90 && @input.to_s( block90.start, block90.stop ) )) 
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
        # trace_out( __method__, 23 )


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
      # trace_in( __method__, 24 )


      return_value = FunctionParametersReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal91 = nil
      char_literal93 = nil
      parameters92 = nil


      tree_for_char_literal91 = nil
      tree_for_char_literal93 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 201:7: '(' ( parameters )? ')'
      char_literal91 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_function_parameters_1230 )
      if @state.backtracking == 0
        tree_for_char_literal91 = @adaptor.create_with_payload( char_literal91 )
        @adaptor.add_child( root_0, tree_for_char_literal91 )

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
        @state.following.push( TOKENS_FOLLOWING_parameters_IN_function_parameters_1232 )
        parameters92 = parameters
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, parameters92.tree )
        end


      end
      char_literal93 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_function_parameters_1235 )
      if @state.backtracking == 0
        tree_for_char_literal93 = @adaptor.create_with_payload( char_literal93 )
        @adaptor.add_child( root_0, tree_for_char_literal93 )

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
        # trace_out( __method__, 24 )


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
      # trace_in( __method__, 25 )


      return_value = ParametersReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __VAR_TYPE94__ = nil
      char_literal96 = nil
      variable_name95 = nil
      parameters97 = nil


      tree_for_VAR_TYPE94 = nil
      tree_for_char_literal96 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 205:7: VAR_TYPE variable_name ( ',' parameters )*
      __VAR_TYPE94__ = match( VAR_TYPE, TOKENS_FOLLOWING_VAR_TYPE_IN_parameters_1252 )
      if @state.backtracking == 0
        tree_for_VAR_TYPE94 = @adaptor.create_with_payload( __VAR_TYPE94__ )
        @adaptor.add_child( root_0, tree_for_VAR_TYPE94 )

      end

      @state.following.push( TOKENS_FOLLOWING_variable_name_IN_parameters_1254 )
      variable_name95 = variable_name
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, variable_name95.tree )
      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         func2(( variable_name95 && @input.to_s( variable_name95.start, variable_name95.stop ) ), __VAR_TYPE94__.text) 
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
          char_literal96 = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_parameters_1259 )
          if @state.backtracking == 0
            tree_for_char_literal96 = @adaptor.create_with_payload( char_literal96 )
            @adaptor.add_child( root_0, tree_for_char_literal96 )

          end

          @state.following.push( TOKENS_FOLLOWING_parameters_IN_parameters_1261 )
          parameters97 = parameters
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, parameters97.tree )
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
        # trace_out( __method__, 25 )


      end

      return return_value
    end

    RobotReturnValue = define_return_scope

    #
    # parser rule robot
    #
    # (in Rubik.g)
    # 208:1: robot : ( 'change_color' '(' COLOR ')' | 'change_direction' '(' DIR ')' | 'talk' '(' expression ')' | 'pen_down' '(' ')' | 'pen_up' '(' ')' | 'reset' '(' ')' | 'draw_circle' '(' expression ')' | 'draw_square' '(' expression ')' | 'draw_rectangle' '(' expression ',' expression ')' | 'move' '(' expression ')' );
    #
    def robot
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )


      return_value = RobotReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal98 = nil
      char_literal99 = nil
      __COLOR100__ = nil
      char_literal101 = nil
      string_literal102 = nil
      char_literal103 = nil
      __DIR104__ = nil
      char_literal105 = nil
      string_literal106 = nil
      char_literal107 = nil
      char_literal109 = nil
      string_literal110 = nil
      char_literal111 = nil
      char_literal112 = nil
      string_literal113 = nil
      char_literal114 = nil
      char_literal115 = nil
      string_literal116 = nil
      char_literal117 = nil
      char_literal118 = nil
      string_literal119 = nil
      char_literal120 = nil
      char_literal122 = nil
      string_literal123 = nil
      char_literal124 = nil
      char_literal126 = nil
      string_literal127 = nil
      char_literal128 = nil
      char_literal130 = nil
      char_literal132 = nil
      string_literal133 = nil
      char_literal134 = nil
      char_literal136 = nil
      expression108 = nil
      expression121 = nil
      expression125 = nil
      expression129 = nil
      expression131 = nil
      expression135 = nil


      tree_for_string_literal98 = nil
      tree_for_char_literal99 = nil
      tree_for_COLOR100 = nil
      tree_for_char_literal101 = nil
      tree_for_string_literal102 = nil
      tree_for_char_literal103 = nil
      tree_for_DIR104 = nil
      tree_for_char_literal105 = nil
      tree_for_string_literal106 = nil
      tree_for_char_literal107 = nil
      tree_for_char_literal109 = nil
      tree_for_string_literal110 = nil
      tree_for_char_literal111 = nil
      tree_for_char_literal112 = nil
      tree_for_string_literal113 = nil
      tree_for_char_literal114 = nil
      tree_for_char_literal115 = nil
      tree_for_string_literal116 = nil
      tree_for_char_literal117 = nil
      tree_for_char_literal118 = nil
      tree_for_string_literal119 = nil
      tree_for_char_literal120 = nil
      tree_for_char_literal122 = nil
      tree_for_string_literal123 = nil
      tree_for_char_literal124 = nil
      tree_for_char_literal126 = nil
      tree_for_string_literal127 = nil
      tree_for_char_literal128 = nil
      tree_for_char_literal130 = nil
      tree_for_char_literal132 = nil
      tree_for_string_literal133 = nil
      tree_for_char_literal134 = nil
      tree_for_char_literal136 = nil

      begin
      # at line 209:5: ( 'change_color' '(' COLOR ')' | 'change_direction' '(' DIR ')' | 'talk' '(' expression ')' | 'pen_down' '(' ')' | 'pen_up' '(' ')' | 'reset' '(' ')' | 'draw_circle' '(' expression ')' | 'draw_square' '(' expression ')' | 'draw_rectangle' '(' expression ',' expression ')' | 'move' '(' expression ')' )
      alt_20 = 10
      case look_20 = @input.peek( 1 )
      when CHANGE_COLOR then alt_20 = 1
      when CHANGE_DIR then alt_20 = 2
      when TLK then alt_20 = 3
      when PEN_DOWN then alt_20 = 4
      when PEN_UP then alt_20 = 5
      when R_RESET then alt_20 = 6
      when DRAW_CIRCLE then alt_20 = 7
      when DRAW_SQUARE then alt_20 = 8
      when DRAW_RECTANGLE then alt_20 = 9
      when R_MOVE then alt_20 = 10
      else
        @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )



        raise NoViableAlternative( "", 20, 0 )

      end
      case alt_20
      when 1
        root_0 = @adaptor.create_flat_list


        # at line 209:7: 'change_color' '(' COLOR ')'
        string_literal98 = match( CHANGE_COLOR, TOKENS_FOLLOWING_CHANGE_COLOR_IN_robot_1280 )
        if @state.backtracking == 0
          tree_for_string_literal98 = @adaptor.create_with_payload( string_literal98 )
          @adaptor.add_child( root_0, tree_for_string_literal98 )

        end

        char_literal99 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1282 )
        if @state.backtracking == 0
          tree_for_char_literal99 = @adaptor.create_with_payload( char_literal99 )
          @adaptor.add_child( root_0, tree_for_char_literal99 )

        end

        __COLOR100__ = match( COLOR, TOKENS_FOLLOWING_COLOR_IN_robot_1284 )
        if @state.backtracking == 0
          tree_for_COLOR100 = @adaptor.create_with_payload( __COLOR100__ )
          @adaptor.add_child( root_0, tree_for_COLOR100 )

        end

        char_literal101 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1286 )
        if @state.backtracking == 0
          tree_for_char_literal101 = @adaptor.create_with_payload( char_literal101 )
          @adaptor.add_child( root_0, tree_for_char_literal101 )

        end


        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           turtle_change_color(__COLOR100__.text) 
          # <-- action
        end


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 210:7: 'change_direction' '(' DIR ')'
        string_literal102 = match( CHANGE_DIR, TOKENS_FOLLOWING_CHANGE_DIR_IN_robot_1296 )
        if @state.backtracking == 0
          tree_for_string_literal102 = @adaptor.create_with_payload( string_literal102 )
          @adaptor.add_child( root_0, tree_for_string_literal102 )

        end

        char_literal103 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1298 )
        if @state.backtracking == 0
          tree_for_char_literal103 = @adaptor.create_with_payload( char_literal103 )
          @adaptor.add_child( root_0, tree_for_char_literal103 )

        end

        __DIR104__ = match( DIR, TOKENS_FOLLOWING_DIR_IN_robot_1300 )
        if @state.backtracking == 0
          tree_for_DIR104 = @adaptor.create_with_payload( __DIR104__ )
          @adaptor.add_child( root_0, tree_for_DIR104 )

        end

        char_literal105 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1302 )
        if @state.backtracking == 0
          tree_for_char_literal105 = @adaptor.create_with_payload( char_literal105 )
          @adaptor.add_child( root_0, tree_for_char_literal105 )

        end


        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           turtle_change_direction(__DIR104__.text) 
          # <-- action
        end


      when 3
        root_0 = @adaptor.create_flat_list


        # at line 211:7: 'talk' '(' expression ')'
        string_literal106 = match( TLK, TOKENS_FOLLOWING_TLK_IN_robot_1312 )
        if @state.backtracking == 0
          tree_for_string_literal106 = @adaptor.create_with_payload( string_literal106 )
          @adaptor.add_child( root_0, tree_for_string_literal106 )

        end

        char_literal107 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1314 )
        if @state.backtracking == 0
          tree_for_char_literal107 = @adaptor.create_with_payload( char_literal107 )
          @adaptor.add_child( root_0, tree_for_char_literal107 )

        end

        @state.following.push( TOKENS_FOLLOWING_expression_IN_robot_1316 )
        expression108 = expression
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression108.tree )
        end

        char_literal109 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1318 )
        if @state.backtracking == 0
          tree_for_char_literal109 = @adaptor.create_with_payload( char_literal109 )
          @adaptor.add_child( root_0, tree_for_char_literal109 )

        end


        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           turtle_talk 
          # <-- action
        end


      when 4
        root_0 = @adaptor.create_flat_list


        # at line 212:7: 'pen_down' '(' ')'
        string_literal110 = match( PEN_DOWN, TOKENS_FOLLOWING_PEN_DOWN_IN_robot_1328 )
        if @state.backtracking == 0
          tree_for_string_literal110 = @adaptor.create_with_payload( string_literal110 )
          @adaptor.add_child( root_0, tree_for_string_literal110 )

        end

        char_literal111 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1330 )
        if @state.backtracking == 0
          tree_for_char_literal111 = @adaptor.create_with_payload( char_literal111 )
          @adaptor.add_child( root_0, tree_for_char_literal111 )

        end

        char_literal112 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1332 )
        if @state.backtracking == 0
          tree_for_char_literal112 = @adaptor.create_with_payload( char_literal112 )
          @adaptor.add_child( root_0, tree_for_char_literal112 )

        end


        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           turtle_send('pen_down') 
          # <-- action
        end


      when 5
        root_0 = @adaptor.create_flat_list


        # at line 213:7: 'pen_up' '(' ')'
        string_literal113 = match( PEN_UP, TOKENS_FOLLOWING_PEN_UP_IN_robot_1342 )
        if @state.backtracking == 0
          tree_for_string_literal113 = @adaptor.create_with_payload( string_literal113 )
          @adaptor.add_child( root_0, tree_for_string_literal113 )

        end

        char_literal114 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1344 )
        if @state.backtracking == 0
          tree_for_char_literal114 = @adaptor.create_with_payload( char_literal114 )
          @adaptor.add_child( root_0, tree_for_char_literal114 )

        end

        char_literal115 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1346 )
        if @state.backtracking == 0
          tree_for_char_literal115 = @adaptor.create_with_payload( char_literal115 )
          @adaptor.add_child( root_0, tree_for_char_literal115 )

        end


        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           turtle_send('pen_up') 
          # <-- action
        end


      when 6
        root_0 = @adaptor.create_flat_list


        # at line 214:7: 'reset' '(' ')'
        string_literal116 = match( R_RESET, TOKENS_FOLLOWING_R_RESET_IN_robot_1356 )
        if @state.backtracking == 0
          tree_for_string_literal116 = @adaptor.create_with_payload( string_literal116 )
          @adaptor.add_child( root_0, tree_for_string_literal116 )

        end

        char_literal117 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1358 )
        if @state.backtracking == 0
          tree_for_char_literal117 = @adaptor.create_with_payload( char_literal117 )
          @adaptor.add_child( root_0, tree_for_char_literal117 )

        end

        char_literal118 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1360 )
        if @state.backtracking == 0
          tree_for_char_literal118 = @adaptor.create_with_payload( char_literal118 )
          @adaptor.add_child( root_0, tree_for_char_literal118 )

        end


        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           turtle_send('reset') 
          # <-- action
        end


      when 7
        root_0 = @adaptor.create_flat_list


        # at line 215:7: 'draw_circle' '(' expression ')'
        string_literal119 = match( DRAW_CIRCLE, TOKENS_FOLLOWING_DRAW_CIRCLE_IN_robot_1370 )
        if @state.backtracking == 0
          tree_for_string_literal119 = @adaptor.create_with_payload( string_literal119 )
          @adaptor.add_child( root_0, tree_for_string_literal119 )

        end

        char_literal120 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1372 )
        if @state.backtracking == 0
          tree_for_char_literal120 = @adaptor.create_with_payload( char_literal120 )
          @adaptor.add_child( root_0, tree_for_char_literal120 )

        end

        @state.following.push( TOKENS_FOLLOWING_expression_IN_robot_1374 )
        expression121 = expression
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression121.tree )
        end

        char_literal122 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1376 )
        if @state.backtracking == 0
          tree_for_char_literal122 = @adaptor.create_with_payload( char_literal122 )
          @adaptor.add_child( root_0, tree_for_char_literal122 )

        end


        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           turtle_send('draw_circle', 'int') 
          # <-- action
        end


      when 8
        root_0 = @adaptor.create_flat_list


        # at line 216:7: 'draw_square' '(' expression ')'
        string_literal123 = match( DRAW_SQUARE, TOKENS_FOLLOWING_DRAW_SQUARE_IN_robot_1386 )
        if @state.backtracking == 0
          tree_for_string_literal123 = @adaptor.create_with_payload( string_literal123 )
          @adaptor.add_child( root_0, tree_for_string_literal123 )

        end

        char_literal124 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1388 )
        if @state.backtracking == 0
          tree_for_char_literal124 = @adaptor.create_with_payload( char_literal124 )
          @adaptor.add_child( root_0, tree_for_char_literal124 )

        end

        @state.following.push( TOKENS_FOLLOWING_expression_IN_robot_1390 )
        expression125 = expression
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression125.tree )
        end

        char_literal126 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1392 )
        if @state.backtracking == 0
          tree_for_char_literal126 = @adaptor.create_with_payload( char_literal126 )
          @adaptor.add_child( root_0, tree_for_char_literal126 )

        end


        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           turtle_send('draw_square', 'int') 
          # <-- action
        end


      when 9
        root_0 = @adaptor.create_flat_list


        # at line 217:7: 'draw_rectangle' '(' expression ',' expression ')'
        string_literal127 = match( DRAW_RECTANGLE, TOKENS_FOLLOWING_DRAW_RECTANGLE_IN_robot_1402 )
        if @state.backtracking == 0
          tree_for_string_literal127 = @adaptor.create_with_payload( string_literal127 )
          @adaptor.add_child( root_0, tree_for_string_literal127 )

        end

        char_literal128 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1404 )
        if @state.backtracking == 0
          tree_for_char_literal128 = @adaptor.create_with_payload( char_literal128 )
          @adaptor.add_child( root_0, tree_for_char_literal128 )

        end

        @state.following.push( TOKENS_FOLLOWING_expression_IN_robot_1406 )
        expression129 = expression
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression129.tree )
        end

        char_literal130 = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_robot_1408 )
        if @state.backtracking == 0
          tree_for_char_literal130 = @adaptor.create_with_payload( char_literal130 )
          @adaptor.add_child( root_0, tree_for_char_literal130 )

        end

        @state.following.push( TOKENS_FOLLOWING_expression_IN_robot_1410 )
        expression131 = expression
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression131.tree )
        end

        char_literal132 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1412 )
        if @state.backtracking == 0
          tree_for_char_literal132 = @adaptor.create_with_payload( char_literal132 )
          @adaptor.add_child( root_0, tree_for_char_literal132 )

        end


        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           turtle_draw_rectangle 
          # <-- action
        end


      when 10
        root_0 = @adaptor.create_flat_list


        # at line 218:7: 'move' '(' expression ')'
        string_literal133 = match( R_MOVE, TOKENS_FOLLOWING_R_MOVE_IN_robot_1422 )
        if @state.backtracking == 0
          tree_for_string_literal133 = @adaptor.create_with_payload( string_literal133 )
          @adaptor.add_child( root_0, tree_for_string_literal133 )

        end

        char_literal134 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1424 )
        if @state.backtracking == 0
          tree_for_char_literal134 = @adaptor.create_with_payload( char_literal134 )
          @adaptor.add_child( root_0, tree_for_char_literal134 )

        end

        @state.following.push( TOKENS_FOLLOWING_expression_IN_robot_1426 )
        expression135 = expression
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression135.tree )
        end

        char_literal136 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1428 )
        if @state.backtracking == 0
          tree_for_char_literal136 = @adaptor.create_with_payload( char_literal136 )
          @adaptor.add_child( root_0, tree_for_char_literal136 )

        end


        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           turtle_send('move', 'int') 
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
        # trace_out( __method__, 26 )


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
      # trace_in( __method__, 27 )


      return_value = VariableNameReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __ID137__ = nil


      tree_for_ID137 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 224:7: ID
      __ID137__ = match( ID, TOKENS_FOLLOWING_ID_IN_variable_name_1449 )
      if @state.backtracking == 0
        tree_for_ID137 = @adaptor.create_with_payload( __ID137__ )
        @adaptor.add_child( root_0, tree_for_ID137 )

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

    PrimaryReturnValue = define_return_scope

    #
    # parser rule primary
    #
    # (in Rubik.g)
    # 229:1: primary : ( primitive | functions | arrays );
    #
    def primary
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )


      return_value = PrimaryReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      primitive138 = nil
      functions139 = nil
      arrays140 = nil



      begin
      # at line 230:5: ( primitive | functions | arrays )
      alt_21 = 3
      look_21_0 = @input.peek( 1 )

      if ( look_21_0 == BOOLEAN || look_21_0 == FLOAT || look_21_0 == INT || look_21_0 == STRING )
        alt_21 = 1
      elsif ( look_21_0 == ID )
        case look_21 = @input.peek( 2 )
        when EOF, CHANGE_COLOR, CHANGE_DIR, COMMA, DEF, DIV, DO, DOT, DRAW_CIRCLE, DRAW_RECTANGLE, DRAW_SQUARE, ELSE, EQ, GEQ, GREATER, ID, IF, LBRACE, LEQ, LESS, MINUS, NEQ, PEN_DOWN, PEN_UP, PLUS, RBRACE, RBRAK, RPAREN, R_BEGIN, R_END, R_MOVE, R_RESET, R_RETURN, SEMI, STAR, TIMES, TLK, VAR_TYPE, T__58, T__59 then alt_21 = 1
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
        @state.following.push( TOKENS_FOLLOWING_primitive_IN_primary_1468 )
        primitive138 = primitive
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, primitive138.tree )
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
        @state.following.push( TOKENS_FOLLOWING_functions_IN_primary_1478 )
        functions139 = functions
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, functions139.tree )
        end


      when 3
        root_0 = @adaptor.create_flat_list


        # at line 233:7: arrays
        @state.following.push( TOKENS_FOLLOWING_arrays_IN_primary_1486 )
        arrays140 = arrays
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, arrays140.tree )
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

    PrimitiveReturnValue = define_return_scope

    #
    # parser rule primitive
    #
    # (in Rubik.g)
    # 236:1: primitive : ( BOOLEAN | STRING | FLOAT | INT | variable_name );
    #
    def primitive
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 29 )


      return_value = PrimitiveReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __BOOLEAN141__ = nil
      __STRING142__ = nil
      __FLOAT143__ = nil
      __INT144__ = nil
      variable_name145 = nil


      tree_for_BOOLEAN141 = nil
      tree_for_STRING142 = nil
      tree_for_FLOAT143 = nil
      tree_for_INT144 = nil

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
        __BOOLEAN141__ = match( BOOLEAN, TOKENS_FOLLOWING_BOOLEAN_IN_primitive_1503 )
        if @state.backtracking == 0
          tree_for_BOOLEAN141 = @adaptor.create_with_payload( __BOOLEAN141__ )
          @adaptor.add_child( root_0, tree_for_BOOLEAN141 )

        end


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 238:7: STRING
        __STRING142__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_primitive_1511 )
        if @state.backtracking == 0
          tree_for_STRING142 = @adaptor.create_with_payload( __STRING142__ )
          @adaptor.add_child( root_0, tree_for_STRING142 )

        end


      when 3
        root_0 = @adaptor.create_flat_list


        # at line 239:7: FLOAT
        __FLOAT143__ = match( FLOAT, TOKENS_FOLLOWING_FLOAT_IN_primitive_1519 )
        if @state.backtracking == 0
          tree_for_FLOAT143 = @adaptor.create_with_payload( __FLOAT143__ )
          @adaptor.add_child( root_0, tree_for_FLOAT143 )

        end


      when 4
        root_0 = @adaptor.create_flat_list


        # at line 240:7: INT
        __INT144__ = match( INT, TOKENS_FOLLOWING_INT_IN_primitive_1527 )
        if @state.backtracking == 0
          tree_for_INT144 = @adaptor.create_with_payload( __INT144__ )
          @adaptor.add_child( root_0, tree_for_INT144 )

        end


      when 5
        root_0 = @adaptor.create_flat_list


        # at line 241:7: variable_name
        @state.following.push( TOKENS_FOLLOWING_variable_name_IN_primitive_1535 )
        variable_name145 = variable_name
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, variable_name145.tree )
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

    ArraysReturnValue = define_return_scope

    #
    # parser rule arrays
    #
    # (in Rubik.g)
    # 244:1: arrays : variable_name '[' exp ']' ;
    #
    def arrays
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )


      return_value = ArraysReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal147 = nil
      char_literal149 = nil
      variable_name146 = nil
      exp148 = nil


      tree_for_char_literal147 = nil
      tree_for_char_literal149 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 245:7: variable_name '[' exp ']'
      @state.following.push( TOKENS_FOLLOWING_variable_name_IN_arrays_1552 )
      variable_name146 = variable_name
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, variable_name146.tree )
      end

      char_literal147 = match( LBRAK, TOKENS_FOLLOWING_LBRAK_IN_arrays_1554 )
      if @state.backtracking == 0
        tree_for_char_literal147 = @adaptor.create_with_payload( char_literal147 )
        @adaptor.add_child( root_0, tree_for_char_literal147 )

      end

      @state.following.push( TOKENS_FOLLOWING_exp_IN_arrays_1556 )
      exp148 = exp
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, exp148.tree )
      end

      char_literal149 = match( RBRAK, TOKENS_FOLLOWING_RBRAK_IN_arrays_1558 )
      if @state.backtracking == 0
        tree_for_char_literal149 = @adaptor.create_with_payload( char_literal149 )
        @adaptor.add_child( root_0, tree_for_char_literal149 )

      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         array1(( variable_name146 && @input.to_s( variable_name146.start, variable_name146.stop ) ), ( exp148 && @input.to_s( exp148.start, exp148.stop ) )) 
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
        # trace_out( __method__, 30 )


      end

      return return_value
    end

    FunctionsReturnValue = define_return_scope

    #
    # parser rule functions
    #
    # (in Rubik.g)
    # 248:1: functions : variable_name '(' ( expression_list )? ')' ;
    #
    def functions
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 31 )


      return_value = FunctionsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal151 = nil
      char_literal153 = nil
      variable_name150 = nil
      expression_list152 = nil


      tree_for_char_literal151 = nil
      tree_for_char_literal153 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 252:7: variable_name '(' ( expression_list )? ')'
      @state.following.push( TOKENS_FOLLOWING_variable_name_IN_functions_1582 )
      variable_name150 = variable_name
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, variable_name150.tree )
      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         call_func1(( variable_name150 && @input.to_s( variable_name150.start, variable_name150.stop ) )) 
        # <-- action
      end

      char_literal151 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_functions_1586 )
      if @state.backtracking == 0
        tree_for_char_literal151 = @adaptor.create_with_payload( char_literal151 )
        @adaptor.add_child( root_0, tree_for_char_literal151 )

      end

      # at line 252:61: ( expression_list )?
      alt_23 = 2
      look_23_0 = @input.peek( 1 )

      if ( look_23_0 == BOOLEAN || look_23_0 == FLOAT || look_23_0 == ID || look_23_0 == INT || look_23_0.between?( LPAREN, MINUS ) || look_23_0 == STRING )
        alt_23 = 1
      end
      case alt_23
      when 1
        # at line 252:61: expression_list
        @state.following.push( TOKENS_FOLLOWING_expression_list_IN_functions_1588 )
        expression_list152 = expression_list
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression_list152.tree )
        end


      end
      char_literal153 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_functions_1591 )
      if @state.backtracking == 0
        tree_for_char_literal153 = @adaptor.create_with_payload( char_literal153 )
        @adaptor.add_child( root_0, tree_for_char_literal153 )

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
        # trace_out( __method__, 31 )


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
      # trace_in( __method__, 32 )


      return_value = ExpressionListReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal155 = nil
      expression154 = nil
      expression_list156 = nil


      tree_for_char_literal155 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 256:7: expression ( ',' expression_list )*
      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         exp6 
        # <-- action
      end

      @state.following.push( TOKENS_FOLLOWING_expression_IN_expression_list_1612 )
      expression154 = expression
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, expression154.tree )
      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         exp7; call_func2 
        # <-- action
      end

      # at line 256:48: ( ',' expression_list )*
      while true # decision 24
        alt_24 = 2
        look_24_0 = @input.peek( 1 )

        if ( look_24_0 == COMMA )
          alt_24 = 1

        end
        case alt_24
        when 1
          # at line 256:49: ',' expression_list
          char_literal155 = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_expression_list_1617 )
          if @state.backtracking == 0
            tree_for_char_literal155 = @adaptor.create_with_payload( char_literal155 )
            @adaptor.add_child( root_0, tree_for_char_literal155 )

          end

          @state.following.push( TOKENS_FOLLOWING_expression_list_IN_expression_list_1619 )
          expression_list156 = expression_list
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, expression_list156.tree )
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
        # trace_out( __method__, 32 )


      end

      return return_value
    end

    #
    # syntactic predicate synpred1_Rubik
    #
    # (in Rubik.g)
    # 112:7: synpred1_Rubik : '}' ;
    #
    # This is an imaginary rule inserted by ANTLR to
    # implement a syntactic predicate decision
    #
    def synpred1_Rubik
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 33 )


      # at line 112:9: '}'
      match( RBRACE, TOKENS_FOLLOWING_RBRACE_IN_synpred1_Rubik_652 )

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 33 )


    end


    TOKENS_FOLLOWING_function_IN_program_471 = Set[ 13, 46 ]
    TOKENS_FOLLOWING_R_BEGIN_IN_program_474 = Set[ 9, 10, 13, 16, 18, 19, 20, 26, 27, 29, 40, 41, 48, 49, 50, 51, 55, 56, 58, 59 ]
    TOKENS_FOLLOWING_statement_end_IN_program_476 = Set[ 9, 10, 13, 16, 18, 19, 20, 26, 27, 29, 40, 41, 48, 49, 50, 55, 56, 58, 59 ]
    TOKENS_FOLLOWING_block_IN_program_489 = Set[ 9, 10, 13, 16, 18, 19, 20, 26, 27, 29, 40, 41, 47, 48, 49, 50, 55, 56, 58, 59 ]
    TOKENS_FOLLOWING_R_END_IN_program_492 = Set[ 51 ]
    TOKENS_FOLLOWING_statement_end_IN_program_494 = Set[ 1 ]
    TOKENS_FOLLOWING_statement_IN_block_512 = Set[ 1 ]
    TOKENS_FOLLOWING_statement_block_IN_block_520 = Set[ 1 ]
    TOKENS_FOLLOWING_LBRACE_IN_statement_block_537 = Set[ 9, 10, 13, 16, 18, 19, 20, 26, 27, 40, 41, 43, 48, 49, 50, 55, 56, 58, 59 ]
    TOKENS_FOLLOWING_statement_IN_statement_block_539 = Set[ 9, 10, 13, 16, 18, 19, 20, 26, 27, 40, 41, 43, 48, 49, 50, 55, 56, 58, 59 ]
    TOKENS_FOLLOWING_RBRACE_IN_statement_block_542 = Set[ 1 ]
    TOKENS_FOLLOWING_robot_statement_IN_statement_561 = Set[ 1 ]
    TOKENS_FOLLOWING_variable_statement_IN_statement_569 = Set[ 1 ]
    TOKENS_FOLLOWING_assignment_statement_IN_statement_577 = Set[ 1 ]
    TOKENS_FOLLOWING_condition_statement_IN_statement_585 = Set[ 1 ]
    TOKENS_FOLLOWING_write_statement_IN_statement_593 = Set[ 1 ]
    TOKENS_FOLLOWING_read_statement_IN_statement_601 = Set[ 1 ]
    TOKENS_FOLLOWING_loop_statement_IN_statement_609 = Set[ 1 ]
    TOKENS_FOLLOWING_return_statement_IN_statement_617 = Set[ 1 ]
    TOKENS_FOLLOWING_function_IN_statement_625 = Set[ 1 ]
    TOKENS_FOLLOWING_SEMI_IN_statement_end_642 = Set[ 1 ]
    TOKENS_FOLLOWING_EOF_IN_statement_end_663 = Set[ 1 ]
    TOKENS_FOLLOWING_robot_IN_robot_statement_680 = Set[ 51 ]
    TOKENS_FOLLOWING_statement_end_IN_robot_statement_682 = Set[ 1 ]
    TOKENS_FOLLOWING_R_RETURN_IN_return_statement_700 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_expression_IN_return_statement_702 = Set[ 51 ]
    TOKENS_FOLLOWING_statement_end_IN_return_statement_706 = Set[ 1 ]
    TOKENS_FOLLOWING_VAR_TYPE_IN_variable_statement_729 = Set[ 26 ]
    TOKENS_FOLLOWING_variable_declaration_list_IN_variable_statement_733 = Set[ 51 ]
    TOKENS_FOLLOWING_statement_end_IN_variable_statement_735 = Set[ 1 ]
    TOKENS_FOLLOWING_variable_declaration_IN_variable_declaration_list_753 = Set[ 1, 12 ]
    TOKENS_FOLLOWING_COMMA_IN_variable_declaration_list_756 = Set[ 26 ]
    TOKENS_FOLLOWING_variable_declaration_IN_variable_declaration_list_758 = Set[ 1, 12 ]
    TOKENS_FOLLOWING_declaration_target_IN_variable_declaration_777 = Set[ 1, 5 ]
    TOKENS_FOLLOWING_ASGN_IN_variable_declaration_780 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_expression_IN_variable_declaration_782 = Set[ 1 ]
    TOKENS_FOLLOWING_variable_name_IN_declaration_target_801 = Set[ 1, 30 ]
    TOKENS_FOLLOWING_LBRAK_IN_declaration_target_804 = Set[ 28 ]
    TOKENS_FOLLOWING_INT_IN_declaration_target_806 = Set[ 44 ]
    TOKENS_FOLLOWING_RBRAK_IN_declaration_target_808 = Set[ 1 ]
    TOKENS_FOLLOWING_variable_name_IN_assignment_statement_829 = Set[ 5, 30 ]
    TOKENS_FOLLOWING_LBRAK_IN_assignment_statement_832 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_exp_IN_assignment_statement_834 = Set[ 44 ]
    TOKENS_FOLLOWING_RBRAK_IN_assignment_statement_836 = Set[ 5 ]
    TOKENS_FOLLOWING_ASGN_IN_assignment_statement_842 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_expression_IN_assignment_statement_846 = Set[ 51 ]
    TOKENS_FOLLOWING_statement_end_IN_assignment_statement_850 = Set[ 1 ]
    TOKENS_FOLLOWING_IF_IN_condition_statement_868 = Set[ 33 ]
    TOKENS_FOLLOWING_LPAREN_IN_condition_statement_870 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_expression_IN_condition_statement_872 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_condition_statement_874 = Set[ 9, 10, 13, 16, 18, 19, 20, 26, 27, 29, 40, 41, 48, 49, 50, 55, 56, 58, 59 ]
    TOKENS_FOLLOWING_block_IN_condition_statement_877 = Set[ 1, 21 ]
    TOKENS_FOLLOWING_ELSE_IN_condition_statement_882 = Set[ 9, 10, 13, 16, 18, 19, 20, 26, 27, 29, 40, 41, 48, 49, 50, 55, 56, 58, 59 ]
    TOKENS_FOLLOWING_block_IN_condition_statement_884 = Set[ 1 ]
    TOKENS_FOLLOWING_exp_IN_expression_905 = Set[ 1, 22, 24, 25, 31, 32, 36 ]
    TOKENS_FOLLOWING_relation_op_IN_expression_908 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_exp_IN_expression_912 = Set[ 1 ]
    TOKENS_FOLLOWING_term_IN_exp_990 = Set[ 1, 34, 42 ]
    TOKENS_FOLLOWING_set_IN_exp_995 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_exp_IN_exp_1003 = Set[ 1 ]
    TOKENS_FOLLOWING_factor_IN_term_1022 = Set[ 1, 15, 52 ]
    TOKENS_FOLLOWING_set_IN_term_1027 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_term_IN_term_1035 = Set[ 1 ]
    TOKENS_FOLLOWING_LPAREN_IN_factor_1054 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_expression_IN_factor_1058 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_factor_1060 = Set[ 1 ]
    TOKENS_FOLLOWING_MINUS_IN_factor_1070 = Set[ 7, 23, 26, 28, 53 ]
    TOKENS_FOLLOWING_primary_IN_factor_1073 = Set[ 1 ]
    TOKENS_FOLLOWING_T__59_IN_write_statement_1090 = Set[ 33 ]
    TOKENS_FOLLOWING_LPAREN_IN_write_statement_1092 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_write_expression_IN_write_statement_1094 = Set[ 17, 45 ]
    TOKENS_FOLLOWING_DOT_IN_write_statement_1099 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_write_expression_IN_write_statement_1101 = Set[ 17, 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_write_statement_1107 = Set[ 51 ]
    TOKENS_FOLLOWING_statement_end_IN_write_statement_1109 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_write_expression_1127 = Set[ 1 ]
    TOKENS_FOLLOWING_T__58_IN_read_statement_1144 = Set[ 33 ]
    TOKENS_FOLLOWING_LPAREN_IN_read_statement_1146 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_read_statement_1148 = Set[ 51 ]
    TOKENS_FOLLOWING_statement_end_IN_read_statement_1152 = Set[ 1 ]
    TOKENS_FOLLOWING_DO_IN_loop_statement_1170 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_exp_IN_loop_statement_1172 = Set[ 54 ]
    TOKENS_FOLLOWING_TIMES_IN_loop_statement_1175 = Set[ 9, 10, 13, 16, 18, 19, 20, 26, 27, 29, 40, 41, 48, 49, 50, 55, 56, 58, 59 ]
    TOKENS_FOLLOWING_block_IN_loop_statement_1177 = Set[ 1 ]
    TOKENS_FOLLOWING_DEF_IN_function_1201 = Set[ 56 ]
    TOKENS_FOLLOWING_VAR_TYPE_IN_function_1203 = Set[ 26 ]
    TOKENS_FOLLOWING_variable_name_IN_function_1205 = Set[ 33 ]
    TOKENS_FOLLOWING_function_parameters_IN_function_1209 = Set[ 9, 10, 13, 16, 18, 19, 20, 26, 27, 29, 40, 41, 48, 49, 50, 55, 56, 58, 59 ]
    TOKENS_FOLLOWING_block_IN_function_1211 = Set[ 1 ]
    TOKENS_FOLLOWING_LPAREN_IN_function_parameters_1230 = Set[ 45, 56 ]
    TOKENS_FOLLOWING_parameters_IN_function_parameters_1232 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_function_parameters_1235 = Set[ 1 ]
    TOKENS_FOLLOWING_VAR_TYPE_IN_parameters_1252 = Set[ 26 ]
    TOKENS_FOLLOWING_variable_name_IN_parameters_1254 = Set[ 1, 12 ]
    TOKENS_FOLLOWING_COMMA_IN_parameters_1259 = Set[ 56 ]
    TOKENS_FOLLOWING_parameters_IN_parameters_1261 = Set[ 1, 12 ]
    TOKENS_FOLLOWING_CHANGE_COLOR_IN_robot_1280 = Set[ 33 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1282 = Set[ 11 ]
    TOKENS_FOLLOWING_COLOR_IN_robot_1284 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1286 = Set[ 1 ]
    TOKENS_FOLLOWING_CHANGE_DIR_IN_robot_1296 = Set[ 33 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1298 = Set[ 14 ]
    TOKENS_FOLLOWING_DIR_IN_robot_1300 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1302 = Set[ 1 ]
    TOKENS_FOLLOWING_TLK_IN_robot_1312 = Set[ 33 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1314 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_expression_IN_robot_1316 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1318 = Set[ 1 ]
    TOKENS_FOLLOWING_PEN_DOWN_IN_robot_1328 = Set[ 33 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1330 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1332 = Set[ 1 ]
    TOKENS_FOLLOWING_PEN_UP_IN_robot_1342 = Set[ 33 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1344 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1346 = Set[ 1 ]
    TOKENS_FOLLOWING_R_RESET_IN_robot_1356 = Set[ 33 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1358 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1360 = Set[ 1 ]
    TOKENS_FOLLOWING_DRAW_CIRCLE_IN_robot_1370 = Set[ 33 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1372 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_expression_IN_robot_1374 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1376 = Set[ 1 ]
    TOKENS_FOLLOWING_DRAW_SQUARE_IN_robot_1386 = Set[ 33 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1388 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_expression_IN_robot_1390 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1392 = Set[ 1 ]
    TOKENS_FOLLOWING_DRAW_RECTANGLE_IN_robot_1402 = Set[ 33 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1404 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_expression_IN_robot_1406 = Set[ 12 ]
    TOKENS_FOLLOWING_COMMA_IN_robot_1408 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_expression_IN_robot_1410 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1412 = Set[ 1 ]
    TOKENS_FOLLOWING_R_MOVE_IN_robot_1422 = Set[ 33 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1424 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_expression_IN_robot_1426 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1428 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_variable_name_1449 = Set[ 1 ]
    TOKENS_FOLLOWING_primitive_IN_primary_1468 = Set[ 1 ]
    TOKENS_FOLLOWING_functions_IN_primary_1478 = Set[ 1 ]
    TOKENS_FOLLOWING_arrays_IN_primary_1486 = Set[ 1 ]
    TOKENS_FOLLOWING_BOOLEAN_IN_primitive_1503 = Set[ 1 ]
    TOKENS_FOLLOWING_STRING_IN_primitive_1511 = Set[ 1 ]
    TOKENS_FOLLOWING_FLOAT_IN_primitive_1519 = Set[ 1 ]
    TOKENS_FOLLOWING_INT_IN_primitive_1527 = Set[ 1 ]
    TOKENS_FOLLOWING_variable_name_IN_primitive_1535 = Set[ 1 ]
    TOKENS_FOLLOWING_variable_name_IN_arrays_1552 = Set[ 30 ]
    TOKENS_FOLLOWING_LBRAK_IN_arrays_1554 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_exp_IN_arrays_1556 = Set[ 44 ]
    TOKENS_FOLLOWING_RBRAK_IN_arrays_1558 = Set[ 1 ]
    TOKENS_FOLLOWING_variable_name_IN_functions_1582 = Set[ 33 ]
    TOKENS_FOLLOWING_LPAREN_IN_functions_1586 = Set[ 7, 23, 26, 28, 33, 34, 45, 53 ]
    TOKENS_FOLLOWING_expression_list_IN_functions_1588 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_functions_1591 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_expression_list_1612 = Set[ 1, 12 ]
    TOKENS_FOLLOWING_COMMA_IN_expression_list_1617 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_expression_list_IN_expression_list_1619 = Set[ 1, 12 ]
    TOKENS_FOLLOWING_RBRACE_IN_synpred1_Rubik_652 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0

end
