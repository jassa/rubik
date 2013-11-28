#!/usr/bin/env ruby
#
# Rubik.g
# --
# Generated using ANTLR version: 3.5
# Ruby runtime library version: 1.10.0
# Input grammar file: Rubik.g
# Generated at: 2013-11-27 16:03:56
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
    # 82:1: program : ( block )* 'begin' statement_end ! ( block )+ 'end' statement_end !;
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
      block1 = nil
      statement_end3 = nil
      block4 = nil
      statement_end6 = nil


      tree_for_string_literal2 = nil
      tree_for_string_literal5 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 83:7: ( block )* 'begin' statement_end ! ( block )+ 'end' statement_end !
      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         goto_main 
        # <-- action
      end

      # at line 83:21: ( block )*
      while true # decision 1
        alt_1 = 2
        look_1_0 = @input.peek( 1 )

        if ( look_1_0.between?( CHANGE_COLOR, CHANGE_DIR ) || look_1_0 == DEF || look_1_0 == DO || look_1_0.between?( DRAW_CIRCLE, DRAW_SQUARE ) || look_1_0.between?( ID, IF ) || look_1_0 == LBRACE || look_1_0.between?( PEN_DOWN, PEN_UP ) || look_1_0.between?( R_MOVE, R_RETURN ) || look_1_0.between?( TLK, VAR_TYPE ) || look_1_0.between?( T__58, T__59 ) )
          alt_1 = 1

        end
        case alt_1
        when 1
          # at line 83:21: block
          @state.following.push( TOKENS_FOLLOWING_block_IN_program_471 )
          block1 = block
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, block1.tree )
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
    # 98:1: statement : ( robot_statement | variable_statement | assignment_statement | condition_statement | write_statement | read_statement | loop_statement | return_statement | function | functions statement_end !);
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
      functions21 = nil
      statement_end22 = nil



      begin
      # at line 99:5: ( robot_statement | variable_statement | assignment_statement | condition_statement | write_statement | read_statement | loop_statement | return_statement | function | functions statement_end !)
      alt_5 = 10
      case look_5 = @input.peek( 1 )
      when CHANGE_COLOR, CHANGE_DIR, DRAW_CIRCLE, DRAW_RECTANGLE, DRAW_SQUARE, PEN_DOWN, PEN_UP, R_MOVE, R_RESET, TLK then alt_5 = 1
      when VAR_TYPE then alt_5 = 2
      when ID then look_5_3 = @input.peek( 2 )

      if ( look_5_3 == ASGN || look_5_3 == LBRAK )
        alt_5 = 3
      elsif ( look_5_3 == LPAREN )
        alt_5 = 10
      else
        @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )



        raise NoViableAlternative( "", 5, 3 )

      end
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


      when 10
        root_0 = @adaptor.create_flat_list


        # at line 108:7: functions statement_end !
        @state.following.push( TOKENS_FOLLOWING_functions_IN_statement_633 )
        functions21 = functions
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, functions21.tree )
        end

        @state.following.push( TOKENS_FOLLOWING_statement_end_IN_statement_635 )
        statement_end22 = statement_end
        @state.following.pop

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

      char_literal23 = nil
      __EOF24__ = nil


      tree_for_char_literal23 = nil
      tree_for_EOF24 = nil

      begin
      # at line 112:5: ( ';' | ( '}' )=>| EOF )
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
      elsif ( look_6_0 == R_BEGIN ) and ( syntactic_predicate?( :synpred1_Rubik ) )
        alt_6 = 2
      elsif ( look_6_0 == R_END ) and ( syntactic_predicate?( :synpred1_Rubik ) )
        alt_6 = 2
      elsif ( look_6_0 == ELSE ) and ( syntactic_predicate?( :synpred1_Rubik ) )
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
        char_literal23 = match( SEMI, TOKENS_FOLLOWING_SEMI_IN_statement_end_653 )
        if @state.backtracking == 0
          tree_for_char_literal23 = @adaptor.create_with_payload( char_literal23 )
          @adaptor.add_child( root_0, tree_for_char_literal23 )

        end


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 113:7: ( '}' )=>

      when 3
        root_0 = @adaptor.create_flat_list


        # at line 114:7: EOF
        __EOF24__ = match( EOF, TOKENS_FOLLOWING_EOF_IN_statement_end_674 )
        if @state.backtracking == 0
          tree_for_EOF24 = @adaptor.create_with_payload( __EOF24__ )
          @adaptor.add_child( root_0, tree_for_EOF24 )

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
    # 117:1: robot_statement : robot statement_end !;
    #
    def robot_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 6 )


      return_value = RobotStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      robot25 = nil
      statement_end26 = nil



      begin
      root_0 = @adaptor.create_flat_list


      # at line 118:7: robot statement_end !
      @state.following.push( TOKENS_FOLLOWING_robot_IN_robot_statement_691 )
      robot25 = robot
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, robot25.tree )
      end

      @state.following.push( TOKENS_FOLLOWING_statement_end_IN_robot_statement_693 )
      statement_end26 = statement_end
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
    # 121:1: return_statement : 'return' expression statement_end !;
    #
    def return_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 7 )


      return_value = ReturnStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal27 = nil
      expression28 = nil
      statement_end29 = nil


      tree_for_string_literal27 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 122:7: 'return' expression statement_end !
      string_literal27 = match( R_RETURN, TOKENS_FOLLOWING_R_RETURN_IN_return_statement_711 )
      if @state.backtracking == 0
        tree_for_string_literal27 = @adaptor.create_with_payload( string_literal27 )
        @adaptor.add_child( root_0, tree_for_string_literal27 )

      end

      @state.following.push( TOKENS_FOLLOWING_expression_IN_return_statement_713 )
      expression28 = expression
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, expression28.tree )
      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         return_expression 
        # <-- action
      end

      @state.following.push( TOKENS_FOLLOWING_statement_end_IN_return_statement_717 )
      statement_end29 = statement_end
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
    # 125:1: variable_statement : VAR_TYPE variable_declaration_list statement_end !;
    #
    def variable_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 8 )


      return_value = VariableStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __VAR_TYPE30__ = nil
      variable_declaration_list31 = nil
      statement_end32 = nil


      tree_for_VAR_TYPE30 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 129:7: VAR_TYPE variable_declaration_list statement_end !
      __VAR_TYPE30__ = match( VAR_TYPE, TOKENS_FOLLOWING_VAR_TYPE_IN_variable_statement_740 )
      if @state.backtracking == 0
        tree_for_VAR_TYPE30 = @adaptor.create_with_payload( __VAR_TYPE30__ )
        @adaptor.add_child( root_0, tree_for_VAR_TYPE30 )

      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         @current_var_type = __VAR_TYPE30__.text 
        # <-- action
      end

      @state.following.push( TOKENS_FOLLOWING_variable_declaration_list_IN_variable_statement_744 )
      variable_declaration_list31 = variable_declaration_list
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, variable_declaration_list31.tree )
      end

      @state.following.push( TOKENS_FOLLOWING_statement_end_IN_variable_statement_746 )
      statement_end32 = statement_end
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
    # 132:1: variable_declaration_list : variable_declaration ( ',' variable_declaration )* ;
    #
    def variable_declaration_list
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 9 )


      return_value = VariableDeclarationListReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal34 = nil
      variable_declaration33 = nil
      variable_declaration35 = nil


      tree_for_char_literal34 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 133:7: variable_declaration ( ',' variable_declaration )*
      @state.following.push( TOKENS_FOLLOWING_variable_declaration_IN_variable_declaration_list_764 )
      variable_declaration33 = variable_declaration
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, variable_declaration33.tree )
      end

      # at line 133:28: ( ',' variable_declaration )*
      while true # decision 7
        alt_7 = 2
        look_7_0 = @input.peek( 1 )

        if ( look_7_0 == COMMA )
          alt_7 = 1

        end
        case alt_7
        when 1
          # at line 133:29: ',' variable_declaration
          char_literal34 = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_variable_declaration_list_767 )
          if @state.backtracking == 0
            tree_for_char_literal34 = @adaptor.create_with_payload( char_literal34 )
            @adaptor.add_child( root_0, tree_for_char_literal34 )

          end

          @state.following.push( TOKENS_FOLLOWING_variable_declaration_IN_variable_declaration_list_769 )
          variable_declaration35 = variable_declaration
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, variable_declaration35.tree )
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
    # 136:1: variable_declaration : declaration_target ( '=' expression )? ;
    #
    def variable_declaration
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 10 )


      return_value = VariableDeclarationReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal37 = nil
      declaration_target36 = nil
      expression38 = nil


      tree_for_char_literal37 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 137:7: declaration_target ( '=' expression )?
      @state.following.push( TOKENS_FOLLOWING_declaration_target_IN_variable_declaration_788 )
      declaration_target36 = declaration_target
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, declaration_target36.tree )
      end

      # at line 137:26: ( '=' expression )?
      alt_8 = 2
      look_8_0 = @input.peek( 1 )

      if ( look_8_0 == ASGN )
        alt_8 = 1
      end
      case alt_8
      when 1
        # at line 137:27: '=' expression
        char_literal37 = match( ASGN, TOKENS_FOLLOWING_ASGN_IN_variable_declaration_791 )
        if @state.backtracking == 0
          tree_for_char_literal37 = @adaptor.create_with_payload( char_literal37 )
          @adaptor.add_child( root_0, tree_for_char_literal37 )

        end

        @state.following.push( TOKENS_FOLLOWING_expression_IN_variable_declaration_793 )
        expression38 = expression
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression38.tree )
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
    # 140:1: declaration_target : variable_name ( '[' INT ']' )? ;
    #
    def declaration_target
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 11 )


      return_value = DeclarationTargetReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal40 = nil
      __INT41__ = nil
      char_literal42 = nil
      variable_name39 = nil


      tree_for_char_literal40 = nil
      tree_for_INT41 = nil
      tree_for_char_literal42 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 141:7: variable_name ( '[' INT ']' )?
      @state.following.push( TOKENS_FOLLOWING_variable_name_IN_declaration_target_812 )
      variable_name39 = variable_name
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, variable_name39.tree )
      end

      # at line 141:21: ( '[' INT ']' )?
      alt_9 = 2
      look_9_0 = @input.peek( 1 )

      if ( look_9_0 == LBRAK )
        alt_9 = 1
      end
      case alt_9
      when 1
        # at line 141:22: '[' INT ']'
        char_literal40 = match( LBRAK, TOKENS_FOLLOWING_LBRAK_IN_declaration_target_815 )
        if @state.backtracking == 0
          tree_for_char_literal40 = @adaptor.create_with_payload( char_literal40 )
          @adaptor.add_child( root_0, tree_for_char_literal40 )

        end

        __INT41__ = match( INT, TOKENS_FOLLOWING_INT_IN_declaration_target_817 )
        if @state.backtracking == 0
          tree_for_INT41 = @adaptor.create_with_payload( __INT41__ )
          @adaptor.add_child( root_0, tree_for_INT41 )

        end

        char_literal42 = match( RBRAK, TOKENS_FOLLOWING_RBRAK_IN_declaration_target_819 )
        if @state.backtracking == 0
          tree_for_char_literal42 = @adaptor.create_with_payload( char_literal42 )
          @adaptor.add_child( root_0, tree_for_char_literal42 )

        end


      end

      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         define_variable(( variable_name39 && @input.to_s( variable_name39.start, variable_name39.stop ) ), @current_var_type, (__INT41__.nil? ? 1 : __INT41__.text)) 
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
    # 144:1: assignment_statement : variable_name ( '[' exp ']' )? '=' expression statement_end !;
    #
    def assignment_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 12 )


      return_value = AssignmentStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal44 = nil
      char_literal46 = nil
      char_literal47 = nil
      variable_name43 = nil
      exp45 = nil
      expression48 = nil
      statement_end49 = nil


      tree_for_char_literal44 = nil
      tree_for_char_literal46 = nil
      tree_for_char_literal47 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 145:7: variable_name ( '[' exp ']' )? '=' expression statement_end !
      @state.following.push( TOKENS_FOLLOWING_variable_name_IN_assignment_statement_840 )
      variable_name43 = variable_name
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, variable_name43.tree )
      end

      # at line 145:21: ( '[' exp ']' )?
      alt_10 = 2
      look_10_0 = @input.peek( 1 )

      if ( look_10_0 == LBRAK )
        alt_10 = 1
      end
      case alt_10
      when 1
        # at line 145:22: '[' exp ']'
        char_literal44 = match( LBRAK, TOKENS_FOLLOWING_LBRAK_IN_assignment_statement_843 )
        if @state.backtracking == 0
          tree_for_char_literal44 = @adaptor.create_with_payload( char_literal44 )
          @adaptor.add_child( root_0, tree_for_char_literal44 )

        end

        @state.following.push( TOKENS_FOLLOWING_exp_IN_assignment_statement_845 )
        exp45 = exp
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, exp45.tree )
        end

        char_literal46 = match( RBRAK, TOKENS_FOLLOWING_RBRAK_IN_assignment_statement_847 )
        if @state.backtracking == 0
          tree_for_char_literal46 = @adaptor.create_with_payload( char_literal46 )
          @adaptor.add_child( root_0, tree_for_char_literal46 )

        end


      end

      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         assign(( variable_name43 && @input.to_s( variable_name43.start, variable_name43.stop ) ), ( exp45 && @input.to_s( exp45.start, exp45.stop ) )) 
        # <-- action
      end

      char_literal47 = match( ASGN, TOKENS_FOLLOWING_ASGN_IN_assignment_statement_853 )
      if @state.backtracking == 0
        tree_for_char_literal47 = @adaptor.create_with_payload( char_literal47 )
        @adaptor.add_child( root_0, tree_for_char_literal47 )

      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         exp2('=') 
        # <-- action
      end

      @state.following.push( TOKENS_FOLLOWING_expression_IN_assignment_statement_857 )
      expression48 = expression
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, expression48.tree )
      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         exp9 
        # <-- action
      end

      @state.following.push( TOKENS_FOLLOWING_statement_end_IN_assignment_statement_861 )
      statement_end49 = statement_end
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
    # 148:1: condition_statement : 'if' '(' expression ')' block ( 'else' block )? ;
    #
    def condition_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 13 )


      return_value = ConditionStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal50 = nil
      char_literal51 = nil
      char_literal53 = nil
      string_literal55 = nil
      expression52 = nil
      block54 = nil
      block56 = nil


      tree_for_string_literal50 = nil
      tree_for_char_literal51 = nil
      tree_for_char_literal53 = nil
      tree_for_string_literal55 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 149:7: 'if' '(' expression ')' block ( 'else' block )?
      string_literal50 = match( IF, TOKENS_FOLLOWING_IF_IN_condition_statement_879 )
      if @state.backtracking == 0
        tree_for_string_literal50 = @adaptor.create_with_payload( string_literal50 )
        @adaptor.add_child( root_0, tree_for_string_literal50 )

      end

      char_literal51 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_condition_statement_881 )
      if @state.backtracking == 0
        tree_for_char_literal51 = @adaptor.create_with_payload( char_literal51 )
        @adaptor.add_child( root_0, tree_for_char_literal51 )

      end

      @state.following.push( TOKENS_FOLLOWING_expression_IN_condition_statement_883 )
      expression52 = expression
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, expression52.tree )
      end

      char_literal53 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_condition_statement_885 )
      if @state.backtracking == 0
        tree_for_char_literal53 = @adaptor.create_with_payload( char_literal53 )
        @adaptor.add_child( root_0, tree_for_char_literal53 )

      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         if1 
        # <-- action
      end

      @state.following.push( TOKENS_FOLLOWING_block_IN_condition_statement_888 )
      block54 = block
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, block54.tree )
      end

      # at line 149:44: ( 'else' block )?
      alt_11 = 2
      look_11_0 = @input.peek( 1 )

      if ( look_11_0 == ELSE )
        alt_11 = 1
      end
      case alt_11
      when 1
        # at line 149:45: 'else' block
        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           if2 
          # <-- action
        end

        string_literal55 = match( ELSE, TOKENS_FOLLOWING_ELSE_IN_condition_statement_893 )
        if @state.backtracking == 0
          tree_for_string_literal55 = @adaptor.create_with_payload( string_literal55 )
          @adaptor.add_child( root_0, tree_for_string_literal55 )

        end

        @state.following.push( TOKENS_FOLLOWING_block_IN_condition_statement_895 )
        block56 = block
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, block56.tree )
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
    # 152:1: expression : exp ( relation_op exp )? ;
    #
    def expression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 14 )


      return_value = ExpressionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      exp57 = nil
      relation_op58 = nil
      exp59 = nil



      begin
      root_0 = @adaptor.create_flat_list


      # at line 153:7: exp ( relation_op exp )?
      @state.following.push( TOKENS_FOLLOWING_exp_IN_expression_916 )
      exp57 = exp
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, exp57.tree )
      end

      # at line 153:11: ( relation_op exp )?
      alt_12 = 2
      look_12_0 = @input.peek( 1 )

      if ( look_12_0 == EQ || look_12_0.between?( GEQ, GREATER ) || look_12_0.between?( LEQ, LESS ) || look_12_0 == NEQ )
        alt_12 = 1
      end
      case alt_12
      when 1
        # at line 153:12: relation_op exp
        @state.following.push( TOKENS_FOLLOWING_relation_op_IN_expression_919 )
        relation_op58 = relation_op
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, relation_op58.tree )
        end


        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           exp2(input.look(-1).text) 
          # <-- action
        end

        @state.following.push( TOKENS_FOLLOWING_exp_IN_expression_923 )
        exp59 = exp
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, exp59.tree )
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
    # 156:1: relation_op : ( '<' | '>' | '<=' | '>=' | '==' | '!=' );
    #
    def relation_op
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )


      return_value = RelationOpReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      set60 = nil


      tree_for_set60 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 
      set60 = @input.look

      if @input.peek(1) == EQ || @input.peek( 1 ).between?( GEQ, GREATER ) || @input.peek( 1 ).between?( LEQ, LESS ) || @input.peek(1) == NEQ
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
    # 165:1: exp : term ( ( '+' | '-' ) exp )? ;
    #
    def exp
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )


      return_value = ExpReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      set62 = nil
      term61 = nil
      exp63 = nil


      tree_for_set62 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 166:7: term ( ( '+' | '-' ) exp )?
      @state.following.push( TOKENS_FOLLOWING_term_IN_exp_1001 )
      term61 = term
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, term61.tree )
      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         exp4 
        # <-- action
      end

      # at line 166:21: ( ( '+' | '-' ) exp )?
      alt_13 = 2
      look_13_0 = @input.peek( 1 )

      if ( look_13_0 == MINUS || look_13_0 == PLUS )
        alt_13 = 1
      end
      case alt_13
      when 1
        # at line 166:22: ( '+' | '-' ) exp
        set62 = @input.look

        if @input.peek(1) == MINUS || @input.peek(1) == PLUS
          @input.consume
          if @state.backtracking == 0
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set62 ) )
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

        @state.following.push( TOKENS_FOLLOWING_exp_IN_exp_1014 )
        exp63 = exp
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, exp63.tree )
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
    # 169:1: term : factor ( ( '*' | '/' ) term )? ;
    #
    def term
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )


      return_value = TermReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      set65 = nil
      factor64 = nil
      term66 = nil


      tree_for_set65 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 170:7: factor ( ( '*' | '/' ) term )?
      @state.following.push( TOKENS_FOLLOWING_factor_IN_term_1033 )
      factor64 = factor
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, factor64.tree )
      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         exp5 
        # <-- action
      end

      # at line 170:23: ( ( '*' | '/' ) term )?
      alt_14 = 2
      look_14_0 = @input.peek( 1 )

      if ( look_14_0 == DIV || look_14_0 == STAR )
        alt_14 = 1
      end
      case alt_14
      when 1
        # at line 170:24: ( '*' | '/' ) term
        set65 = @input.look

        if @input.peek(1) == DIV || @input.peek(1) == STAR
          @input.consume
          if @state.backtracking == 0
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set65 ) )
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

        @state.following.push( TOKENS_FOLLOWING_term_IN_term_1046 )
        term66 = term
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, term66.tree )
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
    # 173:1: factor : ( '(' expression ')' | ( '-' )? primary );
    #
    def factor
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )


      return_value = FactorReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal67 = nil
      char_literal69 = nil
      char_literal70 = nil
      expression68 = nil
      primary71 = nil


      tree_for_char_literal67 = nil
      tree_for_char_literal69 = nil
      tree_for_char_literal70 = nil

      begin
      # at line 174:5: ( '(' expression ')' | ( '-' )? primary )
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


        # at line 174:7: '(' expression ')'
        char_literal67 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_factor_1065 )
        if @state.backtracking == 0
          tree_for_char_literal67 = @adaptor.create_with_payload( char_literal67 )
          @adaptor.add_child( root_0, tree_for_char_literal67 )

        end


        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           exp6 
          # <-- action
        end

        @state.following.push( TOKENS_FOLLOWING_expression_IN_factor_1069 )
        expression68 = expression
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression68.tree )
        end

        char_literal69 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_factor_1071 )
        if @state.backtracking == 0
          tree_for_char_literal69 = @adaptor.create_with_payload( char_literal69 )
          @adaptor.add_child( root_0, tree_for_char_literal69 )

        end


        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           exp7 
          # <-- action
        end


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 175:7: ( '-' )? primary
        # at line 175:7: ( '-' )?
        alt_15 = 2
        look_15_0 = @input.peek( 1 )

        if ( look_15_0 == MINUS )
          alt_15 = 1
        end
        case alt_15
        when 1
          # at line 175:7: '-'
          char_literal70 = match( MINUS, TOKENS_FOLLOWING_MINUS_IN_factor_1081 )
          if @state.backtracking == 0
            tree_for_char_literal70 = @adaptor.create_with_payload( char_literal70 )
            @adaptor.add_child( root_0, tree_for_char_literal70 )

          end


        end
        @state.following.push( TOKENS_FOLLOWING_primary_IN_factor_1084 )
        primary71 = primary
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, primary71.tree )
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
    # 178:1: write_statement : 'print' '(' write_expression ( '.' write_expression )* ')' statement_end !;
    #
    def write_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )


      return_value = WriteStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal72 = nil
      char_literal73 = nil
      char_literal75 = nil
      char_literal77 = nil
      write_expression74 = nil
      write_expression76 = nil
      statement_end78 = nil


      tree_for_string_literal72 = nil
      tree_for_char_literal73 = nil
      tree_for_char_literal75 = nil
      tree_for_char_literal77 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 179:7: 'print' '(' write_expression ( '.' write_expression )* ')' statement_end !
      string_literal72 = match( T__59, TOKENS_FOLLOWING_T__59_IN_write_statement_1101 )
      if @state.backtracking == 0
        tree_for_string_literal72 = @adaptor.create_with_payload( string_literal72 )
        @adaptor.add_child( root_0, tree_for_string_literal72 )

      end

      char_literal73 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_write_statement_1103 )
      if @state.backtracking == 0
        tree_for_char_literal73 = @adaptor.create_with_payload( char_literal73 )
        @adaptor.add_child( root_0, tree_for_char_literal73 )

      end

      @state.following.push( TOKENS_FOLLOWING_write_expression_IN_write_statement_1105 )
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
          char_literal75 = match( DOT, TOKENS_FOLLOWING_DOT_IN_write_statement_1110 )
          if @state.backtracking == 0
            tree_for_char_literal75 = @adaptor.create_with_payload( char_literal75 )
            @adaptor.add_child( root_0, tree_for_char_literal75 )

          end

          @state.following.push( TOKENS_FOLLOWING_write_expression_IN_write_statement_1112 )
          write_expression76 = write_expression
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, write_expression76.tree )
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

      char_literal77 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_write_statement_1118 )
      if @state.backtracking == 0
        tree_for_char_literal77 = @adaptor.create_with_payload( char_literal77 )
        @adaptor.add_child( root_0, tree_for_char_literal77 )

      end

      @state.following.push( TOKENS_FOLLOWING_statement_end_IN_write_statement_1120 )
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
        # trace_out( __method__, 19 )


      end

      return return_value
    end

    WriteExpressionReturnValue = define_return_scope

    #
    # parser rule write_expression
    #
    # (in Rubik.g)
    # 182:1: write_expression : expression ;
    #
    def write_expression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )


      return_value = WriteExpressionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      expression79 = nil



      begin
      root_0 = @adaptor.create_flat_list


      # at line 183:7: expression
      @state.following.push( TOKENS_FOLLOWING_expression_IN_write_expression_1138 )
      expression79 = expression
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, expression79.tree )
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
    # 186:1: read_statement : 'gets' '(' ')' statement_end !;
    #
    def read_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )


      return_value = ReadStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal80 = nil
      char_literal81 = nil
      char_literal82 = nil
      statement_end83 = nil


      tree_for_string_literal80 = nil
      tree_for_char_literal81 = nil
      tree_for_char_literal82 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 187:7: 'gets' '(' ')' statement_end !
      string_literal80 = match( T__58, TOKENS_FOLLOWING_T__58_IN_read_statement_1155 )
      if @state.backtracking == 0
        tree_for_string_literal80 = @adaptor.create_with_payload( string_literal80 )
        @adaptor.add_child( root_0, tree_for_string_literal80 )

      end

      char_literal81 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_read_statement_1157 )
      if @state.backtracking == 0
        tree_for_char_literal81 = @adaptor.create_with_payload( char_literal81 )
        @adaptor.add_child( root_0, tree_for_char_literal81 )

      end

      char_literal82 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_read_statement_1159 )
      if @state.backtracking == 0
        tree_for_char_literal82 = @adaptor.create_with_payload( char_literal82 )
        @adaptor.add_child( root_0, tree_for_char_literal82 )

      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         r_gets 
        # <-- action
      end

      @state.following.push( TOKENS_FOLLOWING_statement_end_IN_read_statement_1163 )
      statement_end83 = statement_end
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
    # 190:1: loop_statement : 'do' exp 'times' block ;
    #
    def loop_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )


      return_value = LoopStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal84 = nil
      string_literal86 = nil
      exp85 = nil
      block87 = nil


      tree_for_string_literal84 = nil
      tree_for_string_literal86 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 191:7: 'do' exp 'times' block
      string_literal84 = match( DO, TOKENS_FOLLOWING_DO_IN_loop_statement_1181 )
      if @state.backtracking == 0
        tree_for_string_literal84 = @adaptor.create_with_payload( string_literal84 )
        @adaptor.add_child( root_0, tree_for_string_literal84 )

      end

      @state.following.push( TOKENS_FOLLOWING_exp_IN_loop_statement_1183 )
      exp85 = exp
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, exp85.tree )
      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
        times1
        # <-- action
      end

      string_literal86 = match( TIMES, TOKENS_FOLLOWING_TIMES_IN_loop_statement_1186 )
      if @state.backtracking == 0
        tree_for_string_literal86 = @adaptor.create_with_payload( string_literal86 )
        @adaptor.add_child( root_0, tree_for_string_literal86 )

      end

      @state.following.push( TOKENS_FOLLOWING_block_IN_loop_statement_1188 )
      block87 = block
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, block87.tree )
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
    # 194:1: function : 'def' VAR_TYPE variable_name function_parameters block ;
    #
    def function
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 23 )


      return_value = FunctionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal88 = nil
      __VAR_TYPE89__ = nil
      variable_name90 = nil
      function_parameters91 = nil
      block92 = nil


      tree_for_string_literal88 = nil
      tree_for_VAR_TYPE89 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 198:7: 'def' VAR_TYPE variable_name function_parameters block
      string_literal88 = match( DEF, TOKENS_FOLLOWING_DEF_IN_function_1212 )
      if @state.backtracking == 0
        tree_for_string_literal88 = @adaptor.create_with_payload( string_literal88 )
        @adaptor.add_child( root_0, tree_for_string_literal88 )

      end

      __VAR_TYPE89__ = match( VAR_TYPE, TOKENS_FOLLOWING_VAR_TYPE_IN_function_1214 )
      if @state.backtracking == 0
        tree_for_VAR_TYPE89 = @adaptor.create_with_payload( __VAR_TYPE89__ )
        @adaptor.add_child( root_0, tree_for_VAR_TYPE89 )

      end

      @state.following.push( TOKENS_FOLLOWING_variable_name_IN_function_1216 )
      variable_name90 = variable_name
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, variable_name90.tree )
      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         @current_scope = ( variable_name90 && @input.to_s( variable_name90.start, variable_name90.stop ) ); func1(__VAR_TYPE89__.text) 
        # <-- action
      end

      @state.following.push( TOKENS_FOLLOWING_function_parameters_IN_function_1220 )
      function_parameters91 = function_parameters
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, function_parameters91.tree )
      end

      @state.following.push( TOKENS_FOLLOWING_block_IN_function_1222 )
      block92 = block
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, block92.tree )
      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         func3(( block92 && @input.to_s( block92.start, block92.stop ) )) 
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
    # 201:1: function_parameters : '(' ( parameters )? ')' ;
    #
    def function_parameters
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )


      return_value = FunctionParametersReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal93 = nil
      char_literal95 = nil
      parameters94 = nil


      tree_for_char_literal93 = nil
      tree_for_char_literal95 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 202:7: '(' ( parameters )? ')'
      char_literal93 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_function_parameters_1241 )
      if @state.backtracking == 0
        tree_for_char_literal93 = @adaptor.create_with_payload( char_literal93 )
        @adaptor.add_child( root_0, tree_for_char_literal93 )

      end

      # at line 202:11: ( parameters )?
      alt_18 = 2
      look_18_0 = @input.peek( 1 )

      if ( look_18_0 == VAR_TYPE )
        alt_18 = 1
      end
      case alt_18
      when 1
        # at line 202:11: parameters
        @state.following.push( TOKENS_FOLLOWING_parameters_IN_function_parameters_1243 )
        parameters94 = parameters
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, parameters94.tree )
        end


      end
      char_literal95 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_function_parameters_1246 )
      if @state.backtracking == 0
        tree_for_char_literal95 = @adaptor.create_with_payload( char_literal95 )
        @adaptor.add_child( root_0, tree_for_char_literal95 )

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
    # 205:1: parameters : VAR_TYPE variable_name ( ',' parameters )* ;
    #
    def parameters
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )


      return_value = ParametersReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __VAR_TYPE96__ = nil
      char_literal98 = nil
      variable_name97 = nil
      parameters99 = nil


      tree_for_VAR_TYPE96 = nil
      tree_for_char_literal98 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 206:7: VAR_TYPE variable_name ( ',' parameters )*
      __VAR_TYPE96__ = match( VAR_TYPE, TOKENS_FOLLOWING_VAR_TYPE_IN_parameters_1263 )
      if @state.backtracking == 0
        tree_for_VAR_TYPE96 = @adaptor.create_with_payload( __VAR_TYPE96__ )
        @adaptor.add_child( root_0, tree_for_VAR_TYPE96 )

      end

      @state.following.push( TOKENS_FOLLOWING_variable_name_IN_parameters_1265 )
      variable_name97 = variable_name
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, variable_name97.tree )
      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         func2(( variable_name97 && @input.to_s( variable_name97.start, variable_name97.stop ) ), __VAR_TYPE96__.text) 
        # <-- action
      end

      # at line 206:77: ( ',' parameters )*
      while true # decision 19
        alt_19 = 2
        look_19_0 = @input.peek( 1 )

        if ( look_19_0 == COMMA )
          alt_19 = 1

        end
        case alt_19
        when 1
          # at line 206:78: ',' parameters
          char_literal98 = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_parameters_1270 )
          if @state.backtracking == 0
            tree_for_char_literal98 = @adaptor.create_with_payload( char_literal98 )
            @adaptor.add_child( root_0, tree_for_char_literal98 )

          end

          @state.following.push( TOKENS_FOLLOWING_parameters_IN_parameters_1272 )
          parameters99 = parameters
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, parameters99.tree )
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
    # 209:1: robot : ( 'change_color' '(' COLOR ')' | 'change_direction' '(' DIR ')' | 'talk' '(' expression ')' | 'pen_down' '(' ')' | 'pen_up' '(' ')' | 'reset' '(' ')' | 'draw_circle' '(' expression ')' | 'draw_square' '(' expression ')' | 'draw_rectangle' '(' expression ',' expression ')' | 'move' '(' expression ')' );
    #
    def robot
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )


      return_value = RobotReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal100 = nil
      char_literal101 = nil
      __COLOR102__ = nil
      char_literal103 = nil
      string_literal104 = nil
      char_literal105 = nil
      __DIR106__ = nil
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
      string_literal129 = nil
      char_literal130 = nil
      char_literal132 = nil
      char_literal134 = nil
      string_literal135 = nil
      char_literal136 = nil
      char_literal138 = nil
      expression110 = nil
      expression123 = nil
      expression127 = nil
      expression131 = nil
      expression133 = nil
      expression137 = nil


      tree_for_string_literal100 = nil
      tree_for_char_literal101 = nil
      tree_for_COLOR102 = nil
      tree_for_char_literal103 = nil
      tree_for_string_literal104 = nil
      tree_for_char_literal105 = nil
      tree_for_DIR106 = nil
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
      tree_for_string_literal129 = nil
      tree_for_char_literal130 = nil
      tree_for_char_literal132 = nil
      tree_for_char_literal134 = nil
      tree_for_string_literal135 = nil
      tree_for_char_literal136 = nil
      tree_for_char_literal138 = nil

      begin
      # at line 210:5: ( 'change_color' '(' COLOR ')' | 'change_direction' '(' DIR ')' | 'talk' '(' expression ')' | 'pen_down' '(' ')' | 'pen_up' '(' ')' | 'reset' '(' ')' | 'draw_circle' '(' expression ')' | 'draw_square' '(' expression ')' | 'draw_rectangle' '(' expression ',' expression ')' | 'move' '(' expression ')' )
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


        # at line 210:7: 'change_color' '(' COLOR ')'
        string_literal100 = match( CHANGE_COLOR, TOKENS_FOLLOWING_CHANGE_COLOR_IN_robot_1291 )
        if @state.backtracking == 0
          tree_for_string_literal100 = @adaptor.create_with_payload( string_literal100 )
          @adaptor.add_child( root_0, tree_for_string_literal100 )

        end

        char_literal101 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1293 )
        if @state.backtracking == 0
          tree_for_char_literal101 = @adaptor.create_with_payload( char_literal101 )
          @adaptor.add_child( root_0, tree_for_char_literal101 )

        end

        __COLOR102__ = match( COLOR, TOKENS_FOLLOWING_COLOR_IN_robot_1295 )
        if @state.backtracking == 0
          tree_for_COLOR102 = @adaptor.create_with_payload( __COLOR102__ )
          @adaptor.add_child( root_0, tree_for_COLOR102 )

        end

        char_literal103 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1297 )
        if @state.backtracking == 0
          tree_for_char_literal103 = @adaptor.create_with_payload( char_literal103 )
          @adaptor.add_child( root_0, tree_for_char_literal103 )

        end


        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           turtle_change_color(__COLOR102__.text) 
          # <-- action
        end


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 211:7: 'change_direction' '(' DIR ')'
        string_literal104 = match( CHANGE_DIR, TOKENS_FOLLOWING_CHANGE_DIR_IN_robot_1307 )
        if @state.backtracking == 0
          tree_for_string_literal104 = @adaptor.create_with_payload( string_literal104 )
          @adaptor.add_child( root_0, tree_for_string_literal104 )

        end

        char_literal105 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1309 )
        if @state.backtracking == 0
          tree_for_char_literal105 = @adaptor.create_with_payload( char_literal105 )
          @adaptor.add_child( root_0, tree_for_char_literal105 )

        end

        __DIR106__ = match( DIR, TOKENS_FOLLOWING_DIR_IN_robot_1311 )
        if @state.backtracking == 0
          tree_for_DIR106 = @adaptor.create_with_payload( __DIR106__ )
          @adaptor.add_child( root_0, tree_for_DIR106 )

        end

        char_literal107 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1313 )
        if @state.backtracking == 0
          tree_for_char_literal107 = @adaptor.create_with_payload( char_literal107 )
          @adaptor.add_child( root_0, tree_for_char_literal107 )

        end


        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           turtle_change_direction(__DIR106__.text) 
          # <-- action
        end


      when 3
        root_0 = @adaptor.create_flat_list


        # at line 212:7: 'talk' '(' expression ')'
        string_literal108 = match( TLK, TOKENS_FOLLOWING_TLK_IN_robot_1323 )
        if @state.backtracking == 0
          tree_for_string_literal108 = @adaptor.create_with_payload( string_literal108 )
          @adaptor.add_child( root_0, tree_for_string_literal108 )

        end

        char_literal109 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1325 )
        if @state.backtracking == 0
          tree_for_char_literal109 = @adaptor.create_with_payload( char_literal109 )
          @adaptor.add_child( root_0, tree_for_char_literal109 )

        end

        @state.following.push( TOKENS_FOLLOWING_expression_IN_robot_1327 )
        expression110 = expression
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression110.tree )
        end

        char_literal111 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1329 )
        if @state.backtracking == 0
          tree_for_char_literal111 = @adaptor.create_with_payload( char_literal111 )
          @adaptor.add_child( root_0, tree_for_char_literal111 )

        end


        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           turtle_talk 
          # <-- action
        end


      when 4
        root_0 = @adaptor.create_flat_list


        # at line 213:7: 'pen_down' '(' ')'
        string_literal112 = match( PEN_DOWN, TOKENS_FOLLOWING_PEN_DOWN_IN_robot_1339 )
        if @state.backtracking == 0
          tree_for_string_literal112 = @adaptor.create_with_payload( string_literal112 )
          @adaptor.add_child( root_0, tree_for_string_literal112 )

        end

        char_literal113 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1341 )
        if @state.backtracking == 0
          tree_for_char_literal113 = @adaptor.create_with_payload( char_literal113 )
          @adaptor.add_child( root_0, tree_for_char_literal113 )

        end

        char_literal114 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1343 )
        if @state.backtracking == 0
          tree_for_char_literal114 = @adaptor.create_with_payload( char_literal114 )
          @adaptor.add_child( root_0, tree_for_char_literal114 )

        end


        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           turtle_send('pen_down') 
          # <-- action
        end


      when 5
        root_0 = @adaptor.create_flat_list


        # at line 214:7: 'pen_up' '(' ')'
        string_literal115 = match( PEN_UP, TOKENS_FOLLOWING_PEN_UP_IN_robot_1353 )
        if @state.backtracking == 0
          tree_for_string_literal115 = @adaptor.create_with_payload( string_literal115 )
          @adaptor.add_child( root_0, tree_for_string_literal115 )

        end

        char_literal116 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1355 )
        if @state.backtracking == 0
          tree_for_char_literal116 = @adaptor.create_with_payload( char_literal116 )
          @adaptor.add_child( root_0, tree_for_char_literal116 )

        end

        char_literal117 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1357 )
        if @state.backtracking == 0
          tree_for_char_literal117 = @adaptor.create_with_payload( char_literal117 )
          @adaptor.add_child( root_0, tree_for_char_literal117 )

        end


        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           turtle_send('pen_up') 
          # <-- action
        end


      when 6
        root_0 = @adaptor.create_flat_list


        # at line 215:7: 'reset' '(' ')'
        string_literal118 = match( R_RESET, TOKENS_FOLLOWING_R_RESET_IN_robot_1367 )
        if @state.backtracking == 0
          tree_for_string_literal118 = @adaptor.create_with_payload( string_literal118 )
          @adaptor.add_child( root_0, tree_for_string_literal118 )

        end

        char_literal119 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1369 )
        if @state.backtracking == 0
          tree_for_char_literal119 = @adaptor.create_with_payload( char_literal119 )
          @adaptor.add_child( root_0, tree_for_char_literal119 )

        end

        char_literal120 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1371 )
        if @state.backtracking == 0
          tree_for_char_literal120 = @adaptor.create_with_payload( char_literal120 )
          @adaptor.add_child( root_0, tree_for_char_literal120 )

        end


        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           turtle_send('reset') 
          # <-- action
        end


      when 7
        root_0 = @adaptor.create_flat_list


        # at line 216:7: 'draw_circle' '(' expression ')'
        string_literal121 = match( DRAW_CIRCLE, TOKENS_FOLLOWING_DRAW_CIRCLE_IN_robot_1381 )
        if @state.backtracking == 0
          tree_for_string_literal121 = @adaptor.create_with_payload( string_literal121 )
          @adaptor.add_child( root_0, tree_for_string_literal121 )

        end

        char_literal122 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1383 )
        if @state.backtracking == 0
          tree_for_char_literal122 = @adaptor.create_with_payload( char_literal122 )
          @adaptor.add_child( root_0, tree_for_char_literal122 )

        end

        @state.following.push( TOKENS_FOLLOWING_expression_IN_robot_1385 )
        expression123 = expression
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression123.tree )
        end

        char_literal124 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1387 )
        if @state.backtracking == 0
          tree_for_char_literal124 = @adaptor.create_with_payload( char_literal124 )
          @adaptor.add_child( root_0, tree_for_char_literal124 )

        end


        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           turtle_send('draw_circle', 'int') 
          # <-- action
        end


      when 8
        root_0 = @adaptor.create_flat_list


        # at line 217:7: 'draw_square' '(' expression ')'
        string_literal125 = match( DRAW_SQUARE, TOKENS_FOLLOWING_DRAW_SQUARE_IN_robot_1397 )
        if @state.backtracking == 0
          tree_for_string_literal125 = @adaptor.create_with_payload( string_literal125 )
          @adaptor.add_child( root_0, tree_for_string_literal125 )

        end

        char_literal126 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1399 )
        if @state.backtracking == 0
          tree_for_char_literal126 = @adaptor.create_with_payload( char_literal126 )
          @adaptor.add_child( root_0, tree_for_char_literal126 )

        end

        @state.following.push( TOKENS_FOLLOWING_expression_IN_robot_1401 )
        expression127 = expression
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression127.tree )
        end

        char_literal128 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1403 )
        if @state.backtracking == 0
          tree_for_char_literal128 = @adaptor.create_with_payload( char_literal128 )
          @adaptor.add_child( root_0, tree_for_char_literal128 )

        end


        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           turtle_send('draw_square', 'int') 
          # <-- action
        end


      when 9
        root_0 = @adaptor.create_flat_list


        # at line 218:7: 'draw_rectangle' '(' expression ',' expression ')'
        string_literal129 = match( DRAW_RECTANGLE, TOKENS_FOLLOWING_DRAW_RECTANGLE_IN_robot_1413 )
        if @state.backtracking == 0
          tree_for_string_literal129 = @adaptor.create_with_payload( string_literal129 )
          @adaptor.add_child( root_0, tree_for_string_literal129 )

        end

        char_literal130 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1415 )
        if @state.backtracking == 0
          tree_for_char_literal130 = @adaptor.create_with_payload( char_literal130 )
          @adaptor.add_child( root_0, tree_for_char_literal130 )

        end

        @state.following.push( TOKENS_FOLLOWING_expression_IN_robot_1417 )
        expression131 = expression
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression131.tree )
        end

        char_literal132 = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_robot_1419 )
        if @state.backtracking == 0
          tree_for_char_literal132 = @adaptor.create_with_payload( char_literal132 )
          @adaptor.add_child( root_0, tree_for_char_literal132 )

        end

        @state.following.push( TOKENS_FOLLOWING_expression_IN_robot_1421 )
        expression133 = expression
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression133.tree )
        end

        char_literal134 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1423 )
        if @state.backtracking == 0
          tree_for_char_literal134 = @adaptor.create_with_payload( char_literal134 )
          @adaptor.add_child( root_0, tree_for_char_literal134 )

        end


        # syntactic predicate action gate test
        if @state.backtracking == 0
          # --> action
           turtle_draw_rectangle 
          # <-- action
        end


      when 10
        root_0 = @adaptor.create_flat_list


        # at line 219:7: 'move' '(' expression ')'
        string_literal135 = match( R_MOVE, TOKENS_FOLLOWING_R_MOVE_IN_robot_1433 )
        if @state.backtracking == 0
          tree_for_string_literal135 = @adaptor.create_with_payload( string_literal135 )
          @adaptor.add_child( root_0, tree_for_string_literal135 )

        end

        char_literal136 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_robot_1435 )
        if @state.backtracking == 0
          tree_for_char_literal136 = @adaptor.create_with_payload( char_literal136 )
          @adaptor.add_child( root_0, tree_for_char_literal136 )

        end

        @state.following.push( TOKENS_FOLLOWING_expression_IN_robot_1437 )
        expression137 = expression
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression137.tree )
        end

        char_literal138 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_robot_1439 )
        if @state.backtracking == 0
          tree_for_char_literal138 = @adaptor.create_with_payload( char_literal138 )
          @adaptor.add_child( root_0, tree_for_char_literal138 )

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
    # 224:1: variable_name : ID ;
    #
    def variable_name
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )


      return_value = VariableNameReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __ID139__ = nil


      tree_for_ID139 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 225:7: ID
      __ID139__ = match( ID, TOKENS_FOLLOWING_ID_IN_variable_name_1460 )
      if @state.backtracking == 0
        tree_for_ID139 = @adaptor.create_with_payload( __ID139__ )
        @adaptor.add_child( root_0, tree_for_ID139 )

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
    # 230:1: primary : ( primitive | functions | arrays );
    #
    def primary
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )


      return_value = PrimaryReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      primitive140 = nil
      functions141 = nil
      arrays142 = nil



      begin
      # at line 231:5: ( primitive | functions | arrays )
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


        # at line 231:7: primitive
        @state.following.push( TOKENS_FOLLOWING_primitive_IN_primary_1479 )
        primitive140 = primitive
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, primitive140.tree )
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


        # at line 233:7: functions
        @state.following.push( TOKENS_FOLLOWING_functions_IN_primary_1489 )
        functions141 = functions
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, functions141.tree )
        end


      when 3
        root_0 = @adaptor.create_flat_list


        # at line 234:7: arrays
        @state.following.push( TOKENS_FOLLOWING_arrays_IN_primary_1497 )
        arrays142 = arrays
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, arrays142.tree )
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
    # 237:1: primitive : ( BOOLEAN | STRING | FLOAT | INT | variable_name );
    #
    def primitive
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 29 )


      return_value = PrimitiveReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __BOOLEAN143__ = nil
      __STRING144__ = nil
      __FLOAT145__ = nil
      __INT146__ = nil
      variable_name147 = nil


      tree_for_BOOLEAN143 = nil
      tree_for_STRING144 = nil
      tree_for_FLOAT145 = nil
      tree_for_INT146 = nil

      begin
      # at line 238:5: ( BOOLEAN | STRING | FLOAT | INT | variable_name )
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


        # at line 238:7: BOOLEAN
        __BOOLEAN143__ = match( BOOLEAN, TOKENS_FOLLOWING_BOOLEAN_IN_primitive_1514 )
        if @state.backtracking == 0
          tree_for_BOOLEAN143 = @adaptor.create_with_payload( __BOOLEAN143__ )
          @adaptor.add_child( root_0, tree_for_BOOLEAN143 )

        end


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 239:7: STRING
        __STRING144__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_primitive_1522 )
        if @state.backtracking == 0
          tree_for_STRING144 = @adaptor.create_with_payload( __STRING144__ )
          @adaptor.add_child( root_0, tree_for_STRING144 )

        end


      when 3
        root_0 = @adaptor.create_flat_list


        # at line 240:7: FLOAT
        __FLOAT145__ = match( FLOAT, TOKENS_FOLLOWING_FLOAT_IN_primitive_1530 )
        if @state.backtracking == 0
          tree_for_FLOAT145 = @adaptor.create_with_payload( __FLOAT145__ )
          @adaptor.add_child( root_0, tree_for_FLOAT145 )

        end


      when 4
        root_0 = @adaptor.create_flat_list


        # at line 241:7: INT
        __INT146__ = match( INT, TOKENS_FOLLOWING_INT_IN_primitive_1538 )
        if @state.backtracking == 0
          tree_for_INT146 = @adaptor.create_with_payload( __INT146__ )
          @adaptor.add_child( root_0, tree_for_INT146 )

        end


      when 5
        root_0 = @adaptor.create_flat_list


        # at line 242:7: variable_name
        @state.following.push( TOKENS_FOLLOWING_variable_name_IN_primitive_1546 )
        variable_name147 = variable_name
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, variable_name147.tree )
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
    # 245:1: arrays : variable_name '[' exp ']' ;
    #
    def arrays
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )


      return_value = ArraysReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal149 = nil
      char_literal151 = nil
      variable_name148 = nil
      exp150 = nil


      tree_for_char_literal149 = nil
      tree_for_char_literal151 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 246:7: variable_name '[' exp ']'
      @state.following.push( TOKENS_FOLLOWING_variable_name_IN_arrays_1563 )
      variable_name148 = variable_name
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, variable_name148.tree )
      end

      char_literal149 = match( LBRAK, TOKENS_FOLLOWING_LBRAK_IN_arrays_1565 )
      if @state.backtracking == 0
        tree_for_char_literal149 = @adaptor.create_with_payload( char_literal149 )
        @adaptor.add_child( root_0, tree_for_char_literal149 )

      end

      @state.following.push( TOKENS_FOLLOWING_exp_IN_arrays_1567 )
      exp150 = exp
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, exp150.tree )
      end

      char_literal151 = match( RBRAK, TOKENS_FOLLOWING_RBRAK_IN_arrays_1569 )
      if @state.backtracking == 0
        tree_for_char_literal151 = @adaptor.create_with_payload( char_literal151 )
        @adaptor.add_child( root_0, tree_for_char_literal151 )

      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         array1(( variable_name148 && @input.to_s( variable_name148.start, variable_name148.stop ) ), ( exp150 && @input.to_s( exp150.start, exp150.stop ) )) 
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
    # 249:1: functions : variable_name '(' ( expression_list )? ')' ;
    #
    def functions
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 31 )


      return_value = FunctionsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal153 = nil
      char_literal155 = nil
      variable_name152 = nil
      expression_list154 = nil


      tree_for_char_literal153 = nil
      tree_for_char_literal155 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 253:7: variable_name '(' ( expression_list )? ')'
      @state.following.push( TOKENS_FOLLOWING_variable_name_IN_functions_1593 )
      variable_name152 = variable_name
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, variable_name152.tree )
      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         call_func1(( variable_name152 && @input.to_s( variable_name152.start, variable_name152.stop ) )) 
        # <-- action
      end

      char_literal153 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_functions_1597 )
      if @state.backtracking == 0
        tree_for_char_literal153 = @adaptor.create_with_payload( char_literal153 )
        @adaptor.add_child( root_0, tree_for_char_literal153 )

      end

      # at line 253:61: ( expression_list )?
      alt_23 = 2
      look_23_0 = @input.peek( 1 )

      if ( look_23_0 == BOOLEAN || look_23_0 == FLOAT || look_23_0 == ID || look_23_0 == INT || look_23_0.between?( LPAREN, MINUS ) || look_23_0 == STRING )
        alt_23 = 1
      end
      case alt_23
      when 1
        # at line 253:61: expression_list
        @state.following.push( TOKENS_FOLLOWING_expression_list_IN_functions_1599 )
        expression_list154 = expression_list
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression_list154.tree )
        end


      end
      char_literal155 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_functions_1602 )
      if @state.backtracking == 0
        tree_for_char_literal155 = @adaptor.create_with_payload( char_literal155 )
        @adaptor.add_child( root_0, tree_for_char_literal155 )

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
    # 256:1: expression_list : expression ( ',' expression_list )* ;
    #
    def expression_list
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 32 )


      return_value = ExpressionListReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal157 = nil
      expression156 = nil
      expression_list158 = nil


      tree_for_char_literal157 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 257:7: expression ( ',' expression_list )*
      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         exp6 
        # <-- action
      end

      @state.following.push( TOKENS_FOLLOWING_expression_IN_expression_list_1623 )
      expression156 = expression
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, expression156.tree )
      end


      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         exp7; call_func2 
        # <-- action
      end

      # at line 257:48: ( ',' expression_list )*
      while true # decision 24
        alt_24 = 2
        look_24_0 = @input.peek( 1 )

        if ( look_24_0 == COMMA )
          alt_24 = 1

        end
        case alt_24
        when 1
          # at line 257:49: ',' expression_list
          char_literal157 = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_expression_list_1628 )
          if @state.backtracking == 0
            tree_for_char_literal157 = @adaptor.create_with_payload( char_literal157 )
            @adaptor.add_child( root_0, tree_for_char_literal157 )

          end

          @state.following.push( TOKENS_FOLLOWING_expression_list_IN_expression_list_1630 )
          expression_list158 = expression_list
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, expression_list158.tree )
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
    # 113:7: synpred1_Rubik : '}' ;
    #
    # This is an imaginary rule inserted by ANTLR to
    # implement a syntactic predicate decision
    #
    def synpred1_Rubik
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 33 )


      # at line 113:9: '}'
      match( RBRACE, TOKENS_FOLLOWING_RBRACE_IN_synpred1_Rubik_663 )

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 33 )


    end


    TOKENS_FOLLOWING_block_IN_program_471 = Set[ 9, 10, 13, 16, 18, 19, 20, 26, 27, 29, 40, 41, 46, 48, 49, 50, 55, 56, 58, 59 ]
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
    TOKENS_FOLLOWING_functions_IN_statement_633 = Set[ 51 ]
    TOKENS_FOLLOWING_statement_end_IN_statement_635 = Set[ 1 ]
    TOKENS_FOLLOWING_SEMI_IN_statement_end_653 = Set[ 1 ]
    TOKENS_FOLLOWING_EOF_IN_statement_end_674 = Set[ 1 ]
    TOKENS_FOLLOWING_robot_IN_robot_statement_691 = Set[ 51 ]
    TOKENS_FOLLOWING_statement_end_IN_robot_statement_693 = Set[ 1 ]
    TOKENS_FOLLOWING_R_RETURN_IN_return_statement_711 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_expression_IN_return_statement_713 = Set[ 51 ]
    TOKENS_FOLLOWING_statement_end_IN_return_statement_717 = Set[ 1 ]
    TOKENS_FOLLOWING_VAR_TYPE_IN_variable_statement_740 = Set[ 26 ]
    TOKENS_FOLLOWING_variable_declaration_list_IN_variable_statement_744 = Set[ 51 ]
    TOKENS_FOLLOWING_statement_end_IN_variable_statement_746 = Set[ 1 ]
    TOKENS_FOLLOWING_variable_declaration_IN_variable_declaration_list_764 = Set[ 1, 12 ]
    TOKENS_FOLLOWING_COMMA_IN_variable_declaration_list_767 = Set[ 26 ]
    TOKENS_FOLLOWING_variable_declaration_IN_variable_declaration_list_769 = Set[ 1, 12 ]
    TOKENS_FOLLOWING_declaration_target_IN_variable_declaration_788 = Set[ 1, 5 ]
    TOKENS_FOLLOWING_ASGN_IN_variable_declaration_791 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_expression_IN_variable_declaration_793 = Set[ 1 ]
    TOKENS_FOLLOWING_variable_name_IN_declaration_target_812 = Set[ 1, 30 ]
    TOKENS_FOLLOWING_LBRAK_IN_declaration_target_815 = Set[ 28 ]
    TOKENS_FOLLOWING_INT_IN_declaration_target_817 = Set[ 44 ]
    TOKENS_FOLLOWING_RBRAK_IN_declaration_target_819 = Set[ 1 ]
    TOKENS_FOLLOWING_variable_name_IN_assignment_statement_840 = Set[ 5, 30 ]
    TOKENS_FOLLOWING_LBRAK_IN_assignment_statement_843 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_exp_IN_assignment_statement_845 = Set[ 44 ]
    TOKENS_FOLLOWING_RBRAK_IN_assignment_statement_847 = Set[ 5 ]
    TOKENS_FOLLOWING_ASGN_IN_assignment_statement_853 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_expression_IN_assignment_statement_857 = Set[ 51 ]
    TOKENS_FOLLOWING_statement_end_IN_assignment_statement_861 = Set[ 1 ]
    TOKENS_FOLLOWING_IF_IN_condition_statement_879 = Set[ 33 ]
    TOKENS_FOLLOWING_LPAREN_IN_condition_statement_881 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_expression_IN_condition_statement_883 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_condition_statement_885 = Set[ 9, 10, 13, 16, 18, 19, 20, 26, 27, 29, 40, 41, 48, 49, 50, 55, 56, 58, 59 ]
    TOKENS_FOLLOWING_block_IN_condition_statement_888 = Set[ 1, 21 ]
    TOKENS_FOLLOWING_ELSE_IN_condition_statement_893 = Set[ 9, 10, 13, 16, 18, 19, 20, 26, 27, 29, 40, 41, 48, 49, 50, 55, 56, 58, 59 ]
    TOKENS_FOLLOWING_block_IN_condition_statement_895 = Set[ 1 ]
    TOKENS_FOLLOWING_exp_IN_expression_916 = Set[ 1, 22, 24, 25, 31, 32, 36 ]
    TOKENS_FOLLOWING_relation_op_IN_expression_919 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_exp_IN_expression_923 = Set[ 1 ]
    TOKENS_FOLLOWING_term_IN_exp_1001 = Set[ 1, 34, 42 ]
    TOKENS_FOLLOWING_set_IN_exp_1006 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_exp_IN_exp_1014 = Set[ 1 ]
    TOKENS_FOLLOWING_factor_IN_term_1033 = Set[ 1, 15, 52 ]
    TOKENS_FOLLOWING_set_IN_term_1038 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_term_IN_term_1046 = Set[ 1 ]
    TOKENS_FOLLOWING_LPAREN_IN_factor_1065 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_expression_IN_factor_1069 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_factor_1071 = Set[ 1 ]
    TOKENS_FOLLOWING_MINUS_IN_factor_1081 = Set[ 7, 23, 26, 28, 53 ]
    TOKENS_FOLLOWING_primary_IN_factor_1084 = Set[ 1 ]
    TOKENS_FOLLOWING_T__59_IN_write_statement_1101 = Set[ 33 ]
    TOKENS_FOLLOWING_LPAREN_IN_write_statement_1103 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_write_expression_IN_write_statement_1105 = Set[ 17, 45 ]
    TOKENS_FOLLOWING_DOT_IN_write_statement_1110 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_write_expression_IN_write_statement_1112 = Set[ 17, 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_write_statement_1118 = Set[ 51 ]
    TOKENS_FOLLOWING_statement_end_IN_write_statement_1120 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_write_expression_1138 = Set[ 1 ]
    TOKENS_FOLLOWING_T__58_IN_read_statement_1155 = Set[ 33 ]
    TOKENS_FOLLOWING_LPAREN_IN_read_statement_1157 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_read_statement_1159 = Set[ 51 ]
    TOKENS_FOLLOWING_statement_end_IN_read_statement_1163 = Set[ 1 ]
    TOKENS_FOLLOWING_DO_IN_loop_statement_1181 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_exp_IN_loop_statement_1183 = Set[ 54 ]
    TOKENS_FOLLOWING_TIMES_IN_loop_statement_1186 = Set[ 9, 10, 13, 16, 18, 19, 20, 26, 27, 29, 40, 41, 48, 49, 50, 55, 56, 58, 59 ]
    TOKENS_FOLLOWING_block_IN_loop_statement_1188 = Set[ 1 ]
    TOKENS_FOLLOWING_DEF_IN_function_1212 = Set[ 56 ]
    TOKENS_FOLLOWING_VAR_TYPE_IN_function_1214 = Set[ 26 ]
    TOKENS_FOLLOWING_variable_name_IN_function_1216 = Set[ 33 ]
    TOKENS_FOLLOWING_function_parameters_IN_function_1220 = Set[ 9, 10, 13, 16, 18, 19, 20, 26, 27, 29, 40, 41, 48, 49, 50, 55, 56, 58, 59 ]
    TOKENS_FOLLOWING_block_IN_function_1222 = Set[ 1 ]
    TOKENS_FOLLOWING_LPAREN_IN_function_parameters_1241 = Set[ 45, 56 ]
    TOKENS_FOLLOWING_parameters_IN_function_parameters_1243 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_function_parameters_1246 = Set[ 1 ]
    TOKENS_FOLLOWING_VAR_TYPE_IN_parameters_1263 = Set[ 26 ]
    TOKENS_FOLLOWING_variable_name_IN_parameters_1265 = Set[ 1, 12 ]
    TOKENS_FOLLOWING_COMMA_IN_parameters_1270 = Set[ 56 ]
    TOKENS_FOLLOWING_parameters_IN_parameters_1272 = Set[ 1, 12 ]
    TOKENS_FOLLOWING_CHANGE_COLOR_IN_robot_1291 = Set[ 33 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1293 = Set[ 11 ]
    TOKENS_FOLLOWING_COLOR_IN_robot_1295 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1297 = Set[ 1 ]
    TOKENS_FOLLOWING_CHANGE_DIR_IN_robot_1307 = Set[ 33 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1309 = Set[ 14 ]
    TOKENS_FOLLOWING_DIR_IN_robot_1311 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1313 = Set[ 1 ]
    TOKENS_FOLLOWING_TLK_IN_robot_1323 = Set[ 33 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1325 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_expression_IN_robot_1327 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1329 = Set[ 1 ]
    TOKENS_FOLLOWING_PEN_DOWN_IN_robot_1339 = Set[ 33 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1341 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1343 = Set[ 1 ]
    TOKENS_FOLLOWING_PEN_UP_IN_robot_1353 = Set[ 33 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1355 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1357 = Set[ 1 ]
    TOKENS_FOLLOWING_R_RESET_IN_robot_1367 = Set[ 33 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1369 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1371 = Set[ 1 ]
    TOKENS_FOLLOWING_DRAW_CIRCLE_IN_robot_1381 = Set[ 33 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1383 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_expression_IN_robot_1385 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1387 = Set[ 1 ]
    TOKENS_FOLLOWING_DRAW_SQUARE_IN_robot_1397 = Set[ 33 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1399 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_expression_IN_robot_1401 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1403 = Set[ 1 ]
    TOKENS_FOLLOWING_DRAW_RECTANGLE_IN_robot_1413 = Set[ 33 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1415 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_expression_IN_robot_1417 = Set[ 12 ]
    TOKENS_FOLLOWING_COMMA_IN_robot_1419 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_expression_IN_robot_1421 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1423 = Set[ 1 ]
    TOKENS_FOLLOWING_R_MOVE_IN_robot_1433 = Set[ 33 ]
    TOKENS_FOLLOWING_LPAREN_IN_robot_1435 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_expression_IN_robot_1437 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_robot_1439 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_variable_name_1460 = Set[ 1 ]
    TOKENS_FOLLOWING_primitive_IN_primary_1479 = Set[ 1 ]
    TOKENS_FOLLOWING_functions_IN_primary_1489 = Set[ 1 ]
    TOKENS_FOLLOWING_arrays_IN_primary_1497 = Set[ 1 ]
    TOKENS_FOLLOWING_BOOLEAN_IN_primitive_1514 = Set[ 1 ]
    TOKENS_FOLLOWING_STRING_IN_primitive_1522 = Set[ 1 ]
    TOKENS_FOLLOWING_FLOAT_IN_primitive_1530 = Set[ 1 ]
    TOKENS_FOLLOWING_INT_IN_primitive_1538 = Set[ 1 ]
    TOKENS_FOLLOWING_variable_name_IN_primitive_1546 = Set[ 1 ]
    TOKENS_FOLLOWING_variable_name_IN_arrays_1563 = Set[ 30 ]
    TOKENS_FOLLOWING_LBRAK_IN_arrays_1565 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_exp_IN_arrays_1567 = Set[ 44 ]
    TOKENS_FOLLOWING_RBRAK_IN_arrays_1569 = Set[ 1 ]
    TOKENS_FOLLOWING_variable_name_IN_functions_1593 = Set[ 33 ]
    TOKENS_FOLLOWING_LPAREN_IN_functions_1597 = Set[ 7, 23, 26, 28, 33, 34, 45, 53 ]
    TOKENS_FOLLOWING_expression_list_IN_functions_1599 = Set[ 45 ]
    TOKENS_FOLLOWING_RPAREN_IN_functions_1602 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_expression_list_1623 = Set[ 1, 12 ]
    TOKENS_FOLLOWING_COMMA_IN_expression_list_1628 = Set[ 7, 23, 26, 28, 33, 34, 53 ]
    TOKENS_FOLLOWING_expression_list_IN_expression_list_1630 = Set[ 1, 12 ]
    TOKENS_FOLLOWING_RBRACE_IN_synpred1_Rubik_663 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0

end
