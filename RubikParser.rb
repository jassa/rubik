#!/usr/bin/env ruby
#
# Rubik.g
# --
# Generated using ANTLR version: 3.5
# Ruby runtime library version: 1.10.0
# Input grammar file: Rubik.g
# Generated at: 2013-10-09 14:52:22
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
    define_tokens( :EOF => -1, :T__18 => 18, :T__19 => 19, :T__20 => 20, 
                   :T__21 => 21, :T__22 => 22, :T__23 => 23, :T__24 => 24, 
                   :T__25 => 25, :T__26 => 26, :T__27 => 27, :T__28 => 28, 
                   :T__29 => 29, :T__30 => 30, :T__31 => 31, :T__32 => 32, 
                   :T__33 => 33, :T__34 => 34, :T__35 => 35, :T__36 => 36, 
                   :T__37 => 37, :T__38 => 38, :T__39 => 39, :T__40 => 40, 
                   :T__41 => 41, :T__42 => 42, :BLOCK => 4, :BOOLEAN => 5, 
                   :CHAR => 6, :FLOAT => 7, :ID => 8, :INT => 9, :LBRACE => 10, 
                   :NEWLINE => 11, :PLUS => 12, :RBRACE => 13, :SEMI => 14, 
                   :STRING => 15, :VAR_TYPE => 16, :WS => 17 )


    # register the proper human-readable name or literal value
    # for each token type
    #
    # this is necessary because anonymous tokens, which are
    # created from literal values in the grammar, do not
    # have descriptive names
    register_names( "BLOCK", "BOOLEAN", "CHAR", "FLOAT", "ID", "INT", "LBRACE", 
                    "NEWLINE", "PLUS", "RBRACE", "SEMI", "STRING", "VAR_TYPE", 
                    "WS", "'!='", "'('", "')'", "'*'", "','", "'-'", "'.'", 
                    "'/'", "'<'", "'<='", "'='", "'=='", "'>'", "'>='", 
                    "'['", "']'", "'begin'", "'def'", "'do'", "'else'", 
                    "'end'", "'if'", "'print'", "'return'", "'times'" )


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
                     :parameters, :variable_name, :primary, :synpred1_Rubik ].freeze

    include TokenData

    begin
      generated_using( "Rubik.g", "3.5", "1.10.0" )
    rescue NoMethodError => error
      # ignore
    end

    def initialize( input, options = {} )
      super( input, options )
    end
    # - - - - - - - - - - - - Rules - - - - - - - - - - - - -
    ProgramReturnValue = define_return_scope

    #
    # parser rule program
    #
    # (in Rubik.g)
    # 18:1: program : 'begin' ( block )+ 'end' ;
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


      # at line 19:7: 'begin' ( block )+ 'end'
      string_literal1 = match( T__34, TOKENS_FOLLOWING_T__34_IN_program_91 )
      if @state.backtracking == 0
        tree_for_string_literal1 = @adaptor.create_with_payload( string_literal1 )
        @adaptor.add_child( root_0, tree_for_string_literal1 )

      end

      # at file 19:15: ( block )+
      match_count_1 = 0
      while true
        alt_1 = 2
        look_1_0 = @input.peek( 1 )

        if ( look_1_0 == ID || look_1_0 == LBRACE || look_1_0 == VAR_TYPE || look_1_0.between?( T__35, T__36 ) || look_1_0.between?( T__39, T__41 ) )
          alt_1 = 1

        end
        case alt_1
        when 1
          # at line 19:15: block
          @state.following.push( TOKENS_FOLLOWING_block_IN_program_93 )
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


      string_literal3 = match( T__38, TOKENS_FOLLOWING_T__38_IN_program_96 )
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
    # 22:1: block : ( statement | statement_block );
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
      # at line 23:5: ( statement | statement_block )
      alt_2 = 2
      look_2_0 = @input.peek( 1 )

      if ( look_2_0 == ID || look_2_0 == VAR_TYPE || look_2_0.between?( T__35, T__36 ) || look_2_0.between?( T__39, T__41 ) )
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


        # at line 23:7: statement
        @state.following.push( TOKENS_FOLLOWING_statement_IN_block_113 )
        statement4 = statement
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, statement4.tree )
        end


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 24:7: statement_block
        @state.following.push( TOKENS_FOLLOWING_statement_block_IN_block_121 )
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
    # 27:1: statement_block : '{' ( statement )* '}' ;
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


      # at line 28:7: '{' ( statement )* '}'
      char_literal6 = match( LBRACE, TOKENS_FOLLOWING_LBRACE_IN_statement_block_138 )
      if @state.backtracking == 0
        tree_for_char_literal6 = @adaptor.create_with_payload( char_literal6 )
        @adaptor.add_child( root_0, tree_for_char_literal6 )

      end

      # at line 28:11: ( statement )*
      while true # decision 3
        alt_3 = 2
        look_3_0 = @input.peek( 1 )

        if ( look_3_0 == ID || look_3_0 == VAR_TYPE || look_3_0.between?( T__35, T__36 ) || look_3_0.between?( T__39, T__41 ) )
          alt_3 = 1

        end
        case alt_3
        when 1
          # at line 28:11: statement
          @state.following.push( TOKENS_FOLLOWING_statement_IN_statement_block_140 )
          statement7 = statement
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, statement7.tree )
          end


        else
          break # out of loop for decision 3
        end
      end # loop for decision 3

      char_literal8 = match( RBRACE, TOKENS_FOLLOWING_RBRACE_IN_statement_block_143 )
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
    # 33:1: statement : ( variable_statement | assignment_statement | condition_statement | write_statement | loop_statement | return_statement | function );
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
      # at line 34:5: ( variable_statement | assignment_statement | condition_statement | write_statement | loop_statement | return_statement | function )
      alt_4 = 7
      case look_4 = @input.peek( 1 )
      when VAR_TYPE then alt_4 = 1
      when ID then alt_4 = 2
      when T__39 then alt_4 = 3
      when T__40 then alt_4 = 4
      when T__36 then alt_4 = 5
      when T__41 then alt_4 = 6
      when T__35 then alt_4 = 7
      else
        @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )



        raise NoViableAlternative( "", 4, 0 )

      end
      case alt_4
      when 1
        root_0 = @adaptor.create_flat_list


        # at line 34:7: variable_statement
        @state.following.push( TOKENS_FOLLOWING_variable_statement_IN_statement_162 )
        variable_statement9 = variable_statement
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, variable_statement9.tree )
        end


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 35:7: assignment_statement
        @state.following.push( TOKENS_FOLLOWING_assignment_statement_IN_statement_170 )
        assignment_statement10 = assignment_statement
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, assignment_statement10.tree )
        end


      when 3
        root_0 = @adaptor.create_flat_list


        # at line 36:7: condition_statement
        @state.following.push( TOKENS_FOLLOWING_condition_statement_IN_statement_178 )
        condition_statement11 = condition_statement
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, condition_statement11.tree )
        end


      when 4
        root_0 = @adaptor.create_flat_list


        # at line 37:7: write_statement
        @state.following.push( TOKENS_FOLLOWING_write_statement_IN_statement_186 )
        write_statement12 = write_statement
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, write_statement12.tree )
        end


      when 5
        root_0 = @adaptor.create_flat_list


        # at line 38:7: loop_statement
        @state.following.push( TOKENS_FOLLOWING_loop_statement_IN_statement_194 )
        loop_statement13 = loop_statement
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, loop_statement13.tree )
        end


      when 6
        root_0 = @adaptor.create_flat_list


        # at line 39:7: return_statement
        @state.following.push( TOKENS_FOLLOWING_return_statement_IN_statement_202 )
        return_statement14 = return_statement
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, return_statement14.tree )
        end


      when 7
        root_0 = @adaptor.create_flat_list


        # at line 40:7: function
        @state.following.push( TOKENS_FOLLOWING_function_IN_statement_210 )
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
    # 43:1: statement_end : ( ';' | ( '}' )=>);
    #
    def statement_end
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 5 )


      return_value = StatementEndReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal16 = nil


      tree_for_char_literal16 = nil

      begin
      # at line 44:5: ( ';' | ( '}' )=>)
      alt_5 = 2
      look_5_0 = @input.peek( 1 )

      if ( look_5_0 == SEMI )
        alt_5 = 1
      elsif ( look_5_0 == T__38 ) and ( syntactic_predicate?( :synpred1_Rubik ) )
        alt_5 = 2
      elsif ( look_5_0 == VAR_TYPE ) and ( syntactic_predicate?( :synpred1_Rubik ) )
        alt_5 = 2
      elsif ( look_5_0 == ID ) and ( syntactic_predicate?( :synpred1_Rubik ) )
        alt_5 = 2
      elsif ( look_5_0 == T__39 ) and ( syntactic_predicate?( :synpred1_Rubik ) )
        alt_5 = 2
      elsif ( look_5_0 == T__40 ) and ( syntactic_predicate?( :synpred1_Rubik ) )
        alt_5 = 2
      elsif ( look_5_0 == T__36 ) and ( syntactic_predicate?( :synpred1_Rubik ) )
        alt_5 = 2
      elsif ( look_5_0 == T__41 ) and ( syntactic_predicate?( :synpred1_Rubik ) )
        alt_5 = 2
      elsif ( look_5_0 == T__35 ) and ( syntactic_predicate?( :synpred1_Rubik ) )
        alt_5 = 2
      elsif ( look_5_0 == LBRACE ) and ( syntactic_predicate?( :synpred1_Rubik ) )
        alt_5 = 2
      elsif ( look_5_0 == T__37 ) and ( syntactic_predicate?( :synpred1_Rubik ) )
        alt_5 = 2
      elsif ( look_5_0 == RBRACE ) and ( syntactic_predicate?( :synpred1_Rubik ) )
        alt_5 = 2
      else
        @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )



        raise NoViableAlternative( "", 5, 0 )

      end
      case alt_5
      when 1
        root_0 = @adaptor.create_flat_list


        # at line 44:7: ';'
        char_literal16 = match( SEMI, TOKENS_FOLLOWING_SEMI_IN_statement_end_227 )
        if @state.backtracking == 0
          tree_for_char_literal16 = @adaptor.create_with_payload( char_literal16 )
          @adaptor.add_child( root_0, tree_for_char_literal16 )

        end


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 45:7: ( '}' )=>

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
    # 48:1: return_statement : 'return' expression statement_end !;
    #
    def return_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 6 )


      return_value = ReturnStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal17 = nil
      expression18 = nil
      statement_end19 = nil


      tree_for_string_literal17 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 49:7: 'return' expression statement_end !
      string_literal17 = match( T__41, TOKENS_FOLLOWING_T__41_IN_return_statement_257 )
      if @state.backtracking == 0
        tree_for_string_literal17 = @adaptor.create_with_payload( string_literal17 )
        @adaptor.add_child( root_0, tree_for_string_literal17 )

      end

      @state.following.push( TOKENS_FOLLOWING_expression_IN_return_statement_259 )
      expression18 = expression
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, expression18.tree )
      end

      @state.following.push( TOKENS_FOLLOWING_statement_end_IN_return_statement_261 )
      statement_end19 = statement_end
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
    # 52:1: variable_statement : VAR_TYPE variable_declaration_list statement_end !;
    #
    def variable_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 7 )


      return_value = VariableStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __VAR_TYPE20__ = nil
      variable_declaration_list21 = nil
      statement_end22 = nil


      tree_for_VAR_TYPE20 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 53:7: VAR_TYPE variable_declaration_list statement_end !
      __VAR_TYPE20__ = match( VAR_TYPE, TOKENS_FOLLOWING_VAR_TYPE_IN_variable_statement_279 )
      if @state.backtracking == 0
        tree_for_VAR_TYPE20 = @adaptor.create_with_payload( __VAR_TYPE20__ )
        @adaptor.add_child( root_0, tree_for_VAR_TYPE20 )

      end

      @state.following.push( TOKENS_FOLLOWING_variable_declaration_list_IN_variable_statement_281 )
      variable_declaration_list21 = variable_declaration_list
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, variable_declaration_list21.tree )
      end

      @state.following.push( TOKENS_FOLLOWING_statement_end_IN_variable_statement_283 )
      statement_end22 = statement_end
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
    # 56:1: variable_declaration_list : variable_declaration ( ',' variable_declaration )* ;
    #
    def variable_declaration_list
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 8 )


      return_value = VariableDeclarationListReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal24 = nil
      variable_declaration23 = nil
      variable_declaration25 = nil


      tree_for_char_literal24 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 57:7: variable_declaration ( ',' variable_declaration )*
      @state.following.push( TOKENS_FOLLOWING_variable_declaration_IN_variable_declaration_list_301 )
      variable_declaration23 = variable_declaration
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, variable_declaration23.tree )
      end

      # at line 57:28: ( ',' variable_declaration )*
      while true # decision 6
        alt_6 = 2
        look_6_0 = @input.peek( 1 )

        if ( look_6_0 == T__22 )
          alt_6 = 1

        end
        case alt_6
        when 1
          # at line 57:29: ',' variable_declaration
          char_literal24 = match( T__22, TOKENS_FOLLOWING_T__22_IN_variable_declaration_list_304 )
          if @state.backtracking == 0
            tree_for_char_literal24 = @adaptor.create_with_payload( char_literal24 )
            @adaptor.add_child( root_0, tree_for_char_literal24 )

          end

          @state.following.push( TOKENS_FOLLOWING_variable_declaration_IN_variable_declaration_list_306 )
          variable_declaration25 = variable_declaration
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, variable_declaration25.tree )
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
    # 60:1: variable_declaration : declaration_target ( '=' expression )? ;
    #
    def variable_declaration
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 9 )


      return_value = VariableDeclarationReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal27 = nil
      declaration_target26 = nil
      expression28 = nil


      tree_for_char_literal27 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 61:7: declaration_target ( '=' expression )?
      @state.following.push( TOKENS_FOLLOWING_declaration_target_IN_variable_declaration_325 )
      declaration_target26 = declaration_target
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, declaration_target26.tree )
      end

      # at line 61:26: ( '=' expression )?
      alt_7 = 2
      look_7_0 = @input.peek( 1 )

      if ( look_7_0 == T__28 )
        alt_7 = 1
      end
      case alt_7
      when 1
        # at line 61:27: '=' expression
        char_literal27 = match( T__28, TOKENS_FOLLOWING_T__28_IN_variable_declaration_328 )
        if @state.backtracking == 0
          tree_for_char_literal27 = @adaptor.create_with_payload( char_literal27 )
          @adaptor.add_child( root_0, tree_for_char_literal27 )

        end

        @state.following.push( TOKENS_FOLLOWING_expression_IN_variable_declaration_330 )
        expression28 = expression
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression28.tree )
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
    # 64:1: declaration_target : variable_name ( '[' INT ']' )? ( '[' INT ']' )? ;
    #
    def declaration_target
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 10 )


      return_value = DeclarationTargetReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal30 = nil
      __INT31__ = nil
      char_literal32 = nil
      char_literal33 = nil
      __INT34__ = nil
      char_literal35 = nil
      variable_name29 = nil


      tree_for_char_literal30 = nil
      tree_for_INT31 = nil
      tree_for_char_literal32 = nil
      tree_for_char_literal33 = nil
      tree_for_INT34 = nil
      tree_for_char_literal35 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 65:7: variable_name ( '[' INT ']' )? ( '[' INT ']' )?
      @state.following.push( TOKENS_FOLLOWING_variable_name_IN_declaration_target_349 )
      variable_name29 = variable_name
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, variable_name29.tree )
      end

      # at line 65:21: ( '[' INT ']' )?
      alt_8 = 2
      look_8_0 = @input.peek( 1 )

      if ( look_8_0 == T__32 )
        look_8_1 = @input.peek( 2 )

        if ( look_8_1 == INT )
          look_8_3 = @input.peek( 3 )

          if ( look_8_3 == T__33 )
            alt_8 = 1
          end
        end
      end
      case alt_8
      when 1
        # at line 65:22: '[' INT ']'
        char_literal30 = match( T__32, TOKENS_FOLLOWING_T__32_IN_declaration_target_352 )
        if @state.backtracking == 0
          tree_for_char_literal30 = @adaptor.create_with_payload( char_literal30 )
          @adaptor.add_child( root_0, tree_for_char_literal30 )

        end

        __INT31__ = match( INT, TOKENS_FOLLOWING_INT_IN_declaration_target_354 )
        if @state.backtracking == 0
          tree_for_INT31 = @adaptor.create_with_payload( __INT31__ )
          @adaptor.add_child( root_0, tree_for_INT31 )

        end

        char_literal32 = match( T__33, TOKENS_FOLLOWING_T__33_IN_declaration_target_356 )
        if @state.backtracking == 0
          tree_for_char_literal32 = @adaptor.create_with_payload( char_literal32 )
          @adaptor.add_child( root_0, tree_for_char_literal32 )

        end


      end
      # at line 65:36: ( '[' INT ']' )?
      alt_9 = 2
      look_9_0 = @input.peek( 1 )

      if ( look_9_0 == T__32 )
        alt_9 = 1
      end
      case alt_9
      when 1
        # at line 65:37: '[' INT ']'
        char_literal33 = match( T__32, TOKENS_FOLLOWING_T__32_IN_declaration_target_361 )
        if @state.backtracking == 0
          tree_for_char_literal33 = @adaptor.create_with_payload( char_literal33 )
          @adaptor.add_child( root_0, tree_for_char_literal33 )

        end

        __INT34__ = match( INT, TOKENS_FOLLOWING_INT_IN_declaration_target_363 )
        if @state.backtracking == 0
          tree_for_INT34 = @adaptor.create_with_payload( __INT34__ )
          @adaptor.add_child( root_0, tree_for_INT34 )

        end

        char_literal35 = match( T__33, TOKENS_FOLLOWING_T__33_IN_declaration_target_365 )
        if @state.backtracking == 0
          tree_for_char_literal35 = @adaptor.create_with_payload( char_literal35 )
          @adaptor.add_child( root_0, tree_for_char_literal35 )

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
    # 68:1: assignment_statement : ID '=' expression statement_end !;
    #
    def assignment_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 11 )


      return_value = AssignmentStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __ID36__ = nil
      char_literal37 = nil
      expression38 = nil
      statement_end39 = nil


      tree_for_ID36 = nil
      tree_for_char_literal37 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 69:7: ID '=' expression statement_end !
      __ID36__ = match( ID, TOKENS_FOLLOWING_ID_IN_assignment_statement_384 )
      if @state.backtracking == 0
        tree_for_ID36 = @adaptor.create_with_payload( __ID36__ )
        @adaptor.add_child( root_0, tree_for_ID36 )

      end

      char_literal37 = match( T__28, TOKENS_FOLLOWING_T__28_IN_assignment_statement_386 )
      if @state.backtracking == 0
        tree_for_char_literal37 = @adaptor.create_with_payload( char_literal37 )
        @adaptor.add_child( root_0, tree_for_char_literal37 )

      end

      @state.following.push( TOKENS_FOLLOWING_expression_IN_assignment_statement_388 )
      expression38 = expression
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, expression38.tree )
      end

      @state.following.push( TOKENS_FOLLOWING_statement_end_IN_assignment_statement_390 )
      statement_end39 = statement_end
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
    # 72:1: condition_statement : 'if' '(' expression ')' block ( 'else' block )? ;
    #
    def condition_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 12 )


      return_value = ConditionStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal40 = nil
      char_literal41 = nil
      char_literal43 = nil
      string_literal45 = nil
      expression42 = nil
      block44 = nil
      block46 = nil


      tree_for_string_literal40 = nil
      tree_for_char_literal41 = nil
      tree_for_char_literal43 = nil
      tree_for_string_literal45 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 73:7: 'if' '(' expression ')' block ( 'else' block )?
      string_literal40 = match( T__39, TOKENS_FOLLOWING_T__39_IN_condition_statement_408 )
      if @state.backtracking == 0
        tree_for_string_literal40 = @adaptor.create_with_payload( string_literal40 )
        @adaptor.add_child( root_0, tree_for_string_literal40 )

      end

      char_literal41 = match( T__19, TOKENS_FOLLOWING_T__19_IN_condition_statement_410 )
      if @state.backtracking == 0
        tree_for_char_literal41 = @adaptor.create_with_payload( char_literal41 )
        @adaptor.add_child( root_0, tree_for_char_literal41 )

      end

      @state.following.push( TOKENS_FOLLOWING_expression_IN_condition_statement_412 )
      expression42 = expression
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, expression42.tree )
      end

      char_literal43 = match( T__20, TOKENS_FOLLOWING_T__20_IN_condition_statement_414 )
      if @state.backtracking == 0
        tree_for_char_literal43 = @adaptor.create_with_payload( char_literal43 )
        @adaptor.add_child( root_0, tree_for_char_literal43 )

      end

      @state.following.push( TOKENS_FOLLOWING_block_IN_condition_statement_416 )
      block44 = block
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, block44.tree )
      end

      # at line 73:37: ( 'else' block )?
      alt_10 = 2
      look_10_0 = @input.peek( 1 )

      if ( look_10_0 == T__37 )
        alt_10 = 1
      end
      case alt_10
      when 1
        # at line 73:38: 'else' block
        string_literal45 = match( T__37, TOKENS_FOLLOWING_T__37_IN_condition_statement_419 )
        if @state.backtracking == 0
          tree_for_string_literal45 = @adaptor.create_with_payload( string_literal45 )
          @adaptor.add_child( root_0, tree_for_string_literal45 )

        end

        @state.following.push( TOKENS_FOLLOWING_block_IN_condition_statement_421 )
        block46 = block
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, block46.tree )
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
    # 76:1: expression : exp ( relation_op exp )? ;
    #
    def expression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 13 )


      return_value = ExpressionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      exp47 = nil
      relation_op48 = nil
      exp49 = nil



      begin
      root_0 = @adaptor.create_flat_list


      # at line 77:7: exp ( relation_op exp )?
      @state.following.push( TOKENS_FOLLOWING_exp_IN_expression_440 )
      exp47 = exp
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, exp47.tree )
      end

      # at line 77:11: ( relation_op exp )?
      alt_11 = 2
      look_11_0 = @input.peek( 1 )

      if ( look_11_0 == T__18 || look_11_0.between?( T__26, T__27 ) || look_11_0.between?( T__29, T__31 ) )
        alt_11 = 1
      end
      case alt_11
      when 1
        # at line 77:12: relation_op exp
        @state.following.push( TOKENS_FOLLOWING_relation_op_IN_expression_443 )
        relation_op48 = relation_op
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, relation_op48.tree )
        end

        @state.following.push( TOKENS_FOLLOWING_exp_IN_expression_445 )
        exp49 = exp
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, exp49.tree )
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
    # 80:1: relation_op : ( '<' | '>' | '<=' | '>=' | '==' | '!=' );
    #
    def relation_op
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 14 )


      return_value = RelationOpReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      set50 = nil


      tree_for_set50 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 
      set50 = @input.look

      if @input.peek(1) == T__18 || @input.peek( 1 ).between?( T__26, T__27 ) || @input.peek( 1 ).between?( T__29, T__31 )
        @input.consume
        if @state.backtracking == 0
          @adaptor.add_child( root_0, @adaptor.create_with_payload( set50 ) )
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
    # 89:1: exp : term ( ( '+' | '-' ) exp )? ;
    #
    def exp
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )


      return_value = ExpReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      set52 = nil
      term51 = nil
      exp53 = nil


      tree_for_set52 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 90:7: term ( ( '+' | '-' ) exp )?
      @state.following.push( TOKENS_FOLLOWING_term_IN_exp_521 )
      term51 = term
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, term51.tree )
      end

      # at line 90:12: ( ( '+' | '-' ) exp )?
      alt_12 = 2
      look_12_0 = @input.peek( 1 )

      if ( look_12_0 == PLUS || look_12_0 == T__23 )
        alt_12 = 1
      end
      case alt_12
      when 1
        # at line 90:13: ( '+' | '-' ) exp
        set52 = @input.look

        if @input.peek(1) == PLUS || @input.peek(1) == T__23
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


        @state.following.push( TOKENS_FOLLOWING_exp_IN_exp_530 )
        exp53 = exp
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, exp53.tree )
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
    # 93:1: term : factor ( ( '*' | '/' ) term )? ;
    #
    def term
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )


      return_value = TermReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      set55 = nil
      factor54 = nil
      term56 = nil


      tree_for_set55 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 94:7: factor ( ( '*' | '/' ) term )?
      @state.following.push( TOKENS_FOLLOWING_factor_IN_term_549 )
      factor54 = factor
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, factor54.tree )
      end

      # at line 94:14: ( ( '*' | '/' ) term )?
      alt_13 = 2
      look_13_0 = @input.peek( 1 )

      if ( look_13_0 == T__21 || look_13_0 == T__25 )
        alt_13 = 1
      end
      case alt_13
      when 1
        # at line 94:15: ( '*' | '/' ) term
        set55 = @input.look

        if @input.peek(1) == T__21 || @input.peek(1) == T__25
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


        @state.following.push( TOKENS_FOLLOWING_term_IN_term_558 )
        term56 = term
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, term56.tree )
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
    # 97:1: factor : ( '(' expression ')' | ( '-' )? primary );
    #
    def factor
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )


      return_value = FactorReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal57 = nil
      char_literal59 = nil
      char_literal60 = nil
      expression58 = nil
      primary61 = nil


      tree_for_char_literal57 = nil
      tree_for_char_literal59 = nil
      tree_for_char_literal60 = nil

      begin
      # at line 98:5: ( '(' expression ')' | ( '-' )? primary )
      alt_15 = 2
      look_15_0 = @input.peek( 1 )

      if ( look_15_0 == T__19 )
        alt_15 = 1
      elsif ( look_15_0.between?( BOOLEAN, INT ) || look_15_0 == T__23 )
        alt_15 = 2
      else
        @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )



        raise NoViableAlternative( "", 15, 0 )

      end
      case alt_15
      when 1
        root_0 = @adaptor.create_flat_list


        # at line 98:7: '(' expression ')'
        char_literal57 = match( T__19, TOKENS_FOLLOWING_T__19_IN_factor_577 )
        if @state.backtracking == 0
          tree_for_char_literal57 = @adaptor.create_with_payload( char_literal57 )
          @adaptor.add_child( root_0, tree_for_char_literal57 )

        end

        @state.following.push( TOKENS_FOLLOWING_expression_IN_factor_579 )
        expression58 = expression
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression58.tree )
        end

        char_literal59 = match( T__20, TOKENS_FOLLOWING_T__20_IN_factor_581 )
        if @state.backtracking == 0
          tree_for_char_literal59 = @adaptor.create_with_payload( char_literal59 )
          @adaptor.add_child( root_0, tree_for_char_literal59 )

        end


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 99:7: ( '-' )? primary
        # at line 99:7: ( '-' )?
        alt_14 = 2
        look_14_0 = @input.peek( 1 )

        if ( look_14_0 == T__23 )
          alt_14 = 1
        end
        case alt_14
        when 1
          # at line 99:7: '-'
          char_literal60 = match( T__23, TOKENS_FOLLOWING_T__23_IN_factor_589 )
          if @state.backtracking == 0
            tree_for_char_literal60 = @adaptor.create_with_payload( char_literal60 )
            @adaptor.add_child( root_0, tree_for_char_literal60 )

          end


        end
        @state.following.push( TOKENS_FOLLOWING_primary_IN_factor_592 )
        primary61 = primary
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, primary61.tree )
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
    # 102:1: expression_list : expression ( ',' expression )* ;
    #
    def expression_list
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )


      return_value = ExpressionListReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal63 = nil
      expression62 = nil
      expression64 = nil


      tree_for_char_literal63 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 103:7: expression ( ',' expression )*
      @state.following.push( TOKENS_FOLLOWING_expression_IN_expression_list_609 )
      expression62 = expression
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, expression62.tree )
      end

      # at line 103:18: ( ',' expression )*
      while true # decision 16
        alt_16 = 2
        look_16_0 = @input.peek( 1 )

        if ( look_16_0 == T__22 )
          alt_16 = 1

        end
        case alt_16
        when 1
          # at line 103:19: ',' expression
          char_literal63 = match( T__22, TOKENS_FOLLOWING_T__22_IN_expression_list_612 )
          if @state.backtracking == 0
            tree_for_char_literal63 = @adaptor.create_with_payload( char_literal63 )
            @adaptor.add_child( root_0, tree_for_char_literal63 )

          end

          @state.following.push( TOKENS_FOLLOWING_expression_IN_expression_list_614 )
          expression64 = expression
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, expression64.tree )
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
    # 106:1: write_statement : 'print' '(' write_expression ( '.' write_expression )* ')' statement_end !;
    #
    def write_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )


      return_value = WriteStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal65 = nil
      char_literal66 = nil
      char_literal68 = nil
      char_literal70 = nil
      write_expression67 = nil
      write_expression69 = nil
      statement_end71 = nil


      tree_for_string_literal65 = nil
      tree_for_char_literal66 = nil
      tree_for_char_literal68 = nil
      tree_for_char_literal70 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 107:7: 'print' '(' write_expression ( '.' write_expression )* ')' statement_end !
      string_literal65 = match( T__40, TOKENS_FOLLOWING_T__40_IN_write_statement_633 )
      if @state.backtracking == 0
        tree_for_string_literal65 = @adaptor.create_with_payload( string_literal65 )
        @adaptor.add_child( root_0, tree_for_string_literal65 )

      end

      char_literal66 = match( T__19, TOKENS_FOLLOWING_T__19_IN_write_statement_635 )
      if @state.backtracking == 0
        tree_for_char_literal66 = @adaptor.create_with_payload( char_literal66 )
        @adaptor.add_child( root_0, tree_for_char_literal66 )

      end

      @state.following.push( TOKENS_FOLLOWING_write_expression_IN_write_statement_637 )
      write_expression67 = write_expression
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, write_expression67.tree )
      end

      # at line 107:36: ( '.' write_expression )*
      while true # decision 17
        alt_17 = 2
        look_17_0 = @input.peek( 1 )

        if ( look_17_0 == T__24 )
          alt_17 = 1

        end
        case alt_17
        when 1
          # at line 107:37: '.' write_expression
          char_literal68 = match( T__24, TOKENS_FOLLOWING_T__24_IN_write_statement_640 )
          if @state.backtracking == 0
            tree_for_char_literal68 = @adaptor.create_with_payload( char_literal68 )
            @adaptor.add_child( root_0, tree_for_char_literal68 )

          end

          @state.following.push( TOKENS_FOLLOWING_write_expression_IN_write_statement_642 )
          write_expression69 = write_expression
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, write_expression69.tree )
          end


        else
          break # out of loop for decision 17
        end
      end # loop for decision 17

      char_literal70 = match( T__20, TOKENS_FOLLOWING_T__20_IN_write_statement_646 )
      if @state.backtracking == 0
        tree_for_char_literal70 = @adaptor.create_with_payload( char_literal70 )
        @adaptor.add_child( root_0, tree_for_char_literal70 )

      end

      @state.following.push( TOKENS_FOLLOWING_statement_end_IN_write_statement_648 )
      statement_end71 = statement_end
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
    # 110:1: write_expression : ( expression | STRING );
    #
    def write_expression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )


      return_value = WriteExpressionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __STRING73__ = nil
      expression72 = nil


      tree_for_STRING73 = nil

      begin
      # at line 111:5: ( expression | STRING )
      alt_18 = 2
      look_18_0 = @input.peek( 1 )

      if ( look_18_0.between?( BOOLEAN, INT ) || look_18_0 == T__19 || look_18_0 == T__23 )
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


        # at line 111:7: expression
        @state.following.push( TOKENS_FOLLOWING_expression_IN_write_expression_666 )
        expression72 = expression
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression72.tree )
        end


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 112:7: STRING
        __STRING73__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_write_expression_674 )
        if @state.backtracking == 0
          tree_for_STRING73 = @adaptor.create_with_payload( __STRING73__ )
          @adaptor.add_child( root_0, tree_for_STRING73 )

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
    # 115:1: loop_statement : 'do' exp 'times' block ;
    #
    def loop_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )


      return_value = LoopStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal74 = nil
      string_literal76 = nil
      exp75 = nil
      block77 = nil


      tree_for_string_literal74 = nil
      tree_for_string_literal76 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 116:7: 'do' exp 'times' block
      string_literal74 = match( T__36, TOKENS_FOLLOWING_T__36_IN_loop_statement_691 )
      if @state.backtracking == 0
        tree_for_string_literal74 = @adaptor.create_with_payload( string_literal74 )
        @adaptor.add_child( root_0, tree_for_string_literal74 )

      end

      @state.following.push( TOKENS_FOLLOWING_exp_IN_loop_statement_693 )
      exp75 = exp
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, exp75.tree )
      end

      string_literal76 = match( T__42, TOKENS_FOLLOWING_T__42_IN_loop_statement_695 )
      if @state.backtracking == 0
        tree_for_string_literal76 = @adaptor.create_with_payload( string_literal76 )
        @adaptor.add_child( root_0, tree_for_string_literal76 )

      end

      @state.following.push( TOKENS_FOLLOWING_block_IN_loop_statement_697 )
      block77 = block
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, block77.tree )
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
    # 119:1: function : 'def' VAR_TYPE variable_name function_parameters block ;
    #
    def function
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )


      return_value = FunctionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal78 = nil
      __VAR_TYPE79__ = nil
      variable_name80 = nil
      function_parameters81 = nil
      block82 = nil


      tree_for_string_literal78 = nil
      tree_for_VAR_TYPE79 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 120:7: 'def' VAR_TYPE variable_name function_parameters block
      string_literal78 = match( T__35, TOKENS_FOLLOWING_T__35_IN_function_714 )
      if @state.backtracking == 0
        tree_for_string_literal78 = @adaptor.create_with_payload( string_literal78 )
        @adaptor.add_child( root_0, tree_for_string_literal78 )

      end

      __VAR_TYPE79__ = match( VAR_TYPE, TOKENS_FOLLOWING_VAR_TYPE_IN_function_716 )
      if @state.backtracking == 0
        tree_for_VAR_TYPE79 = @adaptor.create_with_payload( __VAR_TYPE79__ )
        @adaptor.add_child( root_0, tree_for_VAR_TYPE79 )

      end

      @state.following.push( TOKENS_FOLLOWING_variable_name_IN_function_718 )
      variable_name80 = variable_name
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, variable_name80.tree )
      end

      @state.following.push( TOKENS_FOLLOWING_function_parameters_IN_function_720 )
      function_parameters81 = function_parameters
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, function_parameters81.tree )
      end

      @state.following.push( TOKENS_FOLLOWING_block_IN_function_722 )
      block82 = block
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, block82.tree )
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
    # 123:1: function_parameters : '(' ( parameters )? ')' ;
    #
    def function_parameters
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 23 )


      return_value = FunctionParametersReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal83 = nil
      char_literal85 = nil
      parameters84 = nil


      tree_for_char_literal83 = nil
      tree_for_char_literal85 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 124:7: '(' ( parameters )? ')'
      char_literal83 = match( T__19, TOKENS_FOLLOWING_T__19_IN_function_parameters_739 )
      if @state.backtracking == 0
        tree_for_char_literal83 = @adaptor.create_with_payload( char_literal83 )
        @adaptor.add_child( root_0, tree_for_char_literal83 )

      end

      # at line 124:11: ( parameters )?
      alt_19 = 2
      look_19_0 = @input.peek( 1 )

      if ( look_19_0 == VAR_TYPE )
        alt_19 = 1
      end
      case alt_19
      when 1
        # at line 124:11: parameters
        @state.following.push( TOKENS_FOLLOWING_parameters_IN_function_parameters_741 )
        parameters84 = parameters
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, parameters84.tree )
        end


      end
      char_literal85 = match( T__20, TOKENS_FOLLOWING_T__20_IN_function_parameters_744 )
      if @state.backtracking == 0
        tree_for_char_literal85 = @adaptor.create_with_payload( char_literal85 )
        @adaptor.add_child( root_0, tree_for_char_literal85 )

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
    # 127:1: parameters : VAR_TYPE variable_name ( ',' VAR_TYPE variable_name )* ;
    #
    def parameters
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )


      return_value = ParametersReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __VAR_TYPE86__ = nil
      char_literal88 = nil
      __VAR_TYPE89__ = nil
      variable_name87 = nil
      variable_name90 = nil


      tree_for_VAR_TYPE86 = nil
      tree_for_char_literal88 = nil
      tree_for_VAR_TYPE89 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 128:7: VAR_TYPE variable_name ( ',' VAR_TYPE variable_name )*
      __VAR_TYPE86__ = match( VAR_TYPE, TOKENS_FOLLOWING_VAR_TYPE_IN_parameters_761 )
      if @state.backtracking == 0
        tree_for_VAR_TYPE86 = @adaptor.create_with_payload( __VAR_TYPE86__ )
        @adaptor.add_child( root_0, tree_for_VAR_TYPE86 )

      end

      @state.following.push( TOKENS_FOLLOWING_variable_name_IN_parameters_763 )
      variable_name87 = variable_name
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, variable_name87.tree )
      end

      # at line 128:30: ( ',' VAR_TYPE variable_name )*
      while true # decision 20
        alt_20 = 2
        look_20_0 = @input.peek( 1 )

        if ( look_20_0 == T__22 )
          alt_20 = 1

        end
        case alt_20
        when 1
          # at line 128:31: ',' VAR_TYPE variable_name
          char_literal88 = match( T__22, TOKENS_FOLLOWING_T__22_IN_parameters_766 )
          if @state.backtracking == 0
            tree_for_char_literal88 = @adaptor.create_with_payload( char_literal88 )
            @adaptor.add_child( root_0, tree_for_char_literal88 )

          end

          __VAR_TYPE89__ = match( VAR_TYPE, TOKENS_FOLLOWING_VAR_TYPE_IN_parameters_768 )
          if @state.backtracking == 0
            tree_for_VAR_TYPE89 = @adaptor.create_with_payload( __VAR_TYPE89__ )
            @adaptor.add_child( root_0, tree_for_VAR_TYPE89 )

          end

          @state.following.push( TOKENS_FOLLOWING_variable_name_IN_parameters_770 )
          variable_name90 = variable_name
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, variable_name90.tree )
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

    VariableNameReturnValue = define_return_scope

    #
    # parser rule variable_name
    #
    # (in Rubik.g)
    # 133:1: variable_name : ID ;
    #
    def variable_name
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )


      return_value = VariableNameReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __ID91__ = nil


      tree_for_ID91 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 134:7: ID
      __ID91__ = match( ID, TOKENS_FOLLOWING_ID_IN_variable_name_791 )
      if @state.backtracking == 0
        tree_for_ID91 = @adaptor.create_with_payload( __ID91__ )
        @adaptor.add_child( root_0, tree_for_ID91 )

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

    PrimaryReturnValue = define_return_scope

    #
    # parser rule primary
    #
    # (in Rubik.g)
    # 139:1: primary : ( BOOLEAN | CHAR | FLOAT | INT | variable_name ( '[' expression ']' )? ( '[' expression ']' )? | variable_name ( '(' expression_list ')' ) );
    #
    def primary
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )


      return_value = PrimaryReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __BOOLEAN92__ = nil
      __CHAR93__ = nil
      __FLOAT94__ = nil
      __INT95__ = nil
      char_literal97 = nil
      char_literal99 = nil
      char_literal100 = nil
      char_literal102 = nil
      char_literal104 = nil
      char_literal106 = nil
      variable_name96 = nil
      expression98 = nil
      expression101 = nil
      variable_name103 = nil
      expression_list105 = nil


      tree_for_BOOLEAN92 = nil
      tree_for_CHAR93 = nil
      tree_for_FLOAT94 = nil
      tree_for_INT95 = nil
      tree_for_char_literal97 = nil
      tree_for_char_literal99 = nil
      tree_for_char_literal100 = nil
      tree_for_char_literal102 = nil
      tree_for_char_literal104 = nil
      tree_for_char_literal106 = nil

      begin
      # at line 140:5: ( BOOLEAN | CHAR | FLOAT | INT | variable_name ( '[' expression ']' )? ( '[' expression ']' )? | variable_name ( '(' expression_list ')' ) )
      alt_23 = 6
      case look_23 = @input.peek( 1 )
      when BOOLEAN then alt_23 = 1
      when CHAR then alt_23 = 2
      when FLOAT then alt_23 = 3
      when INT then alt_23 = 4
      when ID then look_23_5 = @input.peek( 2 )

      if ( look_23_5 == ID || look_23_5 == LBRACE || look_23_5.between?( PLUS, SEMI ) || look_23_5 == VAR_TYPE || look_23_5 == T__18 || look_23_5.between?( T__20, T__27 ) || look_23_5.between?( T__29, T__33 ) || look_23_5.between?( T__35, T__42 ) )
        alt_23 = 5
      elsif ( look_23_5 == T__19 )
        alt_23 = 6
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


        # at line 140:7: BOOLEAN
        __BOOLEAN92__ = match( BOOLEAN, TOKENS_FOLLOWING_BOOLEAN_IN_primary_810 )
        if @state.backtracking == 0
          tree_for_BOOLEAN92 = @adaptor.create_with_payload( __BOOLEAN92__ )
          @adaptor.add_child( root_0, tree_for_BOOLEAN92 )

        end


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 141:7: CHAR
        __CHAR93__ = match( CHAR, TOKENS_FOLLOWING_CHAR_IN_primary_818 )
        if @state.backtracking == 0
          tree_for_CHAR93 = @adaptor.create_with_payload( __CHAR93__ )
          @adaptor.add_child( root_0, tree_for_CHAR93 )

        end


      when 3
        root_0 = @adaptor.create_flat_list


        # at line 142:7: FLOAT
        __FLOAT94__ = match( FLOAT, TOKENS_FOLLOWING_FLOAT_IN_primary_826 )
        if @state.backtracking == 0
          tree_for_FLOAT94 = @adaptor.create_with_payload( __FLOAT94__ )
          @adaptor.add_child( root_0, tree_for_FLOAT94 )

        end


      when 4
        root_0 = @adaptor.create_flat_list


        # at line 143:7: INT
        __INT95__ = match( INT, TOKENS_FOLLOWING_INT_IN_primary_834 )
        if @state.backtracking == 0
          tree_for_INT95 = @adaptor.create_with_payload( __INT95__ )
          @adaptor.add_child( root_0, tree_for_INT95 )

        end


      when 5
        root_0 = @adaptor.create_flat_list


        # at line 144:7: variable_name ( '[' expression ']' )? ( '[' expression ']' )?
        @state.following.push( TOKENS_FOLLOWING_variable_name_IN_primary_842 )
        variable_name96 = variable_name
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, variable_name96.tree )
        end

        # at line 144:21: ( '[' expression ']' )?
        alt_21 = 2
        look_21_0 = @input.peek( 1 )

        if ( look_21_0 == T__32 )
          alt_21 = 1
        end
        case alt_21
        when 1
          # at line 144:22: '[' expression ']'
          char_literal97 = match( T__32, TOKENS_FOLLOWING_T__32_IN_primary_845 )
          if @state.backtracking == 0
            tree_for_char_literal97 = @adaptor.create_with_payload( char_literal97 )
            @adaptor.add_child( root_0, tree_for_char_literal97 )

          end

          @state.following.push( TOKENS_FOLLOWING_expression_IN_primary_847 )
          expression98 = expression
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, expression98.tree )
          end

          char_literal99 = match( T__33, TOKENS_FOLLOWING_T__33_IN_primary_849 )
          if @state.backtracking == 0
            tree_for_char_literal99 = @adaptor.create_with_payload( char_literal99 )
            @adaptor.add_child( root_0, tree_for_char_literal99 )

          end


        end
        # at line 144:43: ( '[' expression ']' )?
        alt_22 = 2
        look_22_0 = @input.peek( 1 )

        if ( look_22_0 == T__32 )
          alt_22 = 1
        end
        case alt_22
        when 1
          # at line 144:44: '[' expression ']'
          char_literal100 = match( T__32, TOKENS_FOLLOWING_T__32_IN_primary_854 )
          if @state.backtracking == 0
            tree_for_char_literal100 = @adaptor.create_with_payload( char_literal100 )
            @adaptor.add_child( root_0, tree_for_char_literal100 )

          end

          @state.following.push( TOKENS_FOLLOWING_expression_IN_primary_856 )
          expression101 = expression
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, expression101.tree )
          end

          char_literal102 = match( T__33, TOKENS_FOLLOWING_T__33_IN_primary_858 )
          if @state.backtracking == 0
            tree_for_char_literal102 = @adaptor.create_with_payload( char_literal102 )
            @adaptor.add_child( root_0, tree_for_char_literal102 )

          end


        end

      when 6
        root_0 = @adaptor.create_flat_list


        # at line 145:7: variable_name ( '(' expression_list ')' )
        @state.following.push( TOKENS_FOLLOWING_variable_name_IN_primary_868 )
        variable_name103 = variable_name
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, variable_name103.tree )
        end

        # at line 145:21: ( '(' expression_list ')' )
        # at line 145:22: '(' expression_list ')'
        char_literal104 = match( T__19, TOKENS_FOLLOWING_T__19_IN_primary_871 )
        if @state.backtracking == 0
          tree_for_char_literal104 = @adaptor.create_with_payload( char_literal104 )
          @adaptor.add_child( root_0, tree_for_char_literal104 )

        end

        @state.following.push( TOKENS_FOLLOWING_expression_list_IN_primary_873 )
        expression_list105 = expression_list
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression_list105.tree )
        end

        char_literal106 = match( T__20, TOKENS_FOLLOWING_T__20_IN_primary_875 )
        if @state.backtracking == 0
          tree_for_char_literal106 = @adaptor.create_with_payload( char_literal106 )
          @adaptor.add_child( root_0, tree_for_char_literal106 )

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

    #
    # syntactic predicate synpred1_Rubik
    #
    # (in Rubik.g)
    # 45:7: synpred1_Rubik : '}' ;
    #
    # This is an imaginary rule inserted by ANTLR to
    # implement a syntactic predicate decision
    #
    def synpred1_Rubik
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )


      # at line 45:9: '}'
      match( RBRACE, TOKENS_FOLLOWING_RBRACE_IN_synpred1_Rubik_237 )

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 27 )


    end


    TOKENS_FOLLOWING_T__34_IN_program_91 = Set[ 8, 10, 16, 35, 36, 39, 40, 41 ]
    TOKENS_FOLLOWING_block_IN_program_93 = Set[ 8, 10, 16, 35, 36, 38, 39, 40, 41 ]
    TOKENS_FOLLOWING_T__38_IN_program_96 = Set[ 1 ]
    TOKENS_FOLLOWING_statement_IN_block_113 = Set[ 1 ]
    TOKENS_FOLLOWING_statement_block_IN_block_121 = Set[ 1 ]
    TOKENS_FOLLOWING_LBRACE_IN_statement_block_138 = Set[ 8, 13, 16, 35, 36, 39, 40, 41 ]
    TOKENS_FOLLOWING_statement_IN_statement_block_140 = Set[ 8, 13, 16, 35, 36, 39, 40, 41 ]
    TOKENS_FOLLOWING_RBRACE_IN_statement_block_143 = Set[ 1 ]
    TOKENS_FOLLOWING_variable_statement_IN_statement_162 = Set[ 1 ]
    TOKENS_FOLLOWING_assignment_statement_IN_statement_170 = Set[ 1 ]
    TOKENS_FOLLOWING_condition_statement_IN_statement_178 = Set[ 1 ]
    TOKENS_FOLLOWING_write_statement_IN_statement_186 = Set[ 1 ]
    TOKENS_FOLLOWING_loop_statement_IN_statement_194 = Set[ 1 ]
    TOKENS_FOLLOWING_return_statement_IN_statement_202 = Set[ 1 ]
    TOKENS_FOLLOWING_function_IN_statement_210 = Set[ 1 ]
    TOKENS_FOLLOWING_SEMI_IN_statement_end_227 = Set[ 1 ]
    TOKENS_FOLLOWING_T__41_IN_return_statement_257 = Set[ 5, 6, 7, 8, 9, 19, 23 ]
    TOKENS_FOLLOWING_expression_IN_return_statement_259 = Set[ 14 ]
    TOKENS_FOLLOWING_statement_end_IN_return_statement_261 = Set[ 1 ]
    TOKENS_FOLLOWING_VAR_TYPE_IN_variable_statement_279 = Set[ 8 ]
    TOKENS_FOLLOWING_variable_declaration_list_IN_variable_statement_281 = Set[ 14 ]
    TOKENS_FOLLOWING_statement_end_IN_variable_statement_283 = Set[ 1 ]
    TOKENS_FOLLOWING_variable_declaration_IN_variable_declaration_list_301 = Set[ 1, 22 ]
    TOKENS_FOLLOWING_T__22_IN_variable_declaration_list_304 = Set[ 8 ]
    TOKENS_FOLLOWING_variable_declaration_IN_variable_declaration_list_306 = Set[ 1, 22 ]
    TOKENS_FOLLOWING_declaration_target_IN_variable_declaration_325 = Set[ 1, 28 ]
    TOKENS_FOLLOWING_T__28_IN_variable_declaration_328 = Set[ 5, 6, 7, 8, 9, 19, 23 ]
    TOKENS_FOLLOWING_expression_IN_variable_declaration_330 = Set[ 1 ]
    TOKENS_FOLLOWING_variable_name_IN_declaration_target_349 = Set[ 1, 32 ]
    TOKENS_FOLLOWING_T__32_IN_declaration_target_352 = Set[ 9 ]
    TOKENS_FOLLOWING_INT_IN_declaration_target_354 = Set[ 33 ]
    TOKENS_FOLLOWING_T__33_IN_declaration_target_356 = Set[ 1, 32 ]
    TOKENS_FOLLOWING_T__32_IN_declaration_target_361 = Set[ 9 ]
    TOKENS_FOLLOWING_INT_IN_declaration_target_363 = Set[ 33 ]
    TOKENS_FOLLOWING_T__33_IN_declaration_target_365 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_assignment_statement_384 = Set[ 28 ]
    TOKENS_FOLLOWING_T__28_IN_assignment_statement_386 = Set[ 5, 6, 7, 8, 9, 19, 23 ]
    TOKENS_FOLLOWING_expression_IN_assignment_statement_388 = Set[ 14 ]
    TOKENS_FOLLOWING_statement_end_IN_assignment_statement_390 = Set[ 1 ]
    TOKENS_FOLLOWING_T__39_IN_condition_statement_408 = Set[ 19 ]
    TOKENS_FOLLOWING_T__19_IN_condition_statement_410 = Set[ 5, 6, 7, 8, 9, 19, 23 ]
    TOKENS_FOLLOWING_expression_IN_condition_statement_412 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_condition_statement_414 = Set[ 8, 10, 16, 35, 36, 39, 40, 41 ]
    TOKENS_FOLLOWING_block_IN_condition_statement_416 = Set[ 1, 37 ]
    TOKENS_FOLLOWING_T__37_IN_condition_statement_419 = Set[ 8, 10, 16, 35, 36, 39, 40, 41 ]
    TOKENS_FOLLOWING_block_IN_condition_statement_421 = Set[ 1 ]
    TOKENS_FOLLOWING_exp_IN_expression_440 = Set[ 1, 18, 26, 27, 29, 30, 31 ]
    TOKENS_FOLLOWING_relation_op_IN_expression_443 = Set[ 5, 6, 7, 8, 9, 19, 23 ]
    TOKENS_FOLLOWING_exp_IN_expression_445 = Set[ 1 ]
    TOKENS_FOLLOWING_term_IN_exp_521 = Set[ 1, 12, 23 ]
    TOKENS_FOLLOWING_set_IN_exp_524 = Set[ 5, 6, 7, 8, 9, 19, 23 ]
    TOKENS_FOLLOWING_exp_IN_exp_530 = Set[ 1 ]
    TOKENS_FOLLOWING_factor_IN_term_549 = Set[ 1, 21, 25 ]
    TOKENS_FOLLOWING_set_IN_term_552 = Set[ 5, 6, 7, 8, 9, 19, 23 ]
    TOKENS_FOLLOWING_term_IN_term_558 = Set[ 1 ]
    TOKENS_FOLLOWING_T__19_IN_factor_577 = Set[ 5, 6, 7, 8, 9, 19, 23 ]
    TOKENS_FOLLOWING_expression_IN_factor_579 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_factor_581 = Set[ 1 ]
    TOKENS_FOLLOWING_T__23_IN_factor_589 = Set[ 5, 6, 7, 8, 9 ]
    TOKENS_FOLLOWING_primary_IN_factor_592 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_expression_list_609 = Set[ 1, 22 ]
    TOKENS_FOLLOWING_T__22_IN_expression_list_612 = Set[ 5, 6, 7, 8, 9, 19, 23 ]
    TOKENS_FOLLOWING_expression_IN_expression_list_614 = Set[ 1, 22 ]
    TOKENS_FOLLOWING_T__40_IN_write_statement_633 = Set[ 19 ]
    TOKENS_FOLLOWING_T__19_IN_write_statement_635 = Set[ 5, 6, 7, 8, 9, 15, 19, 23 ]
    TOKENS_FOLLOWING_write_expression_IN_write_statement_637 = Set[ 20, 24 ]
    TOKENS_FOLLOWING_T__24_IN_write_statement_640 = Set[ 5, 6, 7, 8, 9, 15, 19, 23 ]
    TOKENS_FOLLOWING_write_expression_IN_write_statement_642 = Set[ 20, 24 ]
    TOKENS_FOLLOWING_T__20_IN_write_statement_646 = Set[ 14 ]
    TOKENS_FOLLOWING_statement_end_IN_write_statement_648 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_write_expression_666 = Set[ 1 ]
    TOKENS_FOLLOWING_STRING_IN_write_expression_674 = Set[ 1 ]
    TOKENS_FOLLOWING_T__36_IN_loop_statement_691 = Set[ 5, 6, 7, 8, 9, 19, 23 ]
    TOKENS_FOLLOWING_exp_IN_loop_statement_693 = Set[ 42 ]
    TOKENS_FOLLOWING_T__42_IN_loop_statement_695 = Set[ 8, 10, 16, 35, 36, 39, 40, 41 ]
    TOKENS_FOLLOWING_block_IN_loop_statement_697 = Set[ 1 ]
    TOKENS_FOLLOWING_T__35_IN_function_714 = Set[ 16 ]
    TOKENS_FOLLOWING_VAR_TYPE_IN_function_716 = Set[ 8 ]
    TOKENS_FOLLOWING_variable_name_IN_function_718 = Set[ 19 ]
    TOKENS_FOLLOWING_function_parameters_IN_function_720 = Set[ 8, 10, 16, 35, 36, 39, 40, 41 ]
    TOKENS_FOLLOWING_block_IN_function_722 = Set[ 1 ]
    TOKENS_FOLLOWING_T__19_IN_function_parameters_739 = Set[ 16, 20 ]
    TOKENS_FOLLOWING_parameters_IN_function_parameters_741 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_function_parameters_744 = Set[ 1 ]
    TOKENS_FOLLOWING_VAR_TYPE_IN_parameters_761 = Set[ 8 ]
    TOKENS_FOLLOWING_variable_name_IN_parameters_763 = Set[ 1, 22 ]
    TOKENS_FOLLOWING_T__22_IN_parameters_766 = Set[ 16 ]
    TOKENS_FOLLOWING_VAR_TYPE_IN_parameters_768 = Set[ 8 ]
    TOKENS_FOLLOWING_variable_name_IN_parameters_770 = Set[ 1, 22 ]
    TOKENS_FOLLOWING_ID_IN_variable_name_791 = Set[ 1 ]
    TOKENS_FOLLOWING_BOOLEAN_IN_primary_810 = Set[ 1 ]
    TOKENS_FOLLOWING_CHAR_IN_primary_818 = Set[ 1 ]
    TOKENS_FOLLOWING_FLOAT_IN_primary_826 = Set[ 1 ]
    TOKENS_FOLLOWING_INT_IN_primary_834 = Set[ 1 ]
    TOKENS_FOLLOWING_variable_name_IN_primary_842 = Set[ 1, 32 ]
    TOKENS_FOLLOWING_T__32_IN_primary_845 = Set[ 5, 6, 7, 8, 9, 19, 23 ]
    TOKENS_FOLLOWING_expression_IN_primary_847 = Set[ 33 ]
    TOKENS_FOLLOWING_T__33_IN_primary_849 = Set[ 1, 32 ]
    TOKENS_FOLLOWING_T__32_IN_primary_854 = Set[ 5, 6, 7, 8, 9, 19, 23 ]
    TOKENS_FOLLOWING_expression_IN_primary_856 = Set[ 33 ]
    TOKENS_FOLLOWING_T__33_IN_primary_858 = Set[ 1 ]
    TOKENS_FOLLOWING_variable_name_IN_primary_868 = Set[ 19 ]
    TOKENS_FOLLOWING_T__19_IN_primary_871 = Set[ 5, 6, 7, 8, 9, 19, 23 ]
    TOKENS_FOLLOWING_expression_list_IN_primary_873 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_primary_875 = Set[ 1 ]
    TOKENS_FOLLOWING_RBRACE_IN_synpred1_Rubik_237 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0

end
