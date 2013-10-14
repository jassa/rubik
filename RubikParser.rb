#!/usr/bin/env ruby
#
# Rubik.g
# --
# Generated using ANTLR version: 3.5
# Ruby runtime library version: 1.10.0
# Input grammar file: Rubik.g
# Generated at: 2013-10-13 22:58:47
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

    @@global = Scope("variable_type" )


    @@block = Scope("symbols" )

    include TokenData

    begin
      generated_using( "Rubik.g", "3.5", "1.10.0" )
    rescue NoMethodError => error
      # ignore
    end

    def initialize( input, options = {} )
      super( input, options )
      @global_stack = []

    @block_stack = []

    end
    # - - - - - - - - - - - - Rules - - - - - - - - - - - - -
    ProgramReturnValue = define_return_scope

    #
    # parser rule program
    #
    # (in Rubik.g)
    # 22:1: program : 'begin' ( block )+ 'end' ;
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


      # at line 23:7: 'begin' ( block )+ 'end'
      string_literal1 = match( T__34, TOKENS_FOLLOWING_T__34_IN_program_98 )
      if @state.backtracking == 0
        tree_for_string_literal1 = @adaptor.create_with_payload( string_literal1 )
        @adaptor.add_child( root_0, tree_for_string_literal1 )

      end

      # at file 23:15: ( block )+
      match_count_1 = 0
      while true
        alt_1 = 2
        look_1_0 = @input.peek( 1 )

        if ( look_1_0 == ID || look_1_0 == LBRACE || look_1_0 == VAR_TYPE || look_1_0.between?( T__35, T__36 ) || look_1_0.between?( T__39, T__41 ) )
          alt_1 = 1

        end
        case alt_1
        when 1
          # at line 23:15: block
          @state.following.push( TOKENS_FOLLOWING_block_IN_program_100 )
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


      string_literal3 = match( T__38, TOKENS_FOLLOWING_T__38_IN_program_103 )
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
    # 26:1: block : ( statement | statement_block );
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
      # at line 33:5: ( statement | statement_block )
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


        # at line 33:7: statement
        @state.following.push( TOKENS_FOLLOWING_statement_IN_block_129 )
        statement4 = statement
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, statement4.tree )
        end


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 34:7: statement_block
        @state.following.push( TOKENS_FOLLOWING_statement_block_IN_block_137 )
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
    # 37:1: statement_block : '{' ( statement )* '}' ;
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


      # at line 38:7: '{' ( statement )* '}'
      char_literal6 = match( LBRACE, TOKENS_FOLLOWING_LBRACE_IN_statement_block_154 )
      if @state.backtracking == 0
        tree_for_char_literal6 = @adaptor.create_with_payload( char_literal6 )
        @adaptor.add_child( root_0, tree_for_char_literal6 )

      end

      # at line 38:11: ( statement )*
      while true # decision 3
        alt_3 = 2
        look_3_0 = @input.peek( 1 )

        if ( look_3_0 == ID || look_3_0 == VAR_TYPE || look_3_0.between?( T__35, T__36 ) || look_3_0.between?( T__39, T__41 ) )
          alt_3 = 1

        end
        case alt_3
        when 1
          # at line 38:11: statement
          @state.following.push( TOKENS_FOLLOWING_statement_IN_statement_block_156 )
          statement7 = statement
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, statement7.tree )
          end


        else
          break # out of loop for decision 3
        end
      end # loop for decision 3

      char_literal8 = match( RBRACE, TOKENS_FOLLOWING_RBRACE_IN_statement_block_159 )
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
    # 43:1: statement : ( variable_statement | assignment_statement | condition_statement | write_statement | loop_statement | return_statement | function );
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
      # at line 44:5: ( variable_statement | assignment_statement | condition_statement | write_statement | loop_statement | return_statement | function )
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


        # at line 44:7: variable_statement
        @state.following.push( TOKENS_FOLLOWING_variable_statement_IN_statement_178 )
        variable_statement9 = variable_statement
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, variable_statement9.tree )
        end


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 45:7: assignment_statement
        @state.following.push( TOKENS_FOLLOWING_assignment_statement_IN_statement_186 )
        assignment_statement10 = assignment_statement
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, assignment_statement10.tree )
        end


      when 3
        root_0 = @adaptor.create_flat_list


        # at line 46:7: condition_statement
        @state.following.push( TOKENS_FOLLOWING_condition_statement_IN_statement_194 )
        condition_statement11 = condition_statement
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, condition_statement11.tree )
        end


      when 4
        root_0 = @adaptor.create_flat_list


        # at line 47:7: write_statement
        @state.following.push( TOKENS_FOLLOWING_write_statement_IN_statement_202 )
        write_statement12 = write_statement
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, write_statement12.tree )
        end


      when 5
        root_0 = @adaptor.create_flat_list


        # at line 48:7: loop_statement
        @state.following.push( TOKENS_FOLLOWING_loop_statement_IN_statement_210 )
        loop_statement13 = loop_statement
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, loop_statement13.tree )
        end


      when 6
        root_0 = @adaptor.create_flat_list


        # at line 49:7: return_statement
        @state.following.push( TOKENS_FOLLOWING_return_statement_IN_statement_218 )
        return_statement14 = return_statement
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, return_statement14.tree )
        end


      when 7
        root_0 = @adaptor.create_flat_list


        # at line 50:7: function
        @state.following.push( TOKENS_FOLLOWING_function_IN_statement_226 )
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
    # 53:1: statement_end : ( ';' | ( '}' )=>| EOF );
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
      # at line 54:5: ( ';' | ( '}' )=>| EOF )
      alt_5 = 3
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
      elsif ( look_5_0 == EOF )
        alt_5 = 3
      else
        @state.backtracking > 0 and raise( ANTLR3::Error::BacktrackingFailed )



        raise NoViableAlternative( "", 5, 0 )

      end
      case alt_5
      when 1
        root_0 = @adaptor.create_flat_list


        # at line 54:7: ';'
        char_literal16 = match( SEMI, TOKENS_FOLLOWING_SEMI_IN_statement_end_243 )
        if @state.backtracking == 0
          tree_for_char_literal16 = @adaptor.create_with_payload( char_literal16 )
          @adaptor.add_child( root_0, tree_for_char_literal16 )

        end


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 55:7: ( '}' )=>

      when 3
        root_0 = @adaptor.create_flat_list


        # at line 56:7: EOF
        __EOF17__ = match( EOF, TOKENS_FOLLOWING_EOF_IN_statement_end_264 )
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
    # 59:1: return_statement : 'return' expression statement_end !;
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


      # at line 60:7: 'return' expression statement_end !
      string_literal18 = match( T__41, TOKENS_FOLLOWING_T__41_IN_return_statement_281 )
      if @state.backtracking == 0
        tree_for_string_literal18 = @adaptor.create_with_payload( string_literal18 )
        @adaptor.add_child( root_0, tree_for_string_literal18 )

      end

      @state.following.push( TOKENS_FOLLOWING_expression_IN_return_statement_283 )
      expression19 = expression
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, expression19.tree )
      end

      @state.following.push( TOKENS_FOLLOWING_statement_end_IN_return_statement_285 )
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
    # 63:1: variable_statement : VAR_TYPE variable_declaration_list statement_end !;
    #
    def variable_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 7 )


      @global_stack.push( @@global.new )

      return_value = VariableStatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __VAR_TYPE21__ = nil
      variable_declaration_list22 = nil
      statement_end23 = nil


      tree_for_VAR_TYPE21 = nil

      # - - - - @init action - - - -

          @global_stack.last.variable_type = nil



      begin
      root_0 = @adaptor.create_flat_list


      # at line 68:7: VAR_TYPE variable_declaration_list statement_end !
      __VAR_TYPE21__ = match( VAR_TYPE, TOKENS_FOLLOWING_VAR_TYPE_IN_variable_statement_313 )
      if @state.backtracking == 0
        tree_for_VAR_TYPE21 = @adaptor.create_with_payload( __VAR_TYPE21__ )
        @adaptor.add_child( root_0, tree_for_VAR_TYPE21 )

      end

      @state.following.push( TOKENS_FOLLOWING_variable_declaration_list_IN_variable_statement_315 )
      variable_declaration_list22 = variable_declaration_list
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, variable_declaration_list22.tree )
      end

      @state.following.push( TOKENS_FOLLOWING_statement_end_IN_variable_statement_317 )
      statement_end23 = statement_end
      @state.following.pop

      # syntactic predicate action gate test
      if @state.backtracking == 0
        # --> action
         @global_stack.last.variable_type = __VAR_TYPE21__.text 
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
        # trace_out( __method__, 7 )

      @global_stack.pop

      end

      return return_value
    end

    VariableDeclarationListReturnValue = define_return_scope

    #
    # parser rule variable_declaration_list
    #
    # (in Rubik.g)
    # 72:1: variable_declaration_list : variable_declaration ( ',' variable_declaration )* ;
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


      # at line 73:7: variable_declaration ( ',' variable_declaration )*
      @state.following.push( TOKENS_FOLLOWING_variable_declaration_IN_variable_declaration_list_345 )
      variable_declaration24 = variable_declaration
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, variable_declaration24.tree )
      end

      # at line 73:28: ( ',' variable_declaration )*
      while true # decision 6
        alt_6 = 2
        look_6_0 = @input.peek( 1 )

        if ( look_6_0 == T__22 )
          alt_6 = 1

        end
        case alt_6
        when 1
          # at line 73:29: ',' variable_declaration
          char_literal25 = match( T__22, TOKENS_FOLLOWING_T__22_IN_variable_declaration_list_348 )
          if @state.backtracking == 0
            tree_for_char_literal25 = @adaptor.create_with_payload( char_literal25 )
            @adaptor.add_child( root_0, tree_for_char_literal25 )

          end

          @state.following.push( TOKENS_FOLLOWING_variable_declaration_IN_variable_declaration_list_350 )
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
    # 76:1: variable_declaration : declaration_target ( '=' expression )? ;
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


      # at line 77:7: declaration_target ( '=' expression )?
      @state.following.push( TOKENS_FOLLOWING_declaration_target_IN_variable_declaration_369 )
      declaration_target27 = declaration_target
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, declaration_target27.tree )
      end

      # at line 77:26: ( '=' expression )?
      alt_7 = 2
      look_7_0 = @input.peek( 1 )

      if ( look_7_0 == T__28 )
        alt_7 = 1
      end
      case alt_7
      when 1
        # at line 77:27: '=' expression
        char_literal28 = match( T__28, TOKENS_FOLLOWING_T__28_IN_variable_declaration_372 )
        if @state.backtracking == 0
          tree_for_char_literal28 = @adaptor.create_with_payload( char_literal28 )
          @adaptor.add_child( root_0, tree_for_char_literal28 )

        end

        @state.following.push( TOKENS_FOLLOWING_expression_IN_variable_declaration_374 )
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
    # 80:1: declaration_target : variable_name ( '[' INT ']' )? ( '[' INT ']' )? ;
    #
    def declaration_target
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 10 )


      @global_stack.push( @@global.new )

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


      # at line 82:7: variable_name ( '[' INT ']' )? ( '[' INT ']' )?
      @state.following.push( TOKENS_FOLLOWING_variable_name_IN_declaration_target_398 )
      variable_name30 = variable_name
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, variable_name30.tree )
      end

      # at line 82:21: ( '[' INT ']' )?
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
        # at line 82:22: '[' INT ']'
        char_literal31 = match( T__32, TOKENS_FOLLOWING_T__32_IN_declaration_target_401 )
        if @state.backtracking == 0
          tree_for_char_literal31 = @adaptor.create_with_payload( char_literal31 )
          @adaptor.add_child( root_0, tree_for_char_literal31 )

        end

        __INT32__ = match( INT, TOKENS_FOLLOWING_INT_IN_declaration_target_403 )
        if @state.backtracking == 0
          tree_for_INT32 = @adaptor.create_with_payload( __INT32__ )
          @adaptor.add_child( root_0, tree_for_INT32 )

        end

        char_literal33 = match( T__33, TOKENS_FOLLOWING_T__33_IN_declaration_target_405 )
        if @state.backtracking == 0
          tree_for_char_literal33 = @adaptor.create_with_payload( char_literal33 )
          @adaptor.add_child( root_0, tree_for_char_literal33 )

        end


      end
      # at line 82:36: ( '[' INT ']' )?
      alt_9 = 2
      look_9_0 = @input.peek( 1 )

      if ( look_9_0 == T__32 )
        alt_9 = 1
      end
      case alt_9
      when 1
        # at line 82:37: '[' INT ']'
        char_literal34 = match( T__32, TOKENS_FOLLOWING_T__32_IN_declaration_target_410 )
        if @state.backtracking == 0
          tree_for_char_literal34 = @adaptor.create_with_payload( char_literal34 )
          @adaptor.add_child( root_0, tree_for_char_literal34 )

        end

        __INT35__ = match( INT, TOKENS_FOLLOWING_INT_IN_declaration_target_412 )
        if @state.backtracking == 0
          tree_for_INT35 = @adaptor.create_with_payload( __INT35__ )
          @adaptor.add_child( root_0, tree_for_INT35 )

        end

        char_literal36 = match( T__33, TOKENS_FOLLOWING_T__33_IN_declaration_target_414 )
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
                      @block_stack.last.symbols[var] = @global_stack.last.variable_type
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

      @global_stack.pop

      end

      return return_value
    end

    AssignmentStatementReturnValue = define_return_scope

    #
    # parser rule assignment_statement
    #
    # (in Rubik.g)
    # 92:1: assignment_statement : ID '=' expression statement_end !;
    #
    def assignment_statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 11 )


      @global_stack.push( @@global.new )

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


      # at line 94:7: ID '=' expression statement_end !
      __ID37__ = match( ID, TOKENS_FOLLOWING_ID_IN_assignment_statement_448 )
      if @state.backtracking == 0
        tree_for_ID37 = @adaptor.create_with_payload( __ID37__ )
        @adaptor.add_child( root_0, tree_for_ID37 )

      end

      char_literal38 = match( T__28, TOKENS_FOLLOWING_T__28_IN_assignment_statement_450 )
      if @state.backtracking == 0
        tree_for_char_literal38 = @adaptor.create_with_payload( char_literal38 )
        @adaptor.add_child( root_0, tree_for_char_literal38 )

      end

      @state.following.push( TOKENS_FOLLOWING_expression_IN_assignment_statement_452 )
      expression39 = expression
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, expression39.tree )
      end

      @state.following.push( TOKENS_FOLLOWING_statement_end_IN_assignment_statement_454 )
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

      @global_stack.pop

      end

      return return_value
    end

    ConditionStatementReturnValue = define_return_scope

    #
    # parser rule condition_statement
    #
    # (in Rubik.g)
    # 102:1: condition_statement : 'if' '(' expression ')' block ( 'else' block )? ;
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


      # at line 103:7: 'if' '(' expression ')' block ( 'else' block )?
      string_literal41 = match( T__39, TOKENS_FOLLOWING_T__39_IN_condition_statement_482 )
      if @state.backtracking == 0
        tree_for_string_literal41 = @adaptor.create_with_payload( string_literal41 )
        @adaptor.add_child( root_0, tree_for_string_literal41 )

      end

      char_literal42 = match( T__19, TOKENS_FOLLOWING_T__19_IN_condition_statement_484 )
      if @state.backtracking == 0
        tree_for_char_literal42 = @adaptor.create_with_payload( char_literal42 )
        @adaptor.add_child( root_0, tree_for_char_literal42 )

      end

      @state.following.push( TOKENS_FOLLOWING_expression_IN_condition_statement_486 )
      expression43 = expression
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, expression43.tree )
      end

      char_literal44 = match( T__20, TOKENS_FOLLOWING_T__20_IN_condition_statement_488 )
      if @state.backtracking == 0
        tree_for_char_literal44 = @adaptor.create_with_payload( char_literal44 )
        @adaptor.add_child( root_0, tree_for_char_literal44 )

      end

      @state.following.push( TOKENS_FOLLOWING_block_IN_condition_statement_490 )
      block45 = block
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, block45.tree )
      end

      # at line 103:37: ( 'else' block )?
      alt_10 = 2
      look_10_0 = @input.peek( 1 )

      if ( look_10_0 == T__37 )
        alt_10 = 1
      end
      case alt_10
      when 1
        # at line 103:38: 'else' block
        string_literal46 = match( T__37, TOKENS_FOLLOWING_T__37_IN_condition_statement_493 )
        if @state.backtracking == 0
          tree_for_string_literal46 = @adaptor.create_with_payload( string_literal46 )
          @adaptor.add_child( root_0, tree_for_string_literal46 )

        end

        @state.following.push( TOKENS_FOLLOWING_block_IN_condition_statement_495 )
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
    # 106:1: expression : exp ( relation_op exp )? ;
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


      # at line 107:7: exp ( relation_op exp )?
      @state.following.push( TOKENS_FOLLOWING_exp_IN_expression_514 )
      exp48 = exp
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, exp48.tree )
      end

      # at line 107:11: ( relation_op exp )?
      alt_11 = 2
      look_11_0 = @input.peek( 1 )

      if ( look_11_0 == T__18 || look_11_0.between?( T__26, T__27 ) || look_11_0.between?( T__29, T__31 ) )
        alt_11 = 1
      end
      case alt_11
      when 1
        # at line 107:12: relation_op exp
        @state.following.push( TOKENS_FOLLOWING_relation_op_IN_expression_517 )
        relation_op49 = relation_op
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, relation_op49.tree )
        end

        @state.following.push( TOKENS_FOLLOWING_exp_IN_expression_519 )
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
    # 110:1: relation_op : ( '<' | '>' | '<=' | '>=' | '==' | '!=' );
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

      if @input.peek(1) == T__18 || @input.peek( 1 ).between?( T__26, T__27 ) || @input.peek( 1 ).between?( T__29, T__31 )
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
    # 119:1: exp : term ( ( '+' | '-' ) exp )? ;
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


      # at line 120:7: term ( ( '+' | '-' ) exp )?
      @state.following.push( TOKENS_FOLLOWING_term_IN_exp_595 )
      term52 = term
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, term52.tree )
      end

      # at line 120:12: ( ( '+' | '-' ) exp )?
      alt_12 = 2
      look_12_0 = @input.peek( 1 )

      if ( look_12_0 == PLUS || look_12_0 == T__23 )
        alt_12 = 1
      end
      case alt_12
      when 1
        # at line 120:13: ( '+' | '-' ) exp
        set53 = @input.look

        if @input.peek(1) == PLUS || @input.peek(1) == T__23
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


        @state.following.push( TOKENS_FOLLOWING_exp_IN_exp_604 )
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
    # 123:1: term : factor ( ( '*' | '/' ) term )? ;
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


      # at line 124:7: factor ( ( '*' | '/' ) term )?
      @state.following.push( TOKENS_FOLLOWING_factor_IN_term_623 )
      factor55 = factor
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, factor55.tree )
      end

      # at line 124:14: ( ( '*' | '/' ) term )?
      alt_13 = 2
      look_13_0 = @input.peek( 1 )

      if ( look_13_0 == T__21 || look_13_0 == T__25 )
        alt_13 = 1
      end
      case alt_13
      when 1
        # at line 124:15: ( '*' | '/' ) term
        set56 = @input.look

        if @input.peek(1) == T__21 || @input.peek(1) == T__25
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


        @state.following.push( TOKENS_FOLLOWING_term_IN_term_632 )
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
    # 127:1: factor : ( '(' expression ')' | ( '-' )? primary );
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
      # at line 128:5: ( '(' expression ')' | ( '-' )? primary )
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


        # at line 128:7: '(' expression ')'
        char_literal58 = match( T__19, TOKENS_FOLLOWING_T__19_IN_factor_651 )
        if @state.backtracking == 0
          tree_for_char_literal58 = @adaptor.create_with_payload( char_literal58 )
          @adaptor.add_child( root_0, tree_for_char_literal58 )

        end

        @state.following.push( TOKENS_FOLLOWING_expression_IN_factor_653 )
        expression59 = expression
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression59.tree )
        end

        char_literal60 = match( T__20, TOKENS_FOLLOWING_T__20_IN_factor_655 )
        if @state.backtracking == 0
          tree_for_char_literal60 = @adaptor.create_with_payload( char_literal60 )
          @adaptor.add_child( root_0, tree_for_char_literal60 )

        end


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 129:7: ( '-' )? primary
        # at line 129:7: ( '-' )?
        alt_14 = 2
        look_14_0 = @input.peek( 1 )

        if ( look_14_0 == T__23 )
          alt_14 = 1
        end
        case alt_14
        when 1
          # at line 129:7: '-'
          char_literal61 = match( T__23, TOKENS_FOLLOWING_T__23_IN_factor_663 )
          if @state.backtracking == 0
            tree_for_char_literal61 = @adaptor.create_with_payload( char_literal61 )
            @adaptor.add_child( root_0, tree_for_char_literal61 )

          end


        end
        @state.following.push( TOKENS_FOLLOWING_primary_IN_factor_666 )
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
    # 132:1: expression_list : expression ( ',' expression )* ;
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


      # at line 133:7: expression ( ',' expression )*
      @state.following.push( TOKENS_FOLLOWING_expression_IN_expression_list_683 )
      expression63 = expression
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, expression63.tree )
      end

      # at line 133:18: ( ',' expression )*
      while true # decision 16
        alt_16 = 2
        look_16_0 = @input.peek( 1 )

        if ( look_16_0 == T__22 )
          alt_16 = 1

        end
        case alt_16
        when 1
          # at line 133:19: ',' expression
          char_literal64 = match( T__22, TOKENS_FOLLOWING_T__22_IN_expression_list_686 )
          if @state.backtracking == 0
            tree_for_char_literal64 = @adaptor.create_with_payload( char_literal64 )
            @adaptor.add_child( root_0, tree_for_char_literal64 )

          end

          @state.following.push( TOKENS_FOLLOWING_expression_IN_expression_list_688 )
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
    # 136:1: write_statement : 'print' '(' write_expression ( '.' write_expression )* ')' statement_end !;
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


      # at line 137:7: 'print' '(' write_expression ( '.' write_expression )* ')' statement_end !
      string_literal66 = match( T__40, TOKENS_FOLLOWING_T__40_IN_write_statement_707 )
      if @state.backtracking == 0
        tree_for_string_literal66 = @adaptor.create_with_payload( string_literal66 )
        @adaptor.add_child( root_0, tree_for_string_literal66 )

      end

      char_literal67 = match( T__19, TOKENS_FOLLOWING_T__19_IN_write_statement_709 )
      if @state.backtracking == 0
        tree_for_char_literal67 = @adaptor.create_with_payload( char_literal67 )
        @adaptor.add_child( root_0, tree_for_char_literal67 )

      end

      @state.following.push( TOKENS_FOLLOWING_write_expression_IN_write_statement_711 )
      write_expression68 = write_expression
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, write_expression68.tree )
      end

      # at line 137:36: ( '.' write_expression )*
      while true # decision 17
        alt_17 = 2
        look_17_0 = @input.peek( 1 )

        if ( look_17_0 == T__24 )
          alt_17 = 1

        end
        case alt_17
        when 1
          # at line 137:37: '.' write_expression
          char_literal69 = match( T__24, TOKENS_FOLLOWING_T__24_IN_write_statement_714 )
          if @state.backtracking == 0
            tree_for_char_literal69 = @adaptor.create_with_payload( char_literal69 )
            @adaptor.add_child( root_0, tree_for_char_literal69 )

          end

          @state.following.push( TOKENS_FOLLOWING_write_expression_IN_write_statement_716 )
          write_expression70 = write_expression
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, write_expression70.tree )
          end


        else
          break # out of loop for decision 17
        end
      end # loop for decision 17

      char_literal71 = match( T__20, TOKENS_FOLLOWING_T__20_IN_write_statement_720 )
      if @state.backtracking == 0
        tree_for_char_literal71 = @adaptor.create_with_payload( char_literal71 )
        @adaptor.add_child( root_0, tree_for_char_literal71 )

      end

      @state.following.push( TOKENS_FOLLOWING_statement_end_IN_write_statement_722 )
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
    # 140:1: write_expression : ( expression | STRING );
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
      # at line 141:5: ( expression | STRING )
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


        # at line 141:7: expression
        @state.following.push( TOKENS_FOLLOWING_expression_IN_write_expression_740 )
        expression73 = expression
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression73.tree )
        end


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 142:7: STRING
        __STRING74__ = match( STRING, TOKENS_FOLLOWING_STRING_IN_write_expression_748 )
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
    # 145:1: loop_statement : 'do' exp 'times' block ;
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


      # at line 146:7: 'do' exp 'times' block
      string_literal75 = match( T__36, TOKENS_FOLLOWING_T__36_IN_loop_statement_765 )
      if @state.backtracking == 0
        tree_for_string_literal75 = @adaptor.create_with_payload( string_literal75 )
        @adaptor.add_child( root_0, tree_for_string_literal75 )

      end

      @state.following.push( TOKENS_FOLLOWING_exp_IN_loop_statement_767 )
      exp76 = exp
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, exp76.tree )
      end

      string_literal77 = match( T__42, TOKENS_FOLLOWING_T__42_IN_loop_statement_769 )
      if @state.backtracking == 0
        tree_for_string_literal77 = @adaptor.create_with_payload( string_literal77 )
        @adaptor.add_child( root_0, tree_for_string_literal77 )

      end

      @state.following.push( TOKENS_FOLLOWING_block_IN_loop_statement_771 )
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
    # 149:1: function : 'def' VAR_TYPE variable_name function_parameters block ;
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


      # at line 150:7: 'def' VAR_TYPE variable_name function_parameters block
      string_literal79 = match( T__35, TOKENS_FOLLOWING_T__35_IN_function_788 )
      if @state.backtracking == 0
        tree_for_string_literal79 = @adaptor.create_with_payload( string_literal79 )
        @adaptor.add_child( root_0, tree_for_string_literal79 )

      end

      __VAR_TYPE80__ = match( VAR_TYPE, TOKENS_FOLLOWING_VAR_TYPE_IN_function_790 )
      if @state.backtracking == 0
        tree_for_VAR_TYPE80 = @adaptor.create_with_payload( __VAR_TYPE80__ )
        @adaptor.add_child( root_0, tree_for_VAR_TYPE80 )

      end

      @state.following.push( TOKENS_FOLLOWING_variable_name_IN_function_792 )
      variable_name81 = variable_name
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, variable_name81.tree )
      end

      @state.following.push( TOKENS_FOLLOWING_function_parameters_IN_function_794 )
      function_parameters82 = function_parameters
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, function_parameters82.tree )
      end

      @state.following.push( TOKENS_FOLLOWING_block_IN_function_796 )
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
                      raise "'void' should not have return statement" if has_return
                    else
                      unless has_return
                        raise "expected return statement for '#{__VAR_TYPE80__.text}'"
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
    # 163:1: function_parameters : '(' ( parameters )? ')' ;
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


      # at line 164:7: '(' ( parameters )? ')'
      char_literal84 = match( T__19, TOKENS_FOLLOWING_T__19_IN_function_parameters_823 )
      if @state.backtracking == 0
        tree_for_char_literal84 = @adaptor.create_with_payload( char_literal84 )
        @adaptor.add_child( root_0, tree_for_char_literal84 )

      end

      # at line 164:11: ( parameters )?
      alt_19 = 2
      look_19_0 = @input.peek( 1 )

      if ( look_19_0 == VAR_TYPE )
        alt_19 = 1
      end
      case alt_19
      when 1
        # at line 164:11: parameters
        @state.following.push( TOKENS_FOLLOWING_parameters_IN_function_parameters_825 )
        parameters85 = parameters
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, parameters85.tree )
        end


      end
      char_literal86 = match( T__20, TOKENS_FOLLOWING_T__20_IN_function_parameters_828 )
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
    # 167:1: parameters : VAR_TYPE variable_name ( ',' VAR_TYPE variable_name )* ;
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


      # at line 168:7: VAR_TYPE variable_name ( ',' VAR_TYPE variable_name )*
      __VAR_TYPE87__ = match( VAR_TYPE, TOKENS_FOLLOWING_VAR_TYPE_IN_parameters_845 )
      if @state.backtracking == 0
        tree_for_VAR_TYPE87 = @adaptor.create_with_payload( __VAR_TYPE87__ )
        @adaptor.add_child( root_0, tree_for_VAR_TYPE87 )

      end

      @state.following.push( TOKENS_FOLLOWING_variable_name_IN_parameters_847 )
      variable_name88 = variable_name
      @state.following.pop
      if @state.backtracking == 0
        @adaptor.add_child( root_0, variable_name88.tree )
      end

      # at line 168:30: ( ',' VAR_TYPE variable_name )*
      while true # decision 20
        alt_20 = 2
        look_20_0 = @input.peek( 1 )

        if ( look_20_0 == T__22 )
          alt_20 = 1

        end
        case alt_20
        when 1
          # at line 168:31: ',' VAR_TYPE variable_name
          char_literal89 = match( T__22, TOKENS_FOLLOWING_T__22_IN_parameters_850 )
          if @state.backtracking == 0
            tree_for_char_literal89 = @adaptor.create_with_payload( char_literal89 )
            @adaptor.add_child( root_0, tree_for_char_literal89 )

          end

          __VAR_TYPE90__ = match( VAR_TYPE, TOKENS_FOLLOWING_VAR_TYPE_IN_parameters_852 )
          if @state.backtracking == 0
            tree_for_VAR_TYPE90 = @adaptor.create_with_payload( __VAR_TYPE90__ )
            @adaptor.add_child( root_0, tree_for_VAR_TYPE90 )

          end

          @state.following.push( TOKENS_FOLLOWING_variable_name_IN_parameters_854 )
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

    VariableNameReturnValue = define_return_scope

    #
    # parser rule variable_name
    #
    # (in Rubik.g)
    # 173:1: variable_name : ID ;
    #
    def variable_name
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )


      return_value = VariableNameReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __ID92__ = nil


      tree_for_ID92 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 174:7: ID
      __ID92__ = match( ID, TOKENS_FOLLOWING_ID_IN_variable_name_875 )
      if @state.backtracking == 0
        tree_for_ID92 = @adaptor.create_with_payload( __ID92__ )
        @adaptor.add_child( root_0, tree_for_ID92 )

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
    # 179:1: primary : ( BOOLEAN | CHAR | FLOAT | INT | variable_name ( '[' expression ']' )? ( '[' expression ']' )? | variable_name ( '(' expression_list ')' ) );
    #
    def primary
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )


      return_value = PrimaryReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __BOOLEAN93__ = nil
      __CHAR94__ = nil
      __FLOAT95__ = nil
      __INT96__ = nil
      char_literal98 = nil
      char_literal100 = nil
      char_literal101 = nil
      char_literal103 = nil
      char_literal105 = nil
      char_literal107 = nil
      variable_name97 = nil
      expression99 = nil
      expression102 = nil
      variable_name104 = nil
      expression_list106 = nil


      tree_for_BOOLEAN93 = nil
      tree_for_CHAR94 = nil
      tree_for_FLOAT95 = nil
      tree_for_INT96 = nil
      tree_for_char_literal98 = nil
      tree_for_char_literal100 = nil
      tree_for_char_literal101 = nil
      tree_for_char_literal103 = nil
      tree_for_char_literal105 = nil
      tree_for_char_literal107 = nil

      begin
      # at line 180:5: ( BOOLEAN | CHAR | FLOAT | INT | variable_name ( '[' expression ']' )? ( '[' expression ']' )? | variable_name ( '(' expression_list ')' ) )
      alt_23 = 6
      case look_23 = @input.peek( 1 )
      when BOOLEAN then alt_23 = 1
      when CHAR then alt_23 = 2
      when FLOAT then alt_23 = 3
      when INT then alt_23 = 4
      when ID then look_23_5 = @input.peek( 2 )

      if ( look_23_5 == EOF || look_23_5 == ID || look_23_5 == LBRACE || look_23_5.between?( PLUS, SEMI ) || look_23_5 == VAR_TYPE || look_23_5 == T__18 || look_23_5.between?( T__20, T__27 ) || look_23_5.between?( T__29, T__33 ) || look_23_5.between?( T__35, T__42 ) )
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


        # at line 180:7: BOOLEAN
        __BOOLEAN93__ = match( BOOLEAN, TOKENS_FOLLOWING_BOOLEAN_IN_primary_894 )
        if @state.backtracking == 0
          tree_for_BOOLEAN93 = @adaptor.create_with_payload( __BOOLEAN93__ )
          @adaptor.add_child( root_0, tree_for_BOOLEAN93 )

        end


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 181:7: CHAR
        __CHAR94__ = match( CHAR, TOKENS_FOLLOWING_CHAR_IN_primary_902 )
        if @state.backtracking == 0
          tree_for_CHAR94 = @adaptor.create_with_payload( __CHAR94__ )
          @adaptor.add_child( root_0, tree_for_CHAR94 )

        end


      when 3
        root_0 = @adaptor.create_flat_list


        # at line 182:7: FLOAT
        __FLOAT95__ = match( FLOAT, TOKENS_FOLLOWING_FLOAT_IN_primary_910 )
        if @state.backtracking == 0
          tree_for_FLOAT95 = @adaptor.create_with_payload( __FLOAT95__ )
          @adaptor.add_child( root_0, tree_for_FLOAT95 )

        end


      when 4
        root_0 = @adaptor.create_flat_list


        # at line 183:7: INT
        __INT96__ = match( INT, TOKENS_FOLLOWING_INT_IN_primary_918 )
        if @state.backtracking == 0
          tree_for_INT96 = @adaptor.create_with_payload( __INT96__ )
          @adaptor.add_child( root_0, tree_for_INT96 )

        end


      when 5
        root_0 = @adaptor.create_flat_list


        # at line 184:7: variable_name ( '[' expression ']' )? ( '[' expression ']' )?
        @state.following.push( TOKENS_FOLLOWING_variable_name_IN_primary_926 )
        variable_name97 = variable_name
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, variable_name97.tree )
        end

        # at line 184:21: ( '[' expression ']' )?
        alt_21 = 2
        look_21_0 = @input.peek( 1 )

        if ( look_21_0 == T__32 )
          alt_21 = 1
        end
        case alt_21
        when 1
          # at line 184:22: '[' expression ']'
          char_literal98 = match( T__32, TOKENS_FOLLOWING_T__32_IN_primary_929 )
          if @state.backtracking == 0
            tree_for_char_literal98 = @adaptor.create_with_payload( char_literal98 )
            @adaptor.add_child( root_0, tree_for_char_literal98 )

          end

          @state.following.push( TOKENS_FOLLOWING_expression_IN_primary_931 )
          expression99 = expression
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, expression99.tree )
          end

          char_literal100 = match( T__33, TOKENS_FOLLOWING_T__33_IN_primary_933 )
          if @state.backtracking == 0
            tree_for_char_literal100 = @adaptor.create_with_payload( char_literal100 )
            @adaptor.add_child( root_0, tree_for_char_literal100 )

          end


        end
        # at line 184:43: ( '[' expression ']' )?
        alt_22 = 2
        look_22_0 = @input.peek( 1 )

        if ( look_22_0 == T__32 )
          alt_22 = 1
        end
        case alt_22
        when 1
          # at line 184:44: '[' expression ']'
          char_literal101 = match( T__32, TOKENS_FOLLOWING_T__32_IN_primary_938 )
          if @state.backtracking == 0
            tree_for_char_literal101 = @adaptor.create_with_payload( char_literal101 )
            @adaptor.add_child( root_0, tree_for_char_literal101 )

          end

          @state.following.push( TOKENS_FOLLOWING_expression_IN_primary_940 )
          expression102 = expression
          @state.following.pop
          if @state.backtracking == 0
            @adaptor.add_child( root_0, expression102.tree )
          end

          char_literal103 = match( T__33, TOKENS_FOLLOWING_T__33_IN_primary_942 )
          if @state.backtracking == 0
            tree_for_char_literal103 = @adaptor.create_with_payload( char_literal103 )
            @adaptor.add_child( root_0, tree_for_char_literal103 )

          end


        end

      when 6
        root_0 = @adaptor.create_flat_list


        # at line 185:7: variable_name ( '(' expression_list ')' )
        @state.following.push( TOKENS_FOLLOWING_variable_name_IN_primary_952 )
        variable_name104 = variable_name
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, variable_name104.tree )
        end

        # at line 185:21: ( '(' expression_list ')' )
        # at line 185:22: '(' expression_list ')'
        char_literal105 = match( T__19, TOKENS_FOLLOWING_T__19_IN_primary_955 )
        if @state.backtracking == 0
          tree_for_char_literal105 = @adaptor.create_with_payload( char_literal105 )
          @adaptor.add_child( root_0, tree_for_char_literal105 )

        end

        @state.following.push( TOKENS_FOLLOWING_expression_list_IN_primary_957 )
        expression_list106 = expression_list
        @state.following.pop
        if @state.backtracking == 0
          @adaptor.add_child( root_0, expression_list106.tree )
        end

        char_literal107 = match( T__20, TOKENS_FOLLOWING_T__20_IN_primary_959 )
        if @state.backtracking == 0
          tree_for_char_literal107 = @adaptor.create_with_payload( char_literal107 )
          @adaptor.add_child( root_0, tree_for_char_literal107 )

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
    # 55:7: synpred1_Rubik : '}' ;
    #
    # This is an imaginary rule inserted by ANTLR to
    # implement a syntactic predicate decision
    #
    def synpred1_Rubik
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )


      # at line 55:9: '}'
      match( RBRACE, TOKENS_FOLLOWING_RBRACE_IN_synpred1_Rubik_253 )

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 27 )


    end


    TOKENS_FOLLOWING_T__34_IN_program_98 = Set[ 8, 10, 16, 35, 36, 39, 40, 41 ]
    TOKENS_FOLLOWING_block_IN_program_100 = Set[ 8, 10, 16, 35, 36, 38, 39, 40, 41 ]
    TOKENS_FOLLOWING_T__38_IN_program_103 = Set[ 1 ]
    TOKENS_FOLLOWING_statement_IN_block_129 = Set[ 1 ]
    TOKENS_FOLLOWING_statement_block_IN_block_137 = Set[ 1 ]
    TOKENS_FOLLOWING_LBRACE_IN_statement_block_154 = Set[ 8, 13, 16, 35, 36, 39, 40, 41 ]
    TOKENS_FOLLOWING_statement_IN_statement_block_156 = Set[ 8, 13, 16, 35, 36, 39, 40, 41 ]
    TOKENS_FOLLOWING_RBRACE_IN_statement_block_159 = Set[ 1 ]
    TOKENS_FOLLOWING_variable_statement_IN_statement_178 = Set[ 1 ]
    TOKENS_FOLLOWING_assignment_statement_IN_statement_186 = Set[ 1 ]
    TOKENS_FOLLOWING_condition_statement_IN_statement_194 = Set[ 1 ]
    TOKENS_FOLLOWING_write_statement_IN_statement_202 = Set[ 1 ]
    TOKENS_FOLLOWING_loop_statement_IN_statement_210 = Set[ 1 ]
    TOKENS_FOLLOWING_return_statement_IN_statement_218 = Set[ 1 ]
    TOKENS_FOLLOWING_function_IN_statement_226 = Set[ 1 ]
    TOKENS_FOLLOWING_SEMI_IN_statement_end_243 = Set[ 1 ]
    TOKENS_FOLLOWING_EOF_IN_statement_end_264 = Set[ 1 ]
    TOKENS_FOLLOWING_T__41_IN_return_statement_281 = Set[ 5, 6, 7, 8, 9, 19, 23 ]
    TOKENS_FOLLOWING_expression_IN_return_statement_283 = Set[ 14 ]
    TOKENS_FOLLOWING_statement_end_IN_return_statement_285 = Set[ 1 ]
    TOKENS_FOLLOWING_VAR_TYPE_IN_variable_statement_313 = Set[ 8 ]
    TOKENS_FOLLOWING_variable_declaration_list_IN_variable_statement_315 = Set[ 14 ]
    TOKENS_FOLLOWING_statement_end_IN_variable_statement_317 = Set[ 1 ]
    TOKENS_FOLLOWING_variable_declaration_IN_variable_declaration_list_345 = Set[ 1, 22 ]
    TOKENS_FOLLOWING_T__22_IN_variable_declaration_list_348 = Set[ 8 ]
    TOKENS_FOLLOWING_variable_declaration_IN_variable_declaration_list_350 = Set[ 1, 22 ]
    TOKENS_FOLLOWING_declaration_target_IN_variable_declaration_369 = Set[ 1, 28 ]
    TOKENS_FOLLOWING_T__28_IN_variable_declaration_372 = Set[ 5, 6, 7, 8, 9, 19, 23 ]
    TOKENS_FOLLOWING_expression_IN_variable_declaration_374 = Set[ 1 ]
    TOKENS_FOLLOWING_variable_name_IN_declaration_target_398 = Set[ 1, 32 ]
    TOKENS_FOLLOWING_T__32_IN_declaration_target_401 = Set[ 9 ]
    TOKENS_FOLLOWING_INT_IN_declaration_target_403 = Set[ 33 ]
    TOKENS_FOLLOWING_T__33_IN_declaration_target_405 = Set[ 1, 32 ]
    TOKENS_FOLLOWING_T__32_IN_declaration_target_410 = Set[ 9 ]
    TOKENS_FOLLOWING_INT_IN_declaration_target_412 = Set[ 33 ]
    TOKENS_FOLLOWING_T__33_IN_declaration_target_414 = Set[ 1 ]
    TOKENS_FOLLOWING_ID_IN_assignment_statement_448 = Set[ 28 ]
    TOKENS_FOLLOWING_T__28_IN_assignment_statement_450 = Set[ 5, 6, 7, 8, 9, 19, 23 ]
    TOKENS_FOLLOWING_expression_IN_assignment_statement_452 = Set[ 14 ]
    TOKENS_FOLLOWING_statement_end_IN_assignment_statement_454 = Set[ 1 ]
    TOKENS_FOLLOWING_T__39_IN_condition_statement_482 = Set[ 19 ]
    TOKENS_FOLLOWING_T__19_IN_condition_statement_484 = Set[ 5, 6, 7, 8, 9, 19, 23 ]
    TOKENS_FOLLOWING_expression_IN_condition_statement_486 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_condition_statement_488 = Set[ 8, 10, 16, 35, 36, 39, 40, 41 ]
    TOKENS_FOLLOWING_block_IN_condition_statement_490 = Set[ 1, 37 ]
    TOKENS_FOLLOWING_T__37_IN_condition_statement_493 = Set[ 8, 10, 16, 35, 36, 39, 40, 41 ]
    TOKENS_FOLLOWING_block_IN_condition_statement_495 = Set[ 1 ]
    TOKENS_FOLLOWING_exp_IN_expression_514 = Set[ 1, 18, 26, 27, 29, 30, 31 ]
    TOKENS_FOLLOWING_relation_op_IN_expression_517 = Set[ 5, 6, 7, 8, 9, 19, 23 ]
    TOKENS_FOLLOWING_exp_IN_expression_519 = Set[ 1 ]
    TOKENS_FOLLOWING_term_IN_exp_595 = Set[ 1, 12, 23 ]
    TOKENS_FOLLOWING_set_IN_exp_598 = Set[ 5, 6, 7, 8, 9, 19, 23 ]
    TOKENS_FOLLOWING_exp_IN_exp_604 = Set[ 1 ]
    TOKENS_FOLLOWING_factor_IN_term_623 = Set[ 1, 21, 25 ]
    TOKENS_FOLLOWING_set_IN_term_626 = Set[ 5, 6, 7, 8, 9, 19, 23 ]
    TOKENS_FOLLOWING_term_IN_term_632 = Set[ 1 ]
    TOKENS_FOLLOWING_T__19_IN_factor_651 = Set[ 5, 6, 7, 8, 9, 19, 23 ]
    TOKENS_FOLLOWING_expression_IN_factor_653 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_factor_655 = Set[ 1 ]
    TOKENS_FOLLOWING_T__23_IN_factor_663 = Set[ 5, 6, 7, 8, 9 ]
    TOKENS_FOLLOWING_primary_IN_factor_666 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_expression_list_683 = Set[ 1, 22 ]
    TOKENS_FOLLOWING_T__22_IN_expression_list_686 = Set[ 5, 6, 7, 8, 9, 19, 23 ]
    TOKENS_FOLLOWING_expression_IN_expression_list_688 = Set[ 1, 22 ]
    TOKENS_FOLLOWING_T__40_IN_write_statement_707 = Set[ 19 ]
    TOKENS_FOLLOWING_T__19_IN_write_statement_709 = Set[ 5, 6, 7, 8, 9, 15, 19, 23 ]
    TOKENS_FOLLOWING_write_expression_IN_write_statement_711 = Set[ 20, 24 ]
    TOKENS_FOLLOWING_T__24_IN_write_statement_714 = Set[ 5, 6, 7, 8, 9, 15, 19, 23 ]
    TOKENS_FOLLOWING_write_expression_IN_write_statement_716 = Set[ 20, 24 ]
    TOKENS_FOLLOWING_T__20_IN_write_statement_720 = Set[ 14 ]
    TOKENS_FOLLOWING_statement_end_IN_write_statement_722 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_write_expression_740 = Set[ 1 ]
    TOKENS_FOLLOWING_STRING_IN_write_expression_748 = Set[ 1 ]
    TOKENS_FOLLOWING_T__36_IN_loop_statement_765 = Set[ 5, 6, 7, 8, 9, 19, 23 ]
    TOKENS_FOLLOWING_exp_IN_loop_statement_767 = Set[ 42 ]
    TOKENS_FOLLOWING_T__42_IN_loop_statement_769 = Set[ 8, 10, 16, 35, 36, 39, 40, 41 ]
    TOKENS_FOLLOWING_block_IN_loop_statement_771 = Set[ 1 ]
    TOKENS_FOLLOWING_T__35_IN_function_788 = Set[ 16 ]
    TOKENS_FOLLOWING_VAR_TYPE_IN_function_790 = Set[ 8 ]
    TOKENS_FOLLOWING_variable_name_IN_function_792 = Set[ 19 ]
    TOKENS_FOLLOWING_function_parameters_IN_function_794 = Set[ 8, 10, 16, 35, 36, 39, 40, 41 ]
    TOKENS_FOLLOWING_block_IN_function_796 = Set[ 1 ]
    TOKENS_FOLLOWING_T__19_IN_function_parameters_823 = Set[ 16, 20 ]
    TOKENS_FOLLOWING_parameters_IN_function_parameters_825 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_function_parameters_828 = Set[ 1 ]
    TOKENS_FOLLOWING_VAR_TYPE_IN_parameters_845 = Set[ 8 ]
    TOKENS_FOLLOWING_variable_name_IN_parameters_847 = Set[ 1, 22 ]
    TOKENS_FOLLOWING_T__22_IN_parameters_850 = Set[ 16 ]
    TOKENS_FOLLOWING_VAR_TYPE_IN_parameters_852 = Set[ 8 ]
    TOKENS_FOLLOWING_variable_name_IN_parameters_854 = Set[ 1, 22 ]
    TOKENS_FOLLOWING_ID_IN_variable_name_875 = Set[ 1 ]
    TOKENS_FOLLOWING_BOOLEAN_IN_primary_894 = Set[ 1 ]
    TOKENS_FOLLOWING_CHAR_IN_primary_902 = Set[ 1 ]
    TOKENS_FOLLOWING_FLOAT_IN_primary_910 = Set[ 1 ]
    TOKENS_FOLLOWING_INT_IN_primary_918 = Set[ 1 ]
    TOKENS_FOLLOWING_variable_name_IN_primary_926 = Set[ 1, 32 ]
    TOKENS_FOLLOWING_T__32_IN_primary_929 = Set[ 5, 6, 7, 8, 9, 19, 23 ]
    TOKENS_FOLLOWING_expression_IN_primary_931 = Set[ 33 ]
    TOKENS_FOLLOWING_T__33_IN_primary_933 = Set[ 1, 32 ]
    TOKENS_FOLLOWING_T__32_IN_primary_938 = Set[ 5, 6, 7, 8, 9, 19, 23 ]
    TOKENS_FOLLOWING_expression_IN_primary_940 = Set[ 33 ]
    TOKENS_FOLLOWING_T__33_IN_primary_942 = Set[ 1 ]
    TOKENS_FOLLOWING_variable_name_IN_primary_952 = Set[ 19 ]
    TOKENS_FOLLOWING_T__19_IN_primary_955 = Set[ 5, 6, 7, 8, 9, 19, 23 ]
    TOKENS_FOLLOWING_expression_list_IN_primary_957 = Set[ 20 ]
    TOKENS_FOLLOWING_T__20_IN_primary_959 = Set[ 1 ]
    TOKENS_FOLLOWING_RBRACE_IN_synpred1_Rubik_253 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0

end
