#!/usr/bin/env ruby
#
# Rubik.g
# --
# Generated using ANTLR version: 3.5
# Ruby runtime library version: 1.10.0
# Input grammar file: Rubik.g
# Generated at: 2013-10-22 18:57:53
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

  end


  class Lexer < ANTLR3::Lexer
    @grammar_home = Rubik
    include TokenData

    begin
      generated_using( "Rubik.g", "3.5", "1.10.0" )
    rescue NoMethodError => error
      # ignore
    end

    RULE_NAMES   = [ "LBRACE", "PLUS", "RBRACE", "SEMI", "T__18", "T__19", 
                     "T__20", "T__21", "T__22", "T__23", "T__24", "T__25", 
                     "T__26", "T__27", "T__28", "T__29", "T__30", "T__31", 
                     "T__32", "T__33", "T__34", "T__35", "T__36", "T__37", 
                     "T__38", "T__39", "T__40", "T__41", "T__42", "VAR_TYPE", 
                     "BOOLEAN", "CHAR", "FLOAT", "INT", "STRING", "ID", 
                     "NEWLINE", "WS" ].freeze
    RULE_METHODS = [ :lbrace!, :plus!, :rbrace!, :semi!, :t__18!, :t__19!, 
                     :t__20!, :t__21!, :t__22!, :t__23!, :t__24!, :t__25!, 
                     :t__26!, :t__27!, :t__28!, :t__29!, :t__30!, :t__31!, 
                     :t__32!, :t__33!, :t__34!, :t__35!, :t__36!, :t__37!, 
                     :t__38!, :t__39!, :t__40!, :t__41!, :t__42!, :var_type!, 
                     :boolean!, :char!, :float!, :int!, :string!, :id!, 
                     :newline!, :ws! ].freeze

    def initialize( input=nil, options = {} )
      super( input, options )
    end


    # - - - - - - - - - - - lexer rules - - - - - - - - - - - -
    # lexer rule lbrace! (LBRACE)
    # (in Rubik.g)
    def lbrace!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 1 )



      type = LBRACE
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 7:10: '{'
      match( 0x7b )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 1 )


    end

    # lexer rule plus! (PLUS)
    # (in Rubik.g)
    def plus!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 2 )



      type = PLUS
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 8:8: '+'
      match( 0x2b )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 2 )


    end

    # lexer rule rbrace! (RBRACE)
    # (in Rubik.g)
    def rbrace!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 3 )



      type = RBRACE
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 9:10: '}'
      match( 0x7d )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 3 )


    end

    # lexer rule semi! (SEMI)
    # (in Rubik.g)
    def semi!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 4 )



      type = SEMI
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 10:8: ';'
      match( 0x3b )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 4 )


    end

    # lexer rule t__18! (T__18)
    # (in Rubik.g)
    def t__18!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 5 )



      type = T__18
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 11:9: '!='
      match( "!=" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 5 )


    end

    # lexer rule t__19! (T__19)
    # (in Rubik.g)
    def t__19!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 6 )



      type = T__19
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 12:9: '('
      match( 0x28 )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 6 )


    end

    # lexer rule t__20! (T__20)
    # (in Rubik.g)
    def t__20!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 7 )



      type = T__20
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 13:9: ')'
      match( 0x29 )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 7 )


    end

    # lexer rule t__21! (T__21)
    # (in Rubik.g)
    def t__21!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 8 )



      type = T__21
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 14:9: '*'
      match( 0x2a )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 8 )


    end

    # lexer rule t__22! (T__22)
    # (in Rubik.g)
    def t__22!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 9 )



      type = T__22
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 15:9: ','
      match( 0x2c )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 9 )


    end

    # lexer rule t__23! (T__23)
    # (in Rubik.g)
    def t__23!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 10 )



      type = T__23
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 16:9: '-'
      match( 0x2d )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 10 )


    end

    # lexer rule t__24! (T__24)
    # (in Rubik.g)
    def t__24!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 11 )



      type = T__24
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 17:9: '.'
      match( 0x2e )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 11 )


    end

    # lexer rule t__25! (T__25)
    # (in Rubik.g)
    def t__25!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 12 )



      type = T__25
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 18:9: '/'
      match( 0x2f )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 12 )


    end

    # lexer rule t__26! (T__26)
    # (in Rubik.g)
    def t__26!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 13 )



      type = T__26
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 19:9: '<'
      match( 0x3c )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 13 )


    end

    # lexer rule t__27! (T__27)
    # (in Rubik.g)
    def t__27!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 14 )



      type = T__27
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 20:9: '<='
      match( "<=" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 14 )


    end

    # lexer rule t__28! (T__28)
    # (in Rubik.g)
    def t__28!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )



      type = T__28
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 21:9: '='
      match( 0x3d )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 15 )


    end

    # lexer rule t__29! (T__29)
    # (in Rubik.g)
    def t__29!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )



      type = T__29
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 22:9: '=='
      match( "==" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 16 )


    end

    # lexer rule t__30! (T__30)
    # (in Rubik.g)
    def t__30!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )



      type = T__30
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 23:9: '>'
      match( 0x3e )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 17 )


    end

    # lexer rule t__31! (T__31)
    # (in Rubik.g)
    def t__31!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )



      type = T__31
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 24:9: '>='
      match( ">=" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 18 )


    end

    # lexer rule t__32! (T__32)
    # (in Rubik.g)
    def t__32!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )



      type = T__32
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 25:9: '['
      match( 0x5b )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 19 )


    end

    # lexer rule t__33! (T__33)
    # (in Rubik.g)
    def t__33!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )



      type = T__33
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 26:9: ']'
      match( 0x5d )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 20 )


    end

    # lexer rule t__34! (T__34)
    # (in Rubik.g)
    def t__34!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )



      type = T__34
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 27:9: 'begin'
      match( "begin" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 21 )


    end

    # lexer rule t__35! (T__35)
    # (in Rubik.g)
    def t__35!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )



      type = T__35
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 28:9: 'def'
      match( "def" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 22 )


    end

    # lexer rule t__36! (T__36)
    # (in Rubik.g)
    def t__36!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 23 )



      type = T__36
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 29:9: 'do'
      match( "do" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 23 )


    end

    # lexer rule t__37! (T__37)
    # (in Rubik.g)
    def t__37!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )



      type = T__37
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 30:9: 'else'
      match( "else" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 24 )


    end

    # lexer rule t__38! (T__38)
    # (in Rubik.g)
    def t__38!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )



      type = T__38
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 31:9: 'end'
      match( "end" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 25 )


    end

    # lexer rule t__39! (T__39)
    # (in Rubik.g)
    def t__39!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )



      type = T__39
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 32:9: 'if'
      match( "if" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 26 )


    end

    # lexer rule t__40! (T__40)
    # (in Rubik.g)
    def t__40!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )



      type = T__40
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 33:9: 'print'
      match( "print" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 27 )


    end

    # lexer rule t__41! (T__41)
    # (in Rubik.g)
    def t__41!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )



      type = T__41
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 34:9: 'return'
      match( "return" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 28 )


    end

    # lexer rule t__42! (T__42)
    # (in Rubik.g)
    def t__42!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 29 )



      type = T__42
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 35:9: 'times'
      match( "times" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 29 )


    end

    # lexer rule var_type! (VAR_TYPE)
    # (in Rubik.g)
    def var_type!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )



      type = VAR_TYPE
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 183:5: ( 'boolean' | 'char' | 'float' | 'int' | 'void' )
      alt_1 = 5
      case look_1 = @input.peek( 1 )
      when 0x62 then alt_1 = 1
      when 0x63 then alt_1 = 2
      when 0x66 then alt_1 = 3
      when 0x69 then alt_1 = 4
      when 0x76 then alt_1 = 5
      else
        raise NoViableAlternative( "", 1, 0 )

      end
      case alt_1
      when 1
        # at line 183:7: 'boolean'
        match( "boolean" )


      when 2
        # at line 184:7: 'char'
        match( "char" )


      when 3
        # at line 185:7: 'float'
        match( "float" )


      when 4
        # at line 186:7: 'int'
        match( "int" )


      when 5
        # at line 187:7: 'void'
        match( "void" )


      end

      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 30 )


    end

    # lexer rule boolean! (BOOLEAN)
    # (in Rubik.g)
    def boolean!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 31 )



      type = BOOLEAN
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 191:5: ( 'true' | 'false' )
      alt_2 = 2
      look_2_0 = @input.peek( 1 )

      if ( look_2_0 == 0x74 )
        alt_2 = 1
      elsif ( look_2_0 == 0x66 )
        alt_2 = 2
      else
        raise NoViableAlternative( "", 2, 0 )

      end
      case alt_2
      when 1
        # at line 191:7: 'true'
        match( "true" )


      when 2
        # at line 192:7: 'false'
        match( "false" )


      end

      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 31 )


    end

    # lexer rule char! (CHAR)
    # (in Rubik.g)
    def char!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 32 )



      type = CHAR
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 196:7: ( '\\'' )+ ( 'a' .. 'z' | 'A' .. 'Z' )+ '\\''
      # at file 196:7: ( '\\'' )+
      match_count_3 = 0
      while true
        alt_3 = 2
        look_3_0 = @input.peek( 1 )

        if ( look_3_0 == 0x27 )
          alt_3 = 1

        end
        case alt_3
        when 1
          # at line 196:7: '\\''
          match( 0x27 )

        else
          match_count_3 > 0 and break
          eee = EarlyExit(3)


          raise eee
        end
        match_count_3 += 1
      end


      # at file 196:14: ( 'a' .. 'z' | 'A' .. 'Z' )+
      match_count_4 = 0
      while true
        alt_4 = 2
        look_4_0 = @input.peek( 1 )

        if ( look_4_0.between?( 0x41, 0x5a ) || look_4_0.between?( 0x61, 0x7a ) )
          alt_4 = 1

        end
        case alt_4
        when 1
          # at line 
          if @input.peek( 1 ).between?( 0x41, 0x5a ) || @input.peek( 1 ).between?( 0x61, 0x7a )
            @input.consume
          else
            mse = MismatchedSet( nil )
            recover mse
            raise mse

          end



        else
          match_count_4 > 0 and break
          eee = EarlyExit(4)


          raise eee
        end
        match_count_4 += 1
      end


      match( 0x27 )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 32 )


    end

    # lexer rule float! (FLOAT)
    # (in Rubik.g)
    def float!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 33 )



      type = FLOAT
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 200:7: ( '0' .. '9' )+ '.' ( '0' .. '9' )+
      # at file 200:7: ( '0' .. '9' )+
      match_count_5 = 0
      while true
        alt_5 = 2
        look_5_0 = @input.peek( 1 )

        if ( look_5_0.between?( 0x30, 0x39 ) )
          alt_5 = 1

        end
        case alt_5
        when 1
          # at line 
          if @input.peek( 1 ).between?( 0x30, 0x39 )
            @input.consume
          else
            mse = MismatchedSet( nil )
            recover mse
            raise mse

          end



        else
          match_count_5 > 0 and break
          eee = EarlyExit(5)


          raise eee
        end
        match_count_5 += 1
      end


      match( 0x2e )
      # at file 200:23: ( '0' .. '9' )+
      match_count_6 = 0
      while true
        alt_6 = 2
        look_6_0 = @input.peek( 1 )

        if ( look_6_0.between?( 0x30, 0x39 ) )
          alt_6 = 1

        end
        case alt_6
        when 1
          # at line 
          if @input.peek( 1 ).between?( 0x30, 0x39 )
            @input.consume
          else
            mse = MismatchedSet( nil )
            recover mse
            raise mse

          end



        else
          match_count_6 > 0 and break
          eee = EarlyExit(6)


          raise eee
        end
        match_count_6 += 1
      end




      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 33 )


    end

    # lexer rule int! (INT)
    # (in Rubik.g)
    def int!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 34 )



      type = INT
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 204:7: ( '0' .. '9' )+
      # at file 204:7: ( '0' .. '9' )+
      match_count_7 = 0
      while true
        alt_7 = 2
        look_7_0 = @input.peek( 1 )

        if ( look_7_0.between?( 0x30, 0x39 ) )
          alt_7 = 1

        end
        case alt_7
        when 1
          # at line 
          if @input.peek( 1 ).between?( 0x30, 0x39 )
            @input.consume
          else
            mse = MismatchedSet( nil )
            recover mse
            raise mse

          end



        else
          match_count_7 > 0 and break
          eee = EarlyExit(7)


          raise eee
        end
        match_count_7 += 1
      end




      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 34 )


    end

    # lexer rule string! (STRING)
    # (in Rubik.g)
    def string!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 35 )



      type = STRING
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 208:5: ( '\\'' (~ ( '\\'' | '\\\\' ) | '\\\\' . )* '\\'' | '\"' (~ ( '\"' | '\\\\' ) | '\\\\' . )* '\"' )
      alt_10 = 2
      look_10_0 = @input.peek( 1 )

      if ( look_10_0 == 0x27 )
        alt_10 = 1
      elsif ( look_10_0 == 0x22 )
        alt_10 = 2
      else
        raise NoViableAlternative( "", 10, 0 )

      end
      case alt_10
      when 1
        # at line 208:7: '\\'' (~ ( '\\'' | '\\\\' ) | '\\\\' . )* '\\''
        match( 0x27 )
        # at line 208:12: (~ ( '\\'' | '\\\\' ) | '\\\\' . )*
        while true # decision 8
          alt_8 = 3
          look_8_0 = @input.peek( 1 )

          if ( look_8_0.between?( 0x0, 0x26 ) || look_8_0.between?( 0x28, 0x5b ) || look_8_0.between?( 0x5d, 0xffff ) )
            alt_8 = 1
          elsif ( look_8_0 == 0x5c )
            alt_8 = 2

          end
          case alt_8
          when 1
            # at line 208:13: ~ ( '\\'' | '\\\\' )
            if @input.peek( 1 ).between?( 0x0, 0x26 ) || @input.peek( 1 ).between?( 0x28, 0x5b ) || @input.peek( 1 ).between?( 0x5d, 0xff )
              @input.consume
            else
              mse = MismatchedSet( nil )
              recover mse
              raise mse

            end



          when 2
            # at line 208:30: '\\\\' .
            match( 0x5c )
            match_any

          else
            break # out of loop for decision 8
          end
        end # loop for decision 8

        match( 0x27 )

      when 2
        # at line 209:7: '\"' (~ ( '\"' | '\\\\' ) | '\\\\' . )* '\"'
        match( 0x22 )
        # at line 209:12: (~ ( '\"' | '\\\\' ) | '\\\\' . )*
        while true # decision 9
          alt_9 = 3
          look_9_0 = @input.peek( 1 )

          if ( look_9_0.between?( 0x0, 0x21 ) || look_9_0.between?( 0x23, 0x5b ) || look_9_0.between?( 0x5d, 0xffff ) )
            alt_9 = 1
          elsif ( look_9_0 == 0x5c )
            alt_9 = 2

          end
          case alt_9
          when 1
            # at line 209:13: ~ ( '\"' | '\\\\' )
            if @input.peek( 1 ).between?( 0x0, 0x21 ) || @input.peek( 1 ).between?( 0x23, 0x5b ) || @input.peek( 1 ).between?( 0x5d, 0xff )
              @input.consume
            else
              mse = MismatchedSet( nil )
              recover mse
              raise mse

            end



          when 2
            # at line 209:30: '\\\\' .
            match( 0x5c )
            match_any

          else
            break # out of loop for decision 9
          end
        end # loop for decision 9

        match( 0x22 )

      end

      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 35 )


    end

    # lexer rule id! (ID)
    # (in Rubik.g)
    def id!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 36 )



      type = ID
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 213:7: ( '_' | 'a' .. 'z' | 'A' .. 'Z' ) ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' )*
      if @input.peek( 1 ).between?( 0x41, 0x5a ) || @input.peek(1) == 0x5f || @input.peek( 1 ).between?( 0x61, 0x7a )
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse

      end


      # at line 213:35: ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' )*
      while true # decision 11
        alt_11 = 2
        look_11_0 = @input.peek( 1 )

        if ( look_11_0.between?( 0x30, 0x39 ) || look_11_0.between?( 0x41, 0x5a ) || look_11_0 == 0x5f || look_11_0.between?( 0x61, 0x7a ) )
          alt_11 = 1

        end
        case alt_11
        when 1
          # at line 
          if @input.peek( 1 ).between?( 0x30, 0x39 ) || @input.peek( 1 ).between?( 0x41, 0x5a ) || @input.peek(1) == 0x5f || @input.peek( 1 ).between?( 0x61, 0x7a )
            @input.consume
          else
            mse = MismatchedSet( nil )
            recover mse
            raise mse

          end



        else
          break # out of loop for decision 11
        end
      end # loop for decision 11



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 36 )


    end

    # lexer rule newline! (NEWLINE)
    # (in Rubik.g)
    def newline!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 37 )



      type = NEWLINE
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 217:7: ( '\\n' | '\\r' )+
      # at file 217:7: ( '\\n' | '\\r' )+
      match_count_12 = 0
      while true
        alt_12 = 2
        look_12_0 = @input.peek( 1 )

        if ( look_12_0 == 0xa || look_12_0 == 0xd )
          alt_12 = 1

        end
        case alt_12
        when 1
          # at line 
          if @input.peek(1) == 0xa || @input.peek(1) == 0xd
            @input.consume
          else
            mse = MismatchedSet( nil )
            recover mse
            raise mse

          end



        else
          match_count_12 > 0 and break
          eee = EarlyExit(12)


          raise eee
        end
        match_count_12 += 1
      end



      # --> action
       channel = HIDDEN 
      # <-- action



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 37 )


    end

    # lexer rule ws! (WS)
    # (in Rubik.g)
    def ws!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 38 )



      type = WS
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 221:7: ( '\\t' | '\\f' | ' ' | '\\u00A0' )+
      # at file 221:7: ( '\\t' | '\\f' | ' ' | '\\u00A0' )+
      match_count_13 = 0
      while true
        alt_13 = 2
        look_13_0 = @input.peek( 1 )

        if ( look_13_0 == 0x9 || look_13_0 == 0xc || look_13_0 == 0x20 || look_13_0 == 0xa0 )
          alt_13 = 1

        end
        case alt_13
        when 1
          # at line 
          if @input.peek(1) == 0x9 || @input.peek(1) == 0xc || @input.peek(1) == 0x20 || @input.peek(1) == 0xa0
            @input.consume
          else
            mse = MismatchedSet( nil )
            recover mse
            raise mse

          end



        else
          match_count_13 > 0 and break
          eee = EarlyExit(13)


          raise eee
        end
        match_count_13 += 1
      end



      # --> action
       channel = HIDDEN 
      # <-- action



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 38 )


    end

    # main rule used to study the input at the current position,
    # and choose the proper lexer rule to call in order to
    # fetch the next token
    #
    # usually, you don't make direct calls to this method,
    # but instead use the next_token method, which will
    # build and emit the actual next token
    def token!
      # at line 1:8: ( LBRACE | PLUS | RBRACE | SEMI | T__18 | T__19 | T__20 | T__21 | T__22 | T__23 | T__24 | T__25 | T__26 | T__27 | T__28 | T__29 | T__30 | T__31 | T__32 | T__33 | T__34 | T__35 | T__36 | T__37 | T__38 | T__39 | T__40 | T__41 | T__42 | VAR_TYPE | BOOLEAN | CHAR | FLOAT | INT | STRING | ID | NEWLINE | WS )
      alt_14 = 38
      alt_14 = @dfa14.predict( @input )
      case alt_14
      when 1
        # at line 1:10: LBRACE
        lbrace!


      when 2
        # at line 1:17: PLUS
        plus!


      when 3
        # at line 1:22: RBRACE
        rbrace!


      when 4
        # at line 1:29: SEMI
        semi!


      when 5
        # at line 1:34: T__18
        t__18!


      when 6
        # at line 1:40: T__19
        t__19!


      when 7
        # at line 1:46: T__20
        t__20!


      when 8
        # at line 1:52: T__21
        t__21!


      when 9
        # at line 1:58: T__22
        t__22!


      when 10
        # at line 1:64: T__23
        t__23!


      when 11
        # at line 1:70: T__24
        t__24!


      when 12
        # at line 1:76: T__25
        t__25!


      when 13
        # at line 1:82: T__26
        t__26!


      when 14
        # at line 1:88: T__27
        t__27!


      when 15
        # at line 1:94: T__28
        t__28!


      when 16
        # at line 1:100: T__29
        t__29!


      when 17
        # at line 1:106: T__30
        t__30!


      when 18
        # at line 1:112: T__31
        t__31!


      when 19
        # at line 1:118: T__32
        t__32!


      when 20
        # at line 1:124: T__33
        t__33!


      when 21
        # at line 1:130: T__34
        t__34!


      when 22
        # at line 1:136: T__35
        t__35!


      when 23
        # at line 1:142: T__36
        t__36!


      when 24
        # at line 1:148: T__37
        t__37!


      when 25
        # at line 1:154: T__38
        t__38!


      when 26
        # at line 1:160: T__39
        t__39!


      when 27
        # at line 1:166: T__40
        t__40!


      when 28
        # at line 1:172: T__41
        t__41!


      when 29
        # at line 1:178: T__42
        t__42!


      when 30
        # at line 1:184: VAR_TYPE
        var_type!


      when 31
        # at line 1:193: BOOLEAN
        boolean!


      when 32
        # at line 1:201: CHAR
        char!


      when 33
        # at line 1:206: FLOAT
        float!


      when 34
        # at line 1:212: INT
        int!


      when 35
        # at line 1:216: STRING
        string!


      when 36
        # at line 1:223: ID
        id!


      when 37
        # at line 1:226: NEWLINE
        newline!


      when 38
        # at line 1:234: WS
        ws!


      end
    end


    # - - - - - - - - - - DFA definitions - - - - - - - - - - -
    class DFA14 < ANTLR3::DFA
      EOT = unpack( 13, -1, 1, 35, 1, 37, 1, 39, 2, -1, 10, 31, 1, -1, 1, 
                    59, 10, -1, 3, 31, 1, 63, 2, 31, 1, 66, 9, 31, 1, -1, 
                    1, 30, 2, -1, 2, 31, 1, 80, 1, -1, 1, 31, 1, 82, 1, 
                    -1, 1, 83, 8, 31, 2, -1, 2, 31, 1, -1, 1, 94, 2, -1, 
                    3, 31, 1, 98, 1, 83, 2, 31, 1, 83, 1, 101, 1, 31, 1, 
                    -1, 1, 103, 1, 31, 1, 105, 1, -1, 1, 83, 1, 98, 1, -1, 
                    1, 31, 1, -1, 1, 107, 1, -1, 1, 83, 1, -1 )
      EOF = unpack( 108, -1 )
      MIN = unpack( 1, 9, 12, -1, 3, 61, 2, -1, 2, 101, 1, 108, 1, 102, 
                    1, 114, 1, 101, 1, 105, 1, 104, 1, 97, 1, 111, 1, 0, 
                    1, 46, 10, -1, 1, 103, 1, 111, 1, 102, 1, 48, 1, 115, 
                    1, 100, 1, 48, 1, 116, 1, 105, 1, 116, 1, 109, 1, 117, 
                    1, 97, 1, 111, 1, 108, 1, 105, 1, 0, 1, 39, 2, -1, 1, 
                    105, 1, 108, 1, 48, 1, -1, 1, 101, 1, 48, 1, -1, 1, 
                    48, 1, 110, 1, 117, 2, 101, 1, 114, 1, 97, 1, 115, 1, 
                    100, 2, -1, 1, 110, 1, 101, 1, -1, 1, 48, 2, -1, 1, 
                    116, 1, 114, 1, 115, 2, 48, 1, 116, 1, 101, 2, 48, 1, 
                    97, 1, -1, 1, 48, 1, 110, 1, 48, 1, -1, 2, 48, 1, -1, 
                    1, 110, 1, -1, 1, 48, 1, -1, 1, 48, 1, -1 )
      MAX = unpack( 1, 160, 12, -1, 3, 61, 2, -1, 2, 111, 2, 110, 1, 114, 
                    1, 101, 1, 114, 1, 104, 1, 108, 1, 111, 1, -1, 1, 57, 
                    10, -1, 1, 103, 1, 111, 1, 102, 1, 122, 1, 115, 1, 100, 
                    1, 122, 1, 116, 1, 105, 1, 116, 1, 109, 1, 117, 1, 97, 
                    1, 111, 1, 108, 1, 105, 1, -1, 1, 122, 2, -1, 1, 105, 
                    1, 108, 1, 122, 1, -1, 1, 101, 1, 122, 1, -1, 1, 122, 
                    1, 110, 1, 117, 2, 101, 1, 114, 1, 97, 1, 115, 1, 100, 
                    2, -1, 1, 110, 1, 101, 1, -1, 1, 122, 2, -1, 1, 116, 
                    1, 114, 1, 115, 2, 122, 1, 116, 1, 101, 2, 122, 1, 97, 
                    1, -1, 1, 122, 1, 110, 1, 122, 1, -1, 2, 122, 1, -1, 
                    1, 110, 1, -1, 1, 122, 1, -1, 1, 122, 1, -1 )
      ACCEPT = unpack( 1, -1, 1, 1, 1, 2, 1, 3, 1, 4, 1, 5, 1, 6, 1, 7, 
                       1, 8, 1, 9, 1, 10, 1, 11, 1, 12, 3, -1, 1, 19, 1, 
                       20, 12, -1, 1, 35, 1, 36, 1, 37, 1, 38, 1, 14, 1, 
                       13, 1, 16, 1, 15, 1, 18, 1, 17, 18, -1, 1, 33, 1, 
                       34, 3, -1, 1, 23, 2, -1, 1, 26, 9, -1, 2, 32, 2, 
                       -1, 1, 22, 1, -1, 1, 25, 1, 30, 10, -1, 1, 24, 3, 
                       -1, 1, 31, 2, -1, 1, 21, 1, -1, 1, 27, 1, -1, 1, 
                       29, 1, -1, 1, 28 )
      SPECIAL = unpack( 28, -1, 1, 0, 27, -1, 1, 1, 51, -1 )
      TRANSITION = [
        unpack( 1, 33, 1, 32, 1, -1, 1, 33, 1, 32, 18, -1, 1, 33, 1, 5, 
                1, 30, 4, -1, 1, 28, 1, 6, 1, 7, 1, 8, 1, 2, 1, 9, 1, 10, 
                1, 11, 1, 12, 10, 29, 1, -1, 1, 4, 1, 13, 1, 14, 1, 15, 
                2, -1, 26, 31, 1, 16, 1, -1, 1, 17, 1, -1, 1, 31, 1, -1, 
                1, 31, 1, 18, 1, 25, 1, 19, 1, 20, 1, 26, 2, 31, 1, 21, 
                6, 31, 1, 22, 1, 31, 1, 23, 1, 31, 1, 24, 1, 31, 1, 27, 
                4, 31, 1, 1, 1, -1, 1, 3, 34, -1, 1, 33 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 34 ),
        unpack( 1, 36 ),
        unpack( 1, 38 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 40, 9, -1, 1, 41 ),
        unpack( 1, 42, 9, -1, 1, 43 ),
        unpack( 1, 44, 1, -1, 1, 45 ),
        unpack( 1, 46, 7, -1, 1, 47 ),
        unpack( 1, 48 ),
        unpack( 1, 49 ),
        unpack( 1, 50, 8, -1, 1, 51 ),
        unpack( 1, 52 ),
        unpack( 1, 54, 10, -1, 1, 53 ),
        unpack( 1, 55 ),
        unpack( 39, 30, 1, 57, 25, 30, 26, 56, 6, 30, 26, 56, 65413, 30 ),
        unpack( 1, 58, 1, -1, 10, 29 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 60 ),
        unpack( 1, 61 ),
        unpack( 1, 62 ),
        unpack( 10, 31, 7, -1, 26, 31, 4, -1, 1, 31, 1, -1, 26, 31 ),
        unpack( 1, 64 ),
        unpack( 1, 65 ),
        unpack( 10, 31, 7, -1, 26, 31, 4, -1, 1, 31, 1, -1, 26, 31 ),
        unpack( 1, 67 ),
        unpack( 1, 68 ),
        unpack( 1, 69 ),
        unpack( 1, 70 ),
        unpack( 1, 71 ),
        unpack( 1, 72 ),
        unpack( 1, 73 ),
        unpack( 1, 74 ),
        unpack( 1, 75 ),
        unpack( 39, 30, 1, 76, 25, 30, 26, 56, 6, 30, 26, 56, 65413, 30 ),
        unpack( 1, 77, 25, -1, 26, 77, 6, -1, 26, 77 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 78 ),
        unpack( 1, 79 ),
        unpack( 10, 31, 7, -1, 26, 31, 4, -1, 1, 31, 1, -1, 26, 31 ),
        unpack(  ),
        unpack( 1, 81 ),
        unpack( 10, 31, 7, -1, 26, 31, 4, -1, 1, 31, 1, -1, 26, 31 ),
        unpack(  ),
        unpack( 10, 31, 7, -1, 26, 31, 4, -1, 1, 31, 1, -1, 26, 31 ),
        unpack( 1, 84 ),
        unpack( 1, 85 ),
        unpack( 1, 86 ),
        unpack( 1, 87 ),
        unpack( 1, 88 ),
        unpack( 1, 89 ),
        unpack( 1, 90 ),
        unpack( 1, 91 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 92 ),
        unpack( 1, 93 ),
        unpack(  ),
        unpack( 10, 31, 7, -1, 26, 31, 4, -1, 1, 31, 1, -1, 26, 31 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 95 ),
        unpack( 1, 96 ),
        unpack( 1, 97 ),
        unpack( 10, 31, 7, -1, 26, 31, 4, -1, 1, 31, 1, -1, 26, 31 ),
        unpack( 10, 31, 7, -1, 26, 31, 4, -1, 1, 31, 1, -1, 26, 31 ),
        unpack( 1, 99 ),
        unpack( 1, 100 ),
        unpack( 10, 31, 7, -1, 26, 31, 4, -1, 1, 31, 1, -1, 26, 31 ),
        unpack( 10, 31, 7, -1, 26, 31, 4, -1, 1, 31, 1, -1, 26, 31 ),
        unpack( 1, 102 ),
        unpack(  ),
        unpack( 10, 31, 7, -1, 26, 31, 4, -1, 1, 31, 1, -1, 26, 31 ),
        unpack( 1, 104 ),
        unpack( 10, 31, 7, -1, 26, 31, 4, -1, 1, 31, 1, -1, 26, 31 ),
        unpack(  ),
        unpack( 10, 31, 7, -1, 26, 31, 4, -1, 1, 31, 1, -1, 26, 31 ),
        unpack( 10, 31, 7, -1, 26, 31, 4, -1, 1, 31, 1, -1, 26, 31 ),
        unpack(  ),
        unpack( 1, 106 ),
        unpack(  ),
        unpack( 10, 31, 7, -1, 26, 31, 4, -1, 1, 31, 1, -1, 26, 31 ),
        unpack(  ),
        unpack( 10, 31, 7, -1, 26, 31, 4, -1, 1, 31, 1, -1, 26, 31 ),
        unpack(  )
      ].freeze

      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end

      @decision = 14


      def description
        <<-'__dfa_description__'.strip!
          1:1: Tokens : ( LBRACE | PLUS | RBRACE | SEMI | T__18 | T__19 | T__20 | T__21 | T__22 | T__23 | T__24 | T__25 | T__26 | T__27 | T__28 | T__29 | T__30 | T__31 | T__32 | T__33 | T__34 | T__35 | T__36 | T__37 | T__38 | T__39 | T__40 | T__41 | T__42 | VAR_TYPE | BOOLEAN | CHAR | FLOAT | INT | STRING | ID | NEWLINE | WS );
        __dfa_description__
      end

    end


    private

    def initialize_dfas
      super rescue nil
      @dfa14 = DFA14.new( self, 14 ) do |s|
        case s
        when 0
          look_14_28 = @input.peek
          s = -1
          if ( look_14_28.between?( 0x41, 0x5a ) || look_14_28.between?( 0x61, 0x7a ) )
            s = 56
          elsif ( look_14_28 == 0x27 )
            s = 57
          elsif ( look_14_28.between?( 0x0, 0x26 ) || look_14_28.between?( 0x28, 0x40 ) || look_14_28.between?( 0x5b, 0x60 ) || look_14_28.between?( 0x7b, 0xffff ) )
            s = 30
          end

        when 1
          look_14_56 = @input.peek
          s = -1
          if ( look_14_56 == 0x27 )
            s = 76
          elsif ( look_14_56.between?( 0x41, 0x5a ) || look_14_56.between?( 0x61, 0x7a ) )
            s = 56
          elsif ( look_14_56.between?( 0x0, 0x26 ) || look_14_56.between?( 0x28, 0x40 ) || look_14_56.between?( 0x5b, 0x60 ) || look_14_56.between?( 0x7b, 0xffff ) )
            s = 30
          end

        end

        if s < 0
          nva = ANTLR3::Error::NoViableAlternative.new( @dfa14.description, 14, s, input )
          @dfa14.error( nva )
          raise nva
        end

        s
      end


    end

  end # class Lexer < ANTLR3::Lexer

  at_exit { Lexer.main( ARGV ) } if __FILE__ == $0

end
