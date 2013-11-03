#!/usr/bin/env ruby
#
# Rubik.g
# --
# Generated using ANTLR version: 3.5
# Ruby runtime library version: 1.10.0
# Input grammar file: Rubik.g
# Generated at: 2013-11-03 11:45:06
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

  end


  class Lexer < ANTLR3::Lexer
    @grammar_home = Rubik
    include TokenData

    begin
      generated_using( "Rubik.g", "3.5", "1.10.0" )
    rescue NoMethodError => error
      # ignore
    end

    RULE_NAMES   = [ "AND", "ASGN", "BREAK", "CHANGE_COLOR", "CHANGE_DIR", 
                     "COMMA", "DEF", "DIV", "DO", "DOT", "DRAW_CIRCLE", 
                     "DRAW_SQUARE", "DRAW_TRIANGLE", "ELSE", "EQ", "GEQ", 
                     "GREATER", "IF", "LBRACE", "LBRAK", "LEQ", "LESS", 
                     "LPAREN", "MINUS", "NEG", "NEQ", "NULL", "OR", "PEN_DOWN", 
                     "PEN_UP", "PLUS", "RBRACE", "RBRAK", "RPAREN", "R_BEGIN", 
                     "R_END", "R_MOVE", "R_RESET", "R_RETURN", "SEMI", "STAR", 
                     "TIMES", "TLK", "VAR", "T__60", "T__61", "VAR_TYPE", 
                     "BOOLEAN", "CHAR", "COLOR", "DIR", "FLOAT", "INT", 
                     "STRING", "ID", "NEWLINE", "WS" ].freeze
    RULE_METHODS = [ :and!, :asgn!, :break!, :change_color!, :change_dir!, 
                     :comma!, :def!, :div!, :do!, :dot!, :draw_circle!, 
                     :draw_square!, :draw_triangle!, :else!, :eq!, :geq!, 
                     :greater!, :if!, :lbrace!, :lbrak!, :leq!, :less!, 
                     :lparen!, :minus!, :neg!, :neq!, :null!, :or!, :pen_down!, 
                     :pen_up!, :plus!, :rbrace!, :rbrak!, :rparen!, :r_begin!, 
                     :r_end!, :r_move!, :r_reset!, :r_return!, :semi!, :star!, 
                     :times!, :tlk!, :var!, :t__60!, :t__61!, :var_type!, 
                     :boolean!, :char!, :color!, :dir!, :float!, :int!, 
                     :string!, :id!, :newline!, :ws! ].freeze

    def initialize( input=nil, options = {} )
      super( input, options )
    end


    # - - - - - - - - - - - lexer rules - - - - - - - - - - - -
    # lexer rule and! (AND)
    # (in Rubik.g)
    def and!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 1 )



      type = AND
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 7:7: '&&'
      match( "&&" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 1 )


    end

    # lexer rule asgn! (ASGN)
    # (in Rubik.g)
    def asgn!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 2 )



      type = ASGN
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 8:8: '='
      match( 0x3d )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 2 )


    end

    # lexer rule break! (BREAK)
    # (in Rubik.g)
    def break!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 3 )



      type = BREAK
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 9:9: 'break'
      match( "break" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 3 )


    end

    # lexer rule change_color! (CHANGE_COLOR)
    # (in Rubik.g)
    def change_color!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 4 )



      type = CHANGE_COLOR
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 10:16: 'change_color'
      match( "change_color" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 4 )


    end

    # lexer rule change_dir! (CHANGE_DIR)
    # (in Rubik.g)
    def change_dir!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 5 )



      type = CHANGE_DIR
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 11:14: 'change_dir'
      match( "change_dir" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 5 )


    end

    # lexer rule comma! (COMMA)
    # (in Rubik.g)
    def comma!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 6 )



      type = COMMA
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 12:9: ','
      match( 0x2c )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 6 )


    end

    # lexer rule def! (DEF)
    # (in Rubik.g)
    def def!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 7 )



      type = DEF
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 13:7: 'def'
      match( "def" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 7 )


    end

    # lexer rule div! (DIV)
    # (in Rubik.g)
    def div!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 8 )



      type = DIV
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 14:7: '/'
      match( 0x2f )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 8 )


    end

    # lexer rule do! (DO)
    # (in Rubik.g)
    def do!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 9 )



      type = DO
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 15:6: 'do'
      match( "do" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 9 )


    end

    # lexer rule dot! (DOT)
    # (in Rubik.g)
    def dot!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 10 )



      type = DOT
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 16:7: '.'
      match( 0x2e )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 10 )


    end

    # lexer rule draw_circle! (DRAW_CIRCLE)
    # (in Rubik.g)
    def draw_circle!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 11 )



      type = DRAW_CIRCLE
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 17:15: 'draw_circle'
      match( "draw_circle" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 11 )


    end

    # lexer rule draw_square! (DRAW_SQUARE)
    # (in Rubik.g)
    def draw_square!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 12 )



      type = DRAW_SQUARE
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 18:15: 'draw_square'
      match( "draw_square" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 12 )


    end

    # lexer rule draw_triangle! (DRAW_TRIANGLE)
    # (in Rubik.g)
    def draw_triangle!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 13 )



      type = DRAW_TRIANGLE
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 19:17: 'draw_triangle'
      match( "draw_triangle" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 13 )


    end

    # lexer rule else! (ELSE)
    # (in Rubik.g)
    def else!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 14 )



      type = ELSE
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 20:8: 'else'
      match( "else" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 14 )


    end

    # lexer rule eq! (EQ)
    # (in Rubik.g)
    def eq!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )



      type = EQ
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 21:6: '=='
      match( "==" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 15 )


    end

    # lexer rule geq! (GEQ)
    # (in Rubik.g)
    def geq!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )



      type = GEQ
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 22:7: '>='
      match( ">=" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 16 )


    end

    # lexer rule greater! (GREATER)
    # (in Rubik.g)
    def greater!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )



      type = GREATER
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 23:11: '>'
      match( 0x3e )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 17 )


    end

    # lexer rule if! (IF)
    # (in Rubik.g)
    def if!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )



      type = IF
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 24:6: 'if'
      match( "if" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 18 )


    end

    # lexer rule lbrace! (LBRACE)
    # (in Rubik.g)
    def lbrace!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )



      type = LBRACE
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 25:10: '{'
      match( 0x7b )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 19 )


    end

    # lexer rule lbrak! (LBRAK)
    # (in Rubik.g)
    def lbrak!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )



      type = LBRAK
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 26:9: '['
      match( 0x5b )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 20 )


    end

    # lexer rule leq! (LEQ)
    # (in Rubik.g)
    def leq!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )



      type = LEQ
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 27:7: '<='
      match( "<=" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 21 )


    end

    # lexer rule less! (LESS)
    # (in Rubik.g)
    def less!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )



      type = LESS
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 28:8: '<'
      match( 0x3c )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 22 )


    end

    # lexer rule lparen! (LPAREN)
    # (in Rubik.g)
    def lparen!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 23 )



      type = LPAREN
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 29:10: '('
      match( 0x28 )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 23 )


    end

    # lexer rule minus! (MINUS)
    # (in Rubik.g)
    def minus!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )



      type = MINUS
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 30:9: '-'
      match( 0x2d )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 24 )


    end

    # lexer rule neg! (NEG)
    # (in Rubik.g)
    def neg!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )



      type = NEG
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 31:7: '!'
      match( 0x21 )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 25 )


    end

    # lexer rule neq! (NEQ)
    # (in Rubik.g)
    def neq!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )



      type = NEQ
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 32:7: '!='
      match( "!=" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 26 )


    end

    # lexer rule null! (NULL)
    # (in Rubik.g)
    def null!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )



      type = NULL
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 33:8: 'null'
      match( "null" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 27 )


    end

    # lexer rule or! (OR)
    # (in Rubik.g)
    def or!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )



      type = OR
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 34:6: '||'
      match( "||" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 28 )


    end

    # lexer rule pen_down! (PEN_DOWN)
    # (in Rubik.g)
    def pen_down!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 29 )



      type = PEN_DOWN
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 35:12: 'pen_down'
      match( "pen_down" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 29 )


    end

    # lexer rule pen_up! (PEN_UP)
    # (in Rubik.g)
    def pen_up!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )



      type = PEN_UP
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 36:10: 'pen_up'
      match( "pen_up" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 30 )


    end

    # lexer rule plus! (PLUS)
    # (in Rubik.g)
    def plus!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 31 )



      type = PLUS
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 37:8: '+'
      match( 0x2b )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 31 )


    end

    # lexer rule rbrace! (RBRACE)
    # (in Rubik.g)
    def rbrace!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 32 )



      type = RBRACE
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 38:10: '}'
      match( 0x7d )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 32 )


    end

    # lexer rule rbrak! (RBRAK)
    # (in Rubik.g)
    def rbrak!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 33 )



      type = RBRAK
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 39:9: ']'
      match( 0x5d )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 33 )


    end

    # lexer rule rparen! (RPAREN)
    # (in Rubik.g)
    def rparen!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 34 )



      type = RPAREN
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 40:10: ')'
      match( 0x29 )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 34 )


    end

    # lexer rule r_begin! (R_BEGIN)
    # (in Rubik.g)
    def r_begin!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 35 )



      type = R_BEGIN
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 41:11: 'begin'
      match( "begin" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 35 )


    end

    # lexer rule r_end! (R_END)
    # (in Rubik.g)
    def r_end!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 36 )



      type = R_END
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 42:9: 'end'
      match( "end" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 36 )


    end

    # lexer rule r_move! (R_MOVE)
    # (in Rubik.g)
    def r_move!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 37 )



      type = R_MOVE
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 43:10: 'move'
      match( "move" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 37 )


    end

    # lexer rule r_reset! (R_RESET)
    # (in Rubik.g)
    def r_reset!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 38 )



      type = R_RESET
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 44:11: 'reset'
      match( "reset" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 38 )


    end

    # lexer rule r_return! (R_RETURN)
    # (in Rubik.g)
    def r_return!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 39 )



      type = R_RETURN
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 45:12: 'return'
      match( "return" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 39 )


    end

    # lexer rule semi! (SEMI)
    # (in Rubik.g)
    def semi!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 40 )



      type = SEMI
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 46:8: ';'
      match( 0x3b )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 40 )


    end

    # lexer rule star! (STAR)
    # (in Rubik.g)
    def star!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 41 )



      type = STAR
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 47:8: '*'
      match( 0x2a )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 41 )


    end

    # lexer rule times! (TIMES)
    # (in Rubik.g)
    def times!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 42 )



      type = TIMES
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 48:9: 'times'
      match( "times" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 42 )


    end

    # lexer rule tlk! (TLK)
    # (in Rubik.g)
    def tlk!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 43 )



      type = TLK
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 49:7: 'talk'
      match( "talk" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 43 )


    end

    # lexer rule var! (VAR)
    # (in Rubik.g)
    def var!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 44 )



      type = VAR
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 50:7: 'var'
      match( "var" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 44 )


    end

    # lexer rule t__60! (T__60)
    # (in Rubik.g)
    def t__60!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 45 )



      type = T__60
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 51:9: 'change_direction'
      match( "change_direction" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 45 )


    end

    # lexer rule t__61! (T__61)
    # (in Rubik.g)
    def t__61!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 46 )



      type = T__61
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 52:9: 'print'
      match( "print" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 46 )


    end

    # lexer rule var_type! (VAR_TYPE)
    # (in Rubik.g)
    def var_type!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 47 )



      type = VAR_TYPE
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 236:5: ( 'boolean' | 'char' | 'float' | 'int' | 'void' )
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
        # at line 236:7: 'boolean'
        match( "boolean" )


      when 2
        # at line 237:7: 'char'
        match( "char" )


      when 3
        # at line 238:7: 'float'
        match( "float" )


      when 4
        # at line 239:7: 'int'
        match( "int" )


      when 5
        # at line 240:7: 'void'
        match( "void" )


      end

      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 47 )


    end

    # lexer rule boolean! (BOOLEAN)
    # (in Rubik.g)
    def boolean!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 48 )



      type = BOOLEAN
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 244:5: ( 'true' | 'false' )
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
        # at line 244:7: 'true'
        match( "true" )


      when 2
        # at line 245:7: 'false'
        match( "false" )


      end

      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 48 )


    end

    # lexer rule char! (CHAR)
    # (in Rubik.g)
    def char!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 49 )



      type = CHAR
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 249:7: ( '\\'' )+ ( 'a' .. 'z' | 'A' .. 'Z' )+ '\\''
      # at file 249:7: ( '\\'' )+
      match_count_3 = 0
      while true
        alt_3 = 2
        look_3_0 = @input.peek( 1 )

        if ( look_3_0 == 0x27 )
          alt_3 = 1

        end
        case alt_3
        when 1
          # at line 249:7: '\\''
          match( 0x27 )

        else
          match_count_3 > 0 and break
          eee = EarlyExit(3)


          raise eee
        end
        match_count_3 += 1
      end


      # at file 249:14: ( 'a' .. 'z' | 'A' .. 'Z' )+
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
      # trace_out( __method__, 49 )


    end

    # lexer rule color! (COLOR)
    # (in Rubik.g)
    def color!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 50 )



      type = COLOR
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 253:5: ( 'rBlack' | 'rBlue' | 'rGreen' | 'rOrange' | 'rPurple' | 'rRandom' | 'rWhite' | 'rYellow' | 'rRed' )
      alt_5 = 9
      look_5_0 = @input.peek( 1 )

      if ( look_5_0 == 0x72 )
        case look_5 = @input.peek( 2 )
        when 0x42 then look_5_2 = @input.peek( 3 )

        if ( look_5_2 == 0x6c )
          look_5_9 = @input.peek( 4 )

          if ( look_5_9 == 0x61 )
            alt_5 = 1
          elsif ( look_5_9 == 0x75 )
            alt_5 = 2
          else
            raise NoViableAlternative( "", 5, 9 )

          end
        else
          raise NoViableAlternative( "", 5, 2 )

        end
        when 0x47 then alt_5 = 3
        when 0x4f then alt_5 = 4
        when 0x50 then alt_5 = 5
        when 0x52 then look_5_6 = @input.peek( 3 )

        if ( look_5_6 == 0x61 )
          alt_5 = 6
        elsif ( look_5_6 == 0x65 )
          alt_5 = 9
        else
          raise NoViableAlternative( "", 5, 6 )

        end
        when 0x57 then alt_5 = 7
        when 0x59 then alt_5 = 8
        else
          raise NoViableAlternative( "", 5, 1 )

        end
      else
        raise NoViableAlternative( "", 5, 0 )

      end
      case alt_5
      when 1
        # at line 253:7: 'rBlack'
        match( "rBlack" )


      when 2
        # at line 254:7: 'rBlue'
        match( "rBlue" )


      when 3
        # at line 255:7: 'rGreen'
        match( "rGreen" )


      when 4
        # at line 256:7: 'rOrange'
        match( "rOrange" )


      when 5
        # at line 257:7: 'rPurple'
        match( "rPurple" )


      when 6
        # at line 258:7: 'rRandom'
        match( "rRandom" )


      when 7
        # at line 259:7: 'rWhite'
        match( "rWhite" )


      when 8
        # at line 260:7: 'rYellow'
        match( "rYellow" )


      when 9
        # at line 261:7: 'rRed'
        match( "rRed" )


      end

      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 50 )


    end

    # lexer rule dir! (DIR)
    # (in Rubik.g)
    def dir!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 51 )



      type = DIR
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 265:5: ( 'rDown' | 'rLeft' | 'rRight' | 'rUp' )
      alt_6 = 4
      look_6_0 = @input.peek( 1 )

      if ( look_6_0 == 0x72 )
        case look_6 = @input.peek( 2 )
        when 0x44 then alt_6 = 1
        when 0x4c then alt_6 = 2
        when 0x52 then alt_6 = 3
        when 0x55 then alt_6 = 4
        else
          raise NoViableAlternative( "", 6, 1 )

        end
      else
        raise NoViableAlternative( "", 6, 0 )

      end
      case alt_6
      when 1
        # at line 265:7: 'rDown'
        match( "rDown" )


      when 2
        # at line 266:7: 'rLeft'
        match( "rLeft" )


      when 3
        # at line 267:7: 'rRight'
        match( "rRight" )


      when 4
        # at line 268:7: 'rUp'
        match( "rUp" )


      end

      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 51 )


    end

    # lexer rule float! (FLOAT)
    # (in Rubik.g)
    def float!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 52 )



      type = FLOAT
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 272:7: ( '0' .. '9' )+ '.' ( '0' .. '9' )+
      # at file 272:7: ( '0' .. '9' )+
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


      match( 0x2e )
      # at file 272:23: ( '0' .. '9' )+
      match_count_8 = 0
      while true
        alt_8 = 2
        look_8_0 = @input.peek( 1 )

        if ( look_8_0.between?( 0x30, 0x39 ) )
          alt_8 = 1

        end
        case alt_8
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
          match_count_8 > 0 and break
          eee = EarlyExit(8)


          raise eee
        end
        match_count_8 += 1
      end




      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 52 )


    end

    # lexer rule int! (INT)
    # (in Rubik.g)
    def int!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 53 )



      type = INT
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 276:7: ( '0' .. '9' )+
      # at file 276:7: ( '0' .. '9' )+
      match_count_9 = 0
      while true
        alt_9 = 2
        look_9_0 = @input.peek( 1 )

        if ( look_9_0.between?( 0x30, 0x39 ) )
          alt_9 = 1

        end
        case alt_9
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
          match_count_9 > 0 and break
          eee = EarlyExit(9)


          raise eee
        end
        match_count_9 += 1
      end




      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 53 )


    end

    # lexer rule string! (STRING)
    # (in Rubik.g)
    def string!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 54 )



      type = STRING
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 280:5: ( '\\'' (~ ( '\\'' | '\\\\' ) | '\\\\' . )* '\\'' | '\"' (~ ( '\"' | '\\\\' ) | '\\\\' . )* '\"' )
      alt_12 = 2
      look_12_0 = @input.peek( 1 )

      if ( look_12_0 == 0x27 )
        alt_12 = 1
      elsif ( look_12_0 == 0x22 )
        alt_12 = 2
      else
        raise NoViableAlternative( "", 12, 0 )

      end
      case alt_12
      when 1
        # at line 280:7: '\\'' (~ ( '\\'' | '\\\\' ) | '\\\\' . )* '\\''
        match( 0x27 )
        # at line 280:12: (~ ( '\\'' | '\\\\' ) | '\\\\' . )*
        while true # decision 10
          alt_10 = 3
          look_10_0 = @input.peek( 1 )

          if ( look_10_0.between?( 0x0, 0x26 ) || look_10_0.between?( 0x28, 0x5b ) || look_10_0.between?( 0x5d, 0xffff ) )
            alt_10 = 1
          elsif ( look_10_0 == 0x5c )
            alt_10 = 2

          end
          case alt_10
          when 1
            # at line 280:13: ~ ( '\\'' | '\\\\' )
            if @input.peek( 1 ).between?( 0x0, 0x26 ) || @input.peek( 1 ).between?( 0x28, 0x5b ) || @input.peek( 1 ).between?( 0x5d, 0xff )
              @input.consume
            else
              mse = MismatchedSet( nil )
              recover mse
              raise mse

            end



          when 2
            # at line 280:30: '\\\\' .
            match( 0x5c )
            match_any

          else
            break # out of loop for decision 10
          end
        end # loop for decision 10

        match( 0x27 )

      when 2
        # at line 281:7: '\"' (~ ( '\"' | '\\\\' ) | '\\\\' . )* '\"'
        match( 0x22 )
        # at line 281:12: (~ ( '\"' | '\\\\' ) | '\\\\' . )*
        while true # decision 11
          alt_11 = 3
          look_11_0 = @input.peek( 1 )

          if ( look_11_0.between?( 0x0, 0x21 ) || look_11_0.between?( 0x23, 0x5b ) || look_11_0.between?( 0x5d, 0xffff ) )
            alt_11 = 1
          elsif ( look_11_0 == 0x5c )
            alt_11 = 2

          end
          case alt_11
          when 1
            # at line 281:13: ~ ( '\"' | '\\\\' )
            if @input.peek( 1 ).between?( 0x0, 0x21 ) || @input.peek( 1 ).between?( 0x23, 0x5b ) || @input.peek( 1 ).between?( 0x5d, 0xff )
              @input.consume
            else
              mse = MismatchedSet( nil )
              recover mse
              raise mse

            end



          when 2
            # at line 281:30: '\\\\' .
            match( 0x5c )
            match_any

          else
            break # out of loop for decision 11
          end
        end # loop for decision 11

        match( 0x22 )

      end

      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 54 )


    end

    # lexer rule id! (ID)
    # (in Rubik.g)
    def id!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 55 )



      type = ID
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 285:7: ( '_' | 'a' .. 'z' | 'A' .. 'Z' ) ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' )*
      if @input.peek( 1 ).between?( 0x41, 0x5a ) || @input.peek(1) == 0x5f || @input.peek( 1 ).between?( 0x61, 0x7a )
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse

      end


      # at line 285:35: ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' )*
      while true # decision 13
        alt_13 = 2
        look_13_0 = @input.peek( 1 )

        if ( look_13_0.between?( 0x30, 0x39 ) || look_13_0.between?( 0x41, 0x5a ) || look_13_0 == 0x5f || look_13_0.between?( 0x61, 0x7a ) )
          alt_13 = 1

        end
        case alt_13
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
          break # out of loop for decision 13
        end
      end # loop for decision 13



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 55 )


    end

    # lexer rule newline! (NEWLINE)
    # (in Rubik.g)
    def newline!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 56 )



      type = NEWLINE
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 289:7: ( '\\n' | '\\r' )+
      # at file 289:7: ( '\\n' | '\\r' )+
      match_count_14 = 0
      while true
        alt_14 = 2
        look_14_0 = @input.peek( 1 )

        if ( look_14_0 == 0xa || look_14_0 == 0xd )
          alt_14 = 1

        end
        case alt_14
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
          match_count_14 > 0 and break
          eee = EarlyExit(14)


          raise eee
        end
        match_count_14 += 1
      end



      # --> action
       channel = HIDDEN 
      # <-- action



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 56 )


    end

    # lexer rule ws! (WS)
    # (in Rubik.g)
    def ws!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 57 )



      type = WS
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 293:7: ( '\\t' | '\\f' | ' ' | '\\u00A0' )+
      # at file 293:7: ( '\\t' | '\\f' | ' ' | '\\u00A0' )+
      match_count_15 = 0
      while true
        alt_15 = 2
        look_15_0 = @input.peek( 1 )

        if ( look_15_0 == 0x9 || look_15_0 == 0xc || look_15_0 == 0x20 || look_15_0 == 0xa0 )
          alt_15 = 1

        end
        case alt_15
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
          match_count_15 > 0 and break
          eee = EarlyExit(15)


          raise eee
        end
        match_count_15 += 1
      end



      # --> action
       channel = HIDDEN 
      # <-- action



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 57 )


    end

    # main rule used to study the input at the current position,
    # and choose the proper lexer rule to call in order to
    # fetch the next token
    #
    # usually, you don't make direct calls to this method,
    # but instead use the next_token method, which will
    # build and emit the actual next token
    def token!
      # at line 1:8: ( AND | ASGN | BREAK | CHANGE_COLOR | CHANGE_DIR | COMMA | DEF | DIV | DO | DOT | DRAW_CIRCLE | DRAW_SQUARE | DRAW_TRIANGLE | ELSE | EQ | GEQ | GREATER | IF | LBRACE | LBRAK | LEQ | LESS | LPAREN | MINUS | NEG | NEQ | NULL | OR | PEN_DOWN | PEN_UP | PLUS | RBRACE | RBRAK | RPAREN | R_BEGIN | R_END | R_MOVE | R_RESET | R_RETURN | SEMI | STAR | TIMES | TLK | VAR | T__60 | T__61 | VAR_TYPE | BOOLEAN | CHAR | COLOR | DIR | FLOAT | INT | STRING | ID | NEWLINE | WS )
      alt_16 = 57
      alt_16 = @dfa16.predict( @input )
      case alt_16
      when 1
        # at line 1:10: AND
        and!


      when 2
        # at line 1:14: ASGN
        asgn!


      when 3
        # at line 1:19: BREAK
        break!


      when 4
        # at line 1:25: CHANGE_COLOR
        change_color!


      when 5
        # at line 1:38: CHANGE_DIR
        change_dir!


      when 6
        # at line 1:49: COMMA
        comma!


      when 7
        # at line 1:55: DEF
        def!


      when 8
        # at line 1:59: DIV
        div!


      when 9
        # at line 1:63: DO
        do!


      when 10
        # at line 1:66: DOT
        dot!


      when 11
        # at line 1:70: DRAW_CIRCLE
        draw_circle!


      when 12
        # at line 1:82: DRAW_SQUARE
        draw_square!


      when 13
        # at line 1:94: DRAW_TRIANGLE
        draw_triangle!


      when 14
        # at line 1:108: ELSE
        else!


      when 15
        # at line 1:113: EQ
        eq!


      when 16
        # at line 1:116: GEQ
        geq!


      when 17
        # at line 1:120: GREATER
        greater!


      when 18
        # at line 1:128: IF
        if!


      when 19
        # at line 1:131: LBRACE
        lbrace!


      when 20
        # at line 1:138: LBRAK
        lbrak!


      when 21
        # at line 1:144: LEQ
        leq!


      when 22
        # at line 1:148: LESS
        less!


      when 23
        # at line 1:153: LPAREN
        lparen!


      when 24
        # at line 1:160: MINUS
        minus!


      when 25
        # at line 1:166: NEG
        neg!


      when 26
        # at line 1:170: NEQ
        neq!


      when 27
        # at line 1:174: NULL
        null!


      when 28
        # at line 1:179: OR
        or!


      when 29
        # at line 1:182: PEN_DOWN
        pen_down!


      when 30
        # at line 1:191: PEN_UP
        pen_up!


      when 31
        # at line 1:198: PLUS
        plus!


      when 32
        # at line 1:203: RBRACE
        rbrace!


      when 33
        # at line 1:210: RBRAK
        rbrak!


      when 34
        # at line 1:216: RPAREN
        rparen!


      when 35
        # at line 1:223: R_BEGIN
        r_begin!


      when 36
        # at line 1:231: R_END
        r_end!


      when 37
        # at line 1:237: R_MOVE
        r_move!


      when 38
        # at line 1:244: R_RESET
        r_reset!


      when 39
        # at line 1:252: R_RETURN
        r_return!


      when 40
        # at line 1:261: SEMI
        semi!


      when 41
        # at line 1:266: STAR
        star!


      when 42
        # at line 1:271: TIMES
        times!


      when 43
        # at line 1:277: TLK
        tlk!


      when 44
        # at line 1:281: VAR
        var!


      when 45
        # at line 1:285: T__60
        t__60!


      when 46
        # at line 1:291: T__61
        t__61!


      when 47
        # at line 1:297: VAR_TYPE
        var_type!


      when 48
        # at line 1:306: BOOLEAN
        boolean!


      when 49
        # at line 1:314: CHAR
        char!


      when 50
        # at line 1:319: COLOR
        color!


      when 51
        # at line 1:325: DIR
        dir!


      when 52
        # at line 1:329: FLOAT
        float!


      when 53
        # at line 1:335: INT
        int!


      when 54
        # at line 1:339: STRING
        string!


      when 55
        # at line 1:346: ID
        id!


      when 56
        # at line 1:349: NEWLINE
        newline!


      when 57
        # at line 1:357: WS
        ws!


      end
    end


    # - - - - - - - - - - DFA definitions - - - - - - - - - - -
    class DFA16 < ANTLR3::DFA
      EOT = unpack( 2, -1, 1, 39, 2, 35, 1, -1, 1, 35, 2, -1, 1, 35, 1, 
                    50, 1, 35, 2, -1, 1, 54, 2, -1, 1, 56, 1, 35, 1, -1, 
                    1, 35, 4, -1, 2, 35, 2, -1, 3, 35, 1, -1, 1, 82, 6, 
                    -1, 5, 35, 1, 88, 3, 35, 2, -1, 1, 92, 1, 35, 4, -1, 
                    22, 35, 1, -1, 1, 34, 2, -1, 4, 35, 1, 126, 1, -1, 2, 
                    35, 1, 129, 1, -1, 1, 130, 17, 35, 1, 149, 3, 35, 1, 
                    153, 3, 35, 2, -1, 4, 35, 1, 130, 1, -1, 1, 35, 1, 162, 
                    2, -1, 1, 163, 2, 35, 1, 167, 8, 35, 1, 176, 5, 35, 
                    1, -1, 1, 35, 1, 183, 1, 184, 1, -1, 1, 130, 2, 35, 
                    1, 187, 1, 188, 3, 35, 2, -1, 2, 35, 1, 196, 1, -1, 
                    1, 197, 2, 35, 1, 176, 4, 35, 1, -1, 3, 35, 2, 149, 
                    1, 207, 2, -1, 1, 130, 1, 184, 2, -1, 6, 35, 1, 214, 
                    2, -1, 1, 215, 2, 176, 3, 35, 1, 149, 1, 176, 1, 35, 
                    1, -1, 1, 130, 5, 35, 2, -1, 4, 176, 5, 35, 1, 231, 
                    5, 35, 1, -1, 1, 35, 1, 239, 5, 35, 1, -1, 1, 245, 1, 
                    246, 1, 35, 1, 248, 1, 35, 2, -1, 1, 35, 1, -1, 1, 35, 
                    1, 252, 1, 35, 1, -1, 1, 35, 1, 255, 1, -1 )
      EOF = unpack( 256, -1 )
      MIN = unpack( 1, 9, 1, -1, 1, 61, 1, 101, 1, 104, 1, -1, 1, 101, 2, 
                    -1, 1, 108, 1, 61, 1, 102, 2, -1, 1, 61, 2, -1, 1, 61, 
                    1, 117, 1, -1, 1, 101, 4, -1, 1, 111, 1, 66, 2, -1, 
                    3, 97, 1, 0, 1, 46, 6, -1, 1, 101, 1, 103, 1, 111, 1, 
                    97, 1, 102, 1, 48, 1, 97, 1, 115, 1, 100, 2, -1, 1, 
                    48, 1, 116, 4, -1, 1, 108, 1, 110, 1, 105, 1, 118, 1, 
                    115, 1, 108, 2, 114, 1, 117, 1, 97, 1, 104, 1, 101, 
                    1, 111, 1, 101, 1, 112, 1, 109, 1, 108, 1, 117, 1, 114, 
                    1, 105, 1, 111, 1, 108, 1, 0, 1, 39, 2, -1, 1, 97, 1, 
                    105, 1, 108, 1, 110, 1, 48, 1, -1, 1, 119, 1, 101, 1, 
                    48, 1, -1, 1, 48, 1, 108, 1, 95, 1, 110, 2, 101, 1, 
                    117, 1, 97, 1, 101, 1, 97, 1, 114, 1, 110, 1, 100, 1, 
                    103, 1, 105, 1, 108, 1, 119, 1, 102, 1, 48, 1, 101, 
                    1, 107, 1, 101, 1, 48, 1, 100, 1, 97, 1, 115, 2, -1, 
                    1, 107, 1, 110, 1, 101, 1, 103, 1, 48, 1, -1, 1, 95, 
                    1, 48, 2, -1, 1, 48, 1, 100, 1, 116, 1, 48, 1, 116, 
                    1, 114, 1, 99, 2, 101, 1, 110, 1, 112, 1, 100, 1, 48, 
                    1, 104, 1, 116, 1, 108, 1, 110, 1, 116, 1, -1, 1, 115, 
                    2, 48, 1, -1, 1, 48, 1, 116, 1, 101, 2, 48, 1, 97, 1, 
                    101, 1, 99, 2, -1, 1, 111, 1, 112, 1, 48, 1, -1, 1, 
                    48, 1, 110, 1, 107, 1, 48, 1, 110, 1, 103, 1, 108, 1, 
                    111, 1, -1, 1, 116, 1, 101, 1, 111, 3, 48, 2, -1, 2, 
                    48, 2, -1, 1, 110, 1, 95, 1, 105, 1, 113, 1, 114, 1, 
                    119, 1, 48, 2, -1, 3, 48, 2, 101, 1, 109, 2, 48, 1, 
                    119, 1, -1, 1, 48, 1, 99, 1, 114, 1, 117, 1, 105, 1, 
                    110, 2, -1, 4, 48, 1, 111, 1, 105, 1, 99, 2, 97, 1, 
                    48, 1, 108, 1, 114, 1, 108, 1, 114, 1, 110, 1, -1, 1, 
                    111, 1, 48, 2, 101, 1, 103, 1, 114, 1, 99, 1, -1, 2, 
                    48, 1, 108, 1, 48, 1, 116, 2, -1, 1, 101, 1, -1, 1, 
                    105, 1, 48, 1, 111, 1, -1, 1, 110, 1, 48, 1, -1 )
      MAX = unpack( 1, 160, 1, -1, 1, 61, 1, 114, 1, 104, 1, -1, 1, 114, 
                    2, -1, 1, 110, 1, 61, 1, 110, 2, -1, 1, 61, 2, -1, 1, 
                    61, 1, 117, 1, -1, 1, 114, 4, -1, 1, 111, 1, 101, 2, 
                    -1, 1, 114, 1, 111, 1, 108, 1, -1, 1, 57, 6, -1, 1, 
                    101, 1, 103, 1, 111, 1, 97, 1, 102, 1, 122, 1, 97, 1, 
                    115, 1, 100, 2, -1, 1, 122, 1, 116, 4, -1, 1, 108, 1, 
                    110, 1, 105, 1, 118, 1, 116, 1, 108, 2, 114, 1, 117, 
                    1, 105, 1, 104, 1, 101, 1, 111, 1, 101, 1, 112, 1, 109, 
                    1, 108, 1, 117, 1, 114, 1, 105, 1, 111, 1, 108, 1, -1, 
                    1, 122, 2, -1, 1, 97, 1, 105, 1, 108, 1, 114, 1, 122, 
                    1, -1, 1, 119, 1, 101, 1, 122, 1, -1, 1, 122, 1, 108, 
                    1, 95, 1, 110, 2, 101, 2, 117, 1, 101, 1, 97, 1, 114, 
                    1, 110, 1, 100, 1, 103, 1, 105, 1, 108, 1, 119, 1, 102, 
                    1, 122, 1, 101, 1, 107, 1, 101, 1, 122, 1, 100, 1, 97, 
                    1, 115, 2, -1, 1, 107, 1, 110, 1, 101, 1, 103, 1, 122, 
                    1, -1, 1, 95, 1, 122, 2, -1, 1, 122, 1, 117, 1, 116, 
                    1, 122, 1, 116, 1, 114, 1, 99, 2, 101, 1, 110, 1, 112, 
                    1, 100, 1, 122, 1, 104, 1, 116, 1, 108, 1, 110, 1, 116, 
                    1, -1, 1, 115, 2, 122, 1, -1, 1, 122, 1, 116, 1, 101, 
                    2, 122, 1, 97, 1, 101, 1, 116, 2, -1, 1, 111, 1, 112, 
                    1, 122, 1, -1, 1, 122, 1, 110, 1, 107, 1, 122, 1, 110, 
                    1, 103, 1, 108, 1, 111, 1, -1, 1, 116, 1, 101, 1, 111, 
                    3, 122, 2, -1, 2, 122, 2, -1, 1, 110, 1, 95, 1, 105, 
                    1, 113, 1, 114, 1, 119, 1, 122, 2, -1, 3, 122, 2, 101, 
                    1, 109, 2, 122, 1, 119, 1, -1, 1, 122, 1, 100, 1, 114, 
                    1, 117, 1, 105, 1, 110, 2, -1, 4, 122, 1, 111, 1, 105, 
                    1, 99, 2, 97, 1, 122, 1, 108, 1, 114, 1, 108, 1, 114, 
                    1, 110, 1, -1, 1, 111, 1, 122, 2, 101, 1, 103, 1, 114, 
                    1, 99, 1, -1, 2, 122, 1, 108, 1, 122, 1, 116, 2, -1, 
                    1, 101, 1, -1, 1, 105, 1, 122, 1, 111, 1, -1, 1, 110, 
                    1, 122, 1, -1 )
      ACCEPT = unpack( 1, -1, 1, 1, 3, -1, 1, 6, 1, -1, 1, 8, 1, 10, 3, 
                       -1, 1, 19, 1, 20, 1, -1, 1, 23, 1, 24, 2, -1, 1, 
                       28, 1, -1, 1, 31, 1, 32, 1, 33, 1, 34, 2, -1, 1, 
                       40, 1, 41, 5, -1, 1, 54, 1, 55, 1, 56, 1, 57, 1, 
                       15, 1, 2, 9, -1, 1, 16, 1, 17, 2, -1, 1, 21, 1, 22, 
                       1, 26, 1, 25, 24, -1, 1, 52, 1, 53, 5, -1, 1, 9, 
                       3, -1, 1, 18, 26, -1, 2, 49, 5, -1, 1, 7, 2, -1, 
                       1, 36, 1, 47, 18, -1, 1, 51, 3, -1, 1, 44, 8, -1, 
                       1, 14, 1, 27, 3, -1, 1, 37, 8, -1, 1, 50, 6, -1, 
                       1, 43, 1, 48, 2, -1, 1, 3, 1, 35, 7, -1, 1, 46, 1, 
                       38, 9, -1, 1, 42, 6, -1, 1, 30, 1, 39, 15, -1, 1, 
                       29, 7, -1, 1, 5, 5, -1, 1, 11, 1, 12, 1, -1, 1, 4, 
                       3, -1, 1, 13, 2, -1, 1, 45 )
      SPECIAL = unpack( 32, -1, 1, 0, 46, -1, 1, 1, 176, -1 )
      TRANSITION = [
        unpack( 1, 37, 1, 36, 1, -1, 1, 37, 1, 36, 18, -1, 1, 37, 1, 17, 
                1, 34, 3, -1, 1, 1, 1, 32, 1, 15, 1, 24, 1, 28, 1, 21, 1, 
                5, 1, 16, 1, 8, 1, 7, 10, 33, 1, -1, 1, 27, 1, 14, 1, 2, 
                1, 10, 2, -1, 26, 35, 1, 13, 1, -1, 1, 23, 1, -1, 1, 35, 
                1, -1, 1, 35, 1, 3, 1, 4, 1, 6, 1, 9, 1, 31, 2, 35, 1, 11, 
                3, 35, 1, 25, 1, 18, 1, 35, 1, 20, 1, 35, 1, 26, 1, 35, 
                1, 29, 1, 35, 1, 30, 4, 35, 1, 12, 1, 19, 1, 22, 34, -1, 
                1, 37 ),
        unpack(  ),
        unpack( 1, 38 ),
        unpack( 1, 41, 9, -1, 1, 42, 2, -1, 1, 40 ),
        unpack( 1, 43 ),
        unpack(  ),
        unpack( 1, 44, 9, -1, 1, 45, 2, -1, 1, 46 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 47, 1, -1, 1, 48 ),
        unpack( 1, 49 ),
        unpack( 1, 51, 7, -1, 1, 52 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 53 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 55 ),
        unpack( 1, 57 ),
        unpack(  ),
        unpack( 1, 58, 12, -1, 1, 59 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 60 ),
        unpack( 1, 62, 1, -1, 1, 69, 2, -1, 1, 63, 4, -1, 1, 70, 2, -1, 
                 1, 64, 1, 65, 1, -1, 1, 66, 2, -1, 1, 71, 1, -1, 1, 67, 
                 1, -1, 1, 68, 11, -1, 1, 61 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 73, 7, -1, 1, 72, 8, -1, 1, 74 ),
        unpack( 1, 75, 13, -1, 1, 76 ),
        unpack( 1, 78, 10, -1, 1, 77 ),
        unpack( 39, 34, 1, 80, 25, 34, 26, 79, 6, 34, 26, 79, 65413, 34 ),
        unpack( 1, 81, 1, -1, 10, 33 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 83 ),
        unpack( 1, 84 ),
        unpack( 1, 85 ),
        unpack( 1, 86 ),
        unpack( 1, 87 ),
        unpack( 10, 35, 7, -1, 26, 35, 4, -1, 1, 35, 1, -1, 26, 35 ),
        unpack( 1, 89 ),
        unpack( 1, 90 ),
        unpack( 1, 91 ),
        unpack(  ),
        unpack(  ),
        unpack( 10, 35, 7, -1, 26, 35, 4, -1, 1, 35, 1, -1, 26, 35 ),
        unpack( 1, 93 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 94 ),
        unpack( 1, 95 ),
        unpack( 1, 96 ),
        unpack( 1, 97 ),
        unpack( 1, 98, 1, 99 ),
        unpack( 1, 100 ),
        unpack( 1, 101 ),
        unpack( 1, 102 ),
        unpack( 1, 103 ),
        unpack( 1, 104, 3, -1, 1, 105, 3, -1, 1, 106 ),
        unpack( 1, 107 ),
        unpack( 1, 108 ),
        unpack( 1, 109 ),
        unpack( 1, 110 ),
        unpack( 1, 111 ),
        unpack( 1, 112 ),
        unpack( 1, 113 ),
        unpack( 1, 114 ),
        unpack( 1, 115 ),
        unpack( 1, 116 ),
        unpack( 1, 117 ),
        unpack( 1, 118 ),
        unpack( 39, 34, 1, 119, 25, 34, 26, 79, 6, 34, 26, 79, 65413, 34 ),
        unpack( 1, 120, 25, -1, 26, 120, 6, -1, 26, 120 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 121 ),
        unpack( 1, 122 ),
        unpack( 1, 123 ),
        unpack( 1, 124, 3, -1, 1, 125 ),
        unpack( 10, 35, 7, -1, 26, 35, 4, -1, 1, 35, 1, -1, 26, 35 ),
        unpack(  ),
        unpack( 1, 127 ),
        unpack( 1, 128 ),
        unpack( 10, 35, 7, -1, 26, 35, 4, -1, 1, 35, 1, -1, 26, 35 ),
        unpack(  ),
        unpack( 10, 35, 7, -1, 26, 35, 4, -1, 1, 35, 1, -1, 26, 35 ),
        unpack( 1, 131 ),
        unpack( 1, 132 ),
        unpack( 1, 133 ),
        unpack( 1, 134 ),
        unpack( 1, 135 ),
        unpack( 1, 136 ),
        unpack( 1, 137, 19, -1, 1, 138 ),
        unpack( 1, 139 ),
        unpack( 1, 140 ),
        unpack( 1, 141 ),
        unpack( 1, 142 ),
        unpack( 1, 143 ),
        unpack( 1, 144 ),
        unpack( 1, 145 ),
        unpack( 1, 146 ),
        unpack( 1, 147 ),
        unpack( 1, 148 ),
        unpack( 10, 35, 7, -1, 26, 35, 4, -1, 1, 35, 1, -1, 26, 35 ),
        unpack( 1, 150 ),
        unpack( 1, 151 ),
        unpack( 1, 152 ),
        unpack( 10, 35, 7, -1, 26, 35, 4, -1, 1, 35, 1, -1, 26, 35 ),
        unpack( 1, 154 ),
        unpack( 1, 155 ),
        unpack( 1, 156 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 157 ),
        unpack( 1, 158 ),
        unpack( 1, 159 ),
        unpack( 1, 160 ),
        unpack( 10, 35, 7, -1, 26, 35, 4, -1, 1, 35, 1, -1, 26, 35 ),
        unpack(  ),
        unpack( 1, 161 ),
        unpack( 10, 35, 7, -1, 26, 35, 4, -1, 1, 35, 1, -1, 26, 35 ),
        unpack(  ),
        unpack(  ),
        unpack( 10, 35, 7, -1, 26, 35, 4, -1, 1, 35, 1, -1, 26, 35 ),
        unpack( 1, 164, 16, -1, 1, 165 ),
        unpack( 1, 166 ),
        unpack( 10, 35, 7, -1, 26, 35, 4, -1, 1, 35, 1, -1, 26, 35 ),
        unpack( 1, 168 ),
        unpack( 1, 169 ),
        unpack( 1, 170 ),
        unpack( 1, 171 ),
        unpack( 1, 172 ),
        unpack( 1, 173 ),
        unpack( 1, 174 ),
        unpack( 1, 175 ),
        unpack( 10, 35, 7, -1, 26, 35, 4, -1, 1, 35, 1, -1, 26, 35 ),
        unpack( 1, 177 ),
        unpack( 1, 178 ),
        unpack( 1, 179 ),
        unpack( 1, 180 ),
        unpack( 1, 181 ),
        unpack(  ),
        unpack( 1, 182 ),
        unpack( 10, 35, 7, -1, 26, 35, 4, -1, 1, 35, 1, -1, 26, 35 ),
        unpack( 10, 35, 7, -1, 26, 35, 4, -1, 1, 35, 1, -1, 26, 35 ),
        unpack(  ),
        unpack( 10, 35, 7, -1, 26, 35, 4, -1, 1, 35, 1, -1, 26, 35 ),
        unpack( 1, 185 ),
        unpack( 1, 186 ),
        unpack( 10, 35, 7, -1, 26, 35, 4, -1, 1, 35, 1, -1, 26, 35 ),
        unpack( 10, 35, 7, -1, 26, 35, 4, -1, 1, 35, 1, -1, 26, 35 ),
        unpack( 1, 189 ),
        unpack( 1, 190 ),
        unpack( 1, 191, 15, -1, 1, 192, 1, 193 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 194 ),
        unpack( 1, 195 ),
        unpack( 10, 35, 7, -1, 26, 35, 4, -1, 1, 35, 1, -1, 26, 35 ),
        unpack(  ),
        unpack( 10, 35, 7, -1, 26, 35, 4, -1, 1, 35, 1, -1, 26, 35 ),
        unpack( 1, 198 ),
        unpack( 1, 199 ),
        unpack( 10, 35, 7, -1, 26, 35, 4, -1, 1, 35, 1, -1, 26, 35 ),
        unpack( 1, 200 ),
        unpack( 1, 201 ),
        unpack( 1, 202 ),
        unpack( 1, 203 ),
        unpack(  ),
        unpack( 1, 204 ),
        unpack( 1, 205 ),
        unpack( 1, 206 ),
        unpack( 10, 35, 7, -1, 26, 35, 4, -1, 1, 35, 1, -1, 26, 35 ),
        unpack( 10, 35, 7, -1, 26, 35, 4, -1, 1, 35, 1, -1, 26, 35 ),
        unpack( 10, 35, 7, -1, 26, 35, 4, -1, 1, 35, 1, -1, 26, 35 ),
        unpack(  ),
        unpack(  ),
        unpack( 10, 35, 7, -1, 26, 35, 4, -1, 1, 35, 1, -1, 26, 35 ),
        unpack( 10, 35, 7, -1, 26, 35, 4, -1, 1, 35, 1, -1, 26, 35 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 208 ),
        unpack( 1, 209 ),
        unpack( 1, 210 ),
        unpack( 1, 211 ),
        unpack( 1, 212 ),
        unpack( 1, 213 ),
        unpack( 10, 35, 7, -1, 26, 35, 4, -1, 1, 35, 1, -1, 26, 35 ),
        unpack(  ),
        unpack(  ),
        unpack( 10, 35, 7, -1, 26, 35, 4, -1, 1, 35, 1, -1, 26, 35 ),
        unpack( 10, 35, 7, -1, 26, 35, 4, -1, 1, 35, 1, -1, 26, 35 ),
        unpack( 10, 35, 7, -1, 26, 35, 4, -1, 1, 35, 1, -1, 26, 35 ),
        unpack( 1, 216 ),
        unpack( 1, 217 ),
        unpack( 1, 218 ),
        unpack( 10, 35, 7, -1, 26, 35, 4, -1, 1, 35, 1, -1, 26, 35 ),
        unpack( 10, 35, 7, -1, 26, 35, 4, -1, 1, 35, 1, -1, 26, 35 ),
        unpack( 1, 219 ),
        unpack(  ),
        unpack( 10, 35, 7, -1, 26, 35, 4, -1, 1, 35, 1, -1, 26, 35 ),
        unpack( 1, 220, 1, 221 ),
        unpack( 1, 222 ),
        unpack( 1, 223 ),
        unpack( 1, 224 ),
        unpack( 1, 225 ),
        unpack(  ),
        unpack(  ),
        unpack( 10, 35, 7, -1, 26, 35, 4, -1, 1, 35, 1, -1, 26, 35 ),
        unpack( 10, 35, 7, -1, 26, 35, 4, -1, 1, 35, 1, -1, 26, 35 ),
        unpack( 10, 35, 7, -1, 26, 35, 4, -1, 1, 35, 1, -1, 26, 35 ),
        unpack( 10, 35, 7, -1, 26, 35, 4, -1, 1, 35, 1, -1, 26, 35 ),
        unpack( 1, 226 ),
        unpack( 1, 227 ),
        unpack( 1, 228 ),
        unpack( 1, 229 ),
        unpack( 1, 230 ),
        unpack( 10, 35, 7, -1, 26, 35, 4, -1, 1, 35, 1, -1, 26, 35 ),
        unpack( 1, 232 ),
        unpack( 1, 233 ),
        unpack( 1, 234 ),
        unpack( 1, 235 ),
        unpack( 1, 236 ),
        unpack(  ),
        unpack( 1, 237 ),
        unpack( 10, 35, 7, -1, 26, 35, 4, -1, 1, 35, 1, -1, 4, 35, 1, 238, 
                 21, 35 ),
        unpack( 1, 240 ),
        unpack( 1, 241 ),
        unpack( 1, 242 ),
        unpack( 1, 243 ),
        unpack( 1, 244 ),
        unpack(  ),
        unpack( 10, 35, 7, -1, 26, 35, 4, -1, 1, 35, 1, -1, 26, 35 ),
        unpack( 10, 35, 7, -1, 26, 35, 4, -1, 1, 35, 1, -1, 26, 35 ),
        unpack( 1, 247 ),
        unpack( 10, 35, 7, -1, 26, 35, 4, -1, 1, 35, 1, -1, 26, 35 ),
        unpack( 1, 249 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 250 ),
        unpack(  ),
        unpack( 1, 251 ),
        unpack( 10, 35, 7, -1, 26, 35, 4, -1, 1, 35, 1, -1, 26, 35 ),
        unpack( 1, 253 ),
        unpack(  ),
        unpack( 1, 254 ),
        unpack( 10, 35, 7, -1, 26, 35, 4, -1, 1, 35, 1, -1, 26, 35 ),
        unpack(  )
      ].freeze

      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end

      @decision = 16


      def description
        <<-'__dfa_description__'.strip!
          1:1: Tokens : ( AND | ASGN | BREAK | CHANGE_COLOR | CHANGE_DIR | COMMA | DEF | DIV | DO | DOT | DRAW_CIRCLE | DRAW_SQUARE | DRAW_TRIANGLE | ELSE | EQ | GEQ | GREATER | IF | LBRACE | LBRAK | LEQ | LESS | LPAREN | MINUS | NEG | NEQ | NULL | OR | PEN_DOWN | PEN_UP | PLUS | RBRACE | RBRAK | RPAREN | R_BEGIN | R_END | R_MOVE | R_RESET | R_RETURN | SEMI | STAR | TIMES | TLK | VAR | T__60 | T__61 | VAR_TYPE | BOOLEAN | CHAR | COLOR | DIR | FLOAT | INT | STRING | ID | NEWLINE | WS );
        __dfa_description__
      end

    end


    private

    def initialize_dfas
      super rescue nil
      @dfa16 = DFA16.new( self, 16 ) do |s|
        case s
        when 0
          look_16_32 = @input.peek
          s = -1
          if ( look_16_32.between?( 0x41, 0x5a ) || look_16_32.between?( 0x61, 0x7a ) )
            s = 79
          elsif ( look_16_32 == 0x27 )
            s = 80
          elsif ( look_16_32.between?( 0x0, 0x26 ) || look_16_32.between?( 0x28, 0x40 ) || look_16_32.between?( 0x5b, 0x60 ) || look_16_32.between?( 0x7b, 0xffff ) )
            s = 34
          end

        when 1
          look_16_79 = @input.peek
          s = -1
          if ( look_16_79 == 0x27 )
            s = 119
          elsif ( look_16_79.between?( 0x41, 0x5a ) || look_16_79.between?( 0x61, 0x7a ) )
            s = 79
          elsif ( look_16_79.between?( 0x0, 0x26 ) || look_16_79.between?( 0x28, 0x40 ) || look_16_79.between?( 0x5b, 0x60 ) || look_16_79.between?( 0x7b, 0xffff ) )
            s = 34
          end

        end

        if s < 0
          nva = ANTLR3::Error::NoViableAlternative.new( @dfa16.description, 16, s, input )
          @dfa16.error( nva )
          raise nva
        end

        s
      end


    end

  end # class Lexer < ANTLR3::Lexer

  at_exit { Lexer.main( ARGV ) } if __FILE__ == $0

end
