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
                     "DRAW_RECTANGLE", "DRAW_SQUARE", "ELSE", "EQ", "GEQ", 
                     "GREATER", "IF", "LBRACE", "LBRAK", "LEQ", "LESS", 
                     "LPAREN", "MINUS", "NEG", "NEQ", "NULL", "OR", "PEN_DOWN", 
                     "PEN_UP", "PLUS", "RBRACE", "RBRAK", "RPAREN", "R_BEGIN", 
                     "R_END", "R_MOVE", "R_RESET", "R_RETURN", "SEMI", "STAR", 
                     "TIMES", "TLK", "T__58", "T__59", "VAR_TYPE", "BOOLEAN", 
                     "COLOR", "DIR", "FLOAT", "INT", "STRING", "ID", "NEWLINE", 
                     "WS" ].freeze
    RULE_METHODS = [ :and!, :asgn!, :break!, :change_color!, :change_dir!, 
                     :comma!, :def!, :div!, :do!, :dot!, :draw_circle!, 
                     :draw_rectangle!, :draw_square!, :else!, :eq!, :geq!, 
                     :greater!, :if!, :lbrace!, :lbrak!, :leq!, :less!, 
                     :lparen!, :minus!, :neg!, :neq!, :null!, :or!, :pen_down!, 
                     :pen_up!, :plus!, :rbrace!, :rbrak!, :rparen!, :r_begin!, 
                     :r_end!, :r_move!, :r_reset!, :r_return!, :semi!, :star!, 
                     :times!, :tlk!, :t__58!, :t__59!, :var_type!, :boolean!, 
                     :color!, :dir!, :float!, :int!, :string!, :id!, :newline!, 
                     :ws! ].freeze

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
      # at line 11:14: 'change_direction'
      match( "change_direction" )



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

    # lexer rule draw_rectangle! (DRAW_RECTANGLE)
    # (in Rubik.g)
    def draw_rectangle!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 12 )



      type = DRAW_RECTANGLE
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 18:18: 'draw_rectangle'
      match( "draw_rectangle" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 12 )


    end

    # lexer rule draw_square! (DRAW_SQUARE)
    # (in Rubik.g)
    def draw_square!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 13 )



      type = DRAW_SQUARE
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 19:15: 'draw_square'
      match( "draw_square" )



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

    # lexer rule t__58! (T__58)
    # (in Rubik.g)
    def t__58!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 44 )



      type = T__58
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 50:9: 'gets'
      match( "gets" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 44 )


    end

    # lexer rule t__59! (T__59)
    # (in Rubik.g)
    def t__59!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 45 )



      type = T__59
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 51:9: 'print'
      match( "print" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 45 )


    end

    # lexer rule var_type! (VAR_TYPE)
    # (in Rubik.g)
    def var_type!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 46 )



      type = VAR_TYPE
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 262:5: ( 'boolean' | 'float' | 'int' | 'string' | 'void' )
      alt_1 = 5
      case look_1 = @input.peek( 1 )
      when 0x62 then alt_1 = 1
      when 0x66 then alt_1 = 2
      when 0x69 then alt_1 = 3
      when 0x73 then alt_1 = 4
      when 0x76 then alt_1 = 5
      else
        raise NoViableAlternative( "", 1, 0 )

      end
      case alt_1
      when 1
        # at line 262:7: 'boolean'
        match( "boolean" )


      when 2
        # at line 263:7: 'float'
        match( "float" )


      when 3
        # at line 264:7: 'int'
        match( "int" )


      when 4
        # at line 265:7: 'string'
        match( "string" )


      when 5
        # at line 266:7: 'void'
        match( "void" )


      end

      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 46 )


    end

    # lexer rule boolean! (BOOLEAN)
    # (in Rubik.g)
    def boolean!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 47 )



      type = BOOLEAN
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 270:5: ( 'true' | 'false' )
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
        # at line 270:7: 'true'
        match( "true" )


      when 2
        # at line 271:7: 'false'
        match( "false" )


      end

      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 47 )


    end

    # lexer rule color! (COLOR)
    # (in Rubik.g)
    def color!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 48 )



      type = COLOR
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 275:5: ( 'black' | 'blue' | 'green' | 'orange' | 'purple' | 'random' | 'white' | 'yellow' | 'red' )
      alt_3 = 9
      case look_3 = @input.peek( 1 )
      when 0x62 then look_3_1 = @input.peek( 2 )

      if ( look_3_1 == 0x6c )
        look_3_8 = @input.peek( 3 )

        if ( look_3_8 == 0x61 )
          alt_3 = 1
        elsif ( look_3_8 == 0x75 )
          alt_3 = 2
        else
          raise NoViableAlternative( "", 3, 8 )

        end
      else
        raise NoViableAlternative( "", 3, 1 )

      end
      when 0x67 then alt_3 = 3
      when 0x6f then alt_3 = 4
      when 0x70 then alt_3 = 5
      when 0x72 then look_3_5 = @input.peek( 2 )

      if ( look_3_5 == 0x61 )
        alt_3 = 6
      elsif ( look_3_5 == 0x65 )
        alt_3 = 9
      else
        raise NoViableAlternative( "", 3, 5 )

      end
      when 0x77 then alt_3 = 7
      when 0x79 then alt_3 = 8
      else
        raise NoViableAlternative( "", 3, 0 )

      end
      case alt_3
      when 1
        # at line 275:7: 'black'
        match( "black" )


      when 2
        # at line 276:7: 'blue'
        match( "blue" )


      when 3
        # at line 277:7: 'green'
        match( "green" )


      when 4
        # at line 278:7: 'orange'
        match( "orange" )


      when 5
        # at line 279:7: 'purple'
        match( "purple" )


      when 6
        # at line 280:7: 'random'
        match( "random" )


      when 7
        # at line 281:7: 'white'
        match( "white" )


      when 8
        # at line 282:7: 'yellow'
        match( "yellow" )


      when 9
        # at line 283:7: 'red'
        match( "red" )


      end

      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 48 )


    end

    # lexer rule dir! (DIR)
    # (in Rubik.g)
    def dir!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 49 )



      type = DIR
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 287:5: ( 'down' | 'left' | 'right' | 'up' )
      alt_4 = 4
      case look_4 = @input.peek( 1 )
      when 0x64 then alt_4 = 1
      when 0x6c then alt_4 = 2
      when 0x72 then alt_4 = 3
      when 0x75 then alt_4 = 4
      else
        raise NoViableAlternative( "", 4, 0 )

      end
      case alt_4
      when 1
        # at line 287:7: 'down'
        match( "down" )


      when 2
        # at line 288:7: 'left'
        match( "left" )


      when 3
        # at line 289:7: 'right'
        match( "right" )


      when 4
        # at line 290:7: 'up'
        match( "up" )


      end

      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 49 )


    end

    # lexer rule float! (FLOAT)
    # (in Rubik.g)
    def float!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 50 )



      type = FLOAT
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 294:7: ( '0' .. '9' )+ '.' ( '0' .. '9' )+
      # at file 294:7: ( '0' .. '9' )+
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
      # at file 294:23: ( '0' .. '9' )+
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
      # trace_out( __method__, 50 )


    end

    # lexer rule int! (INT)
    # (in Rubik.g)
    def int!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 51 )



      type = INT
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 298:7: ( '0' .. '9' )+
      # at file 298:7: ( '0' .. '9' )+
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
      # trace_out( __method__, 51 )


    end

    # lexer rule string! (STRING)
    # (in Rubik.g)
    def string!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 52 )



      type = STRING
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 302:5: ( '\\'' (~ ( '\\'' | '\\\\' ) | '\\\\' . )* '\\'' | '\"' (~ ( '\"' | '\\\\' ) | '\\\\' . )* '\"' )
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
        # at line 302:7: '\\'' (~ ( '\\'' | '\\\\' ) | '\\\\' . )* '\\''
        match( 0x27 )
        # at line 302:12: (~ ( '\\'' | '\\\\' ) | '\\\\' . )*
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
            # at line 302:13: ~ ( '\\'' | '\\\\' )
            if @input.peek( 1 ).between?( 0x0, 0x26 ) || @input.peek( 1 ).between?( 0x28, 0x5b ) || @input.peek( 1 ).between?( 0x5d, 0xff )
              @input.consume
            else
              mse = MismatchedSet( nil )
              recover mse
              raise mse

            end



          when 2
            # at line 302:30: '\\\\' .
            match( 0x5c )
            match_any

          else
            break # out of loop for decision 8
          end
        end # loop for decision 8

        match( 0x27 )

      when 2
        # at line 303:7: '\"' (~ ( '\"' | '\\\\' ) | '\\\\' . )* '\"'
        match( 0x22 )
        # at line 303:12: (~ ( '\"' | '\\\\' ) | '\\\\' . )*
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
            # at line 303:13: ~ ( '\"' | '\\\\' )
            if @input.peek( 1 ).between?( 0x0, 0x21 ) || @input.peek( 1 ).between?( 0x23, 0x5b ) || @input.peek( 1 ).between?( 0x5d, 0xff )
              @input.consume
            else
              mse = MismatchedSet( nil )
              recover mse
              raise mse

            end



          when 2
            # at line 303:30: '\\\\' .
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
      # trace_out( __method__, 52 )


    end

    # lexer rule id! (ID)
    # (in Rubik.g)
    def id!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 53 )



      type = ID
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 307:7: ( '_' | 'a' .. 'z' | 'A' .. 'Z' ) ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' )*
      if @input.peek( 1 ).between?( 0x41, 0x5a ) || @input.peek(1) == 0x5f || @input.peek( 1 ).between?( 0x61, 0x7a )
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse

      end


      # at line 307:35: ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' )*
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
      # trace_out( __method__, 53 )


    end

    # lexer rule newline! (NEWLINE)
    # (in Rubik.g)
    def newline!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 54 )



      type = NEWLINE
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 311:7: ( '\\n' | '\\r' )+
      # at file 311:7: ( '\\n' | '\\r' )+
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
      # trace_out( __method__, 54 )


    end

    # lexer rule ws! (WS)
    # (in Rubik.g)
    def ws!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 55 )



      type = WS
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 315:7: ( '\\t' | '\\f' | ' ' | '\\u00A0' )+
      # at file 315:7: ( '\\t' | '\\f' | ' ' | '\\u00A0' )+
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
      # trace_out( __method__, 55 )


    end

    # main rule used to study the input at the current position,
    # and choose the proper lexer rule to call in order to
    # fetch the next token
    #
    # usually, you don't make direct calls to this method,
    # but instead use the next_token method, which will
    # build and emit the actual next token
    def token!
      # at line 1:8: ( AND | ASGN | BREAK | CHANGE_COLOR | CHANGE_DIR | COMMA | DEF | DIV | DO | DOT | DRAW_CIRCLE | DRAW_RECTANGLE | DRAW_SQUARE | ELSE | EQ | GEQ | GREATER | IF | LBRACE | LBRAK | LEQ | LESS | LPAREN | MINUS | NEG | NEQ | NULL | OR | PEN_DOWN | PEN_UP | PLUS | RBRACE | RBRAK | RPAREN | R_BEGIN | R_END | R_MOVE | R_RESET | R_RETURN | SEMI | STAR | TIMES | TLK | T__58 | T__59 | VAR_TYPE | BOOLEAN | COLOR | DIR | FLOAT | INT | STRING | ID | NEWLINE | WS )
      alt_14 = 55
      alt_14 = @dfa14.predict( @input )
      case alt_14
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
        # at line 1:82: DRAW_RECTANGLE
        draw_rectangle!


      when 13
        # at line 1:97: DRAW_SQUARE
        draw_square!


      when 14
        # at line 1:109: ELSE
        else!


      when 15
        # at line 1:114: EQ
        eq!


      when 16
        # at line 1:117: GEQ
        geq!


      when 17
        # at line 1:121: GREATER
        greater!


      when 18
        # at line 1:129: IF
        if!


      when 19
        # at line 1:132: LBRACE
        lbrace!


      when 20
        # at line 1:139: LBRAK
        lbrak!


      when 21
        # at line 1:145: LEQ
        leq!


      when 22
        # at line 1:149: LESS
        less!


      when 23
        # at line 1:154: LPAREN
        lparen!


      when 24
        # at line 1:161: MINUS
        minus!


      when 25
        # at line 1:167: NEG
        neg!


      when 26
        # at line 1:171: NEQ
        neq!


      when 27
        # at line 1:175: NULL
        null!


      when 28
        # at line 1:180: OR
        or!


      when 29
        # at line 1:183: PEN_DOWN
        pen_down!


      when 30
        # at line 1:192: PEN_UP
        pen_up!


      when 31
        # at line 1:199: PLUS
        plus!


      when 32
        # at line 1:204: RBRACE
        rbrace!


      when 33
        # at line 1:211: RBRAK
        rbrak!


      when 34
        # at line 1:217: RPAREN
        rparen!


      when 35
        # at line 1:224: R_BEGIN
        r_begin!


      when 36
        # at line 1:232: R_END
        r_end!


      when 37
        # at line 1:238: R_MOVE
        r_move!


      when 38
        # at line 1:245: R_RESET
        r_reset!


      when 39
        # at line 1:253: R_RETURN
        r_return!


      when 40
        # at line 1:262: SEMI
        semi!


      when 41
        # at line 1:267: STAR
        star!


      when 42
        # at line 1:272: TIMES
        times!


      when 43
        # at line 1:278: TLK
        tlk!


      when 44
        # at line 1:282: T__58
        t__58!


      when 45
        # at line 1:288: T__59
        t__59!


      when 46
        # at line 1:294: VAR_TYPE
        var_type!


      when 47
        # at line 1:303: BOOLEAN
        boolean!


      when 48
        # at line 1:311: COLOR
        color!


      when 49
        # at line 1:317: DIR
        dir!


      when 50
        # at line 1:321: FLOAT
        float!


      when 51
        # at line 1:327: INT
        int!


      when 52
        # at line 1:331: STRING
        string!


      when 53
        # at line 1:338: ID
        id!


      when 54
        # at line 1:341: NEWLINE
        newline!


      when 55
        # at line 1:349: WS
        ws!


      end
    end


    # - - - - - - - - - - DFA definitions - - - - - - - - - - -
    class DFA14 < ANTLR3::DFA
      EOT = unpack( 2, -1, 1, 45, 2, 41, 1, -1, 1, 41, 2, -1, 1, 41, 1, 
                    57, 1, 41, 2, -1, 1, 61, 2, -1, 1, 63, 1, 41, 1, -1, 
                    1, 41, 4, -1, 2, 41, 2, -1, 10, 41, 1, 87, 6, -1, 6, 
                    41, 1, 96, 3, 41, 2, -1, 1, 100, 1, 41, 4, -1, 21, 41, 
                    1, 125, 2, -1, 6, 41, 1, 132, 1, 41, 1, -1, 2, 41, 1, 
                    136, 1, -1, 1, 137, 7, 41, 1, 145, 15, 41, 1, -1, 4, 
                    41, 1, 145, 1, 41, 1, -1, 1, 125, 1, 41, 1, 167, 2, 
                    -1, 1, 168, 3, 41, 1, 173, 2, 41, 1, -1, 3, 41, 1, 179, 
                    1, 180, 1, 181, 4, 41, 1, 137, 3, 41, 1, 125, 1, 189, 
                    1, 190, 1, 41, 1, 145, 2, 41, 2, -1, 2, 41, 1, 198, 
                    1, 41, 1, -1, 1, 200, 2, 41, 1, 125, 1, 203, 3, -1, 
                    1, 145, 1, 137, 1, 180, 2, 41, 1, 145, 1, 41, 2, -1, 
                    6, 41, 1, 213, 1, -1, 1, 145, 1, -1, 1, 214, 1, 145, 
                    1, -1, 1, 137, 2, 145, 1, 137, 5, 41, 2, -1, 5, 41, 
                    1, 226, 5, 41, 1, -1, 7, 41, 1, 239, 1, 41, 1, 241, 
                    1, 242, 1, 41, 1, -1, 1, 41, 2, -1, 3, 41, 1, 248, 1, 
                    41, 1, -1, 1, 250, 1, -1 )
      EOF = unpack( 251, -1 )
      MIN = unpack( 1, 9, 1, -1, 1, 61, 1, 101, 1, 104, 1, -1, 1, 101, 2, 
                    -1, 1, 108, 1, 61, 1, 102, 2, -1, 1, 61, 2, -1, 1, 61, 
                    1, 117, 1, -1, 1, 101, 4, -1, 1, 111, 1, 97, 2, -1, 
                    1, 97, 1, 101, 1, 97, 1, 116, 1, 111, 1, 114, 1, 104, 
                    2, 101, 1, 112, 1, 46, 6, -1, 1, 101, 1, 103, 1, 111, 
                    2, 97, 1, 102, 1, 48, 1, 97, 1, 115, 1, 100, 2, -1, 
                    1, 48, 1, 116, 4, -1, 1, 108, 1, 110, 1, 105, 1, 114, 
                    1, 118, 1, 100, 1, 110, 1, 103, 1, 109, 1, 108, 1, 117, 
                    1, 116, 1, 101, 1, 111, 1, 108, 1, 114, 1, 105, 1, 97, 
                    1, 105, 1, 108, 1, 102, 1, 48, 2, -1, 1, 97, 1, 105, 
                    1, 108, 1, 99, 1, 101, 1, 110, 1, 48, 1, 110, 1, -1, 
                    1, 119, 1, 101, 1, 48, 1, -1, 1, 48, 1, 108, 1, 95, 
                    1, 110, 1, 112, 2, 101, 1, 117, 1, 48, 1, 100, 1, 104, 
                    1, 101, 1, 107, 1, 101, 1, 115, 1, 101, 1, 97, 1, 115, 
                    1, 105, 1, 100, 1, 110, 1, 116, 1, 108, 1, 116, 1, -1, 
                    1, 107, 1, 110, 1, 101, 1, 107, 1, 48, 1, 103, 1, -1, 
                    1, 48, 1, 95, 1, 48, 2, -1, 1, 48, 1, 100, 1, 116, 1, 
                    108, 1, 48, 1, 116, 1, 114, 1, -1, 1, 111, 1, 116, 1, 
                    115, 3, 48, 1, 110, 1, 116, 1, 101, 1, 110, 1, 48, 1, 
                    103, 1, 101, 1, 111, 3, 48, 1, 97, 1, 48, 1, 101, 1, 
                    99, 2, -1, 1, 111, 1, 112, 1, 48, 1, 101, 1, -1, 1, 
                    48, 1, 110, 1, 109, 2, 48, 3, -1, 3, 48, 1, 103, 1, 
                    101, 1, 48, 1, 119, 2, -1, 1, 110, 1, 95, 1, 105, 1, 
                    101, 1, 113, 1, 119, 1, 48, 1, -1, 1, 48, 1, -1, 2, 
                    48, 1, -1, 4, 48, 1, 99, 1, 114, 1, 99, 1, 117, 1, 110, 
                    2, -1, 1, 111, 1, 105, 1, 99, 1, 116, 1, 97, 1, 48, 
                    1, 108, 1, 114, 1, 108, 1, 97, 1, 114, 1, -1, 1, 111, 
                    2, 101, 1, 110, 1, 101, 1, 114, 1, 99, 1, 48, 1, 103, 
                    2, 48, 1, 116, 1, -1, 1, 108, 2, -1, 1, 105, 1, 101, 
                    1, 111, 1, 48, 1, 110, 1, -1, 1, 48, 1, -1 )
      MAX = unpack( 1, 160, 1, -1, 1, 61, 1, 114, 1, 104, 1, -1, 1, 114, 
                    2, -1, 1, 110, 1, 61, 1, 110, 2, -1, 1, 61, 2, -1, 1, 
                    61, 1, 117, 1, -1, 1, 117, 4, -1, 1, 111, 1, 105, 2, 
                    -1, 2, 114, 1, 108, 1, 116, 1, 111, 1, 114, 1, 104, 
                    2, 101, 1, 112, 1, 57, 6, -1, 1, 101, 1, 103, 1, 111, 
                    1, 117, 1, 97, 1, 102, 1, 122, 1, 97, 1, 115, 1, 100, 
                    2, -1, 1, 122, 1, 116, 4, -1, 1, 108, 1, 110, 1, 105, 
                    1, 114, 1, 118, 1, 116, 1, 110, 1, 103, 1, 109, 1, 108, 
                    1, 117, 1, 116, 1, 101, 1, 111, 1, 108, 1, 114, 1, 105, 
                    1, 97, 1, 105, 1, 108, 1, 102, 1, 122, 2, -1, 1, 97, 
                    1, 105, 1, 108, 1, 99, 1, 101, 1, 110, 1, 122, 1, 110, 
                    1, -1, 1, 119, 1, 101, 1, 122, 1, -1, 1, 122, 1, 108, 
                    1, 95, 1, 110, 1, 112, 2, 101, 1, 117, 1, 122, 1, 100, 
                    1, 104, 1, 101, 1, 107, 1, 101, 1, 115, 1, 101, 1, 97, 
                    1, 115, 1, 105, 1, 100, 1, 110, 1, 116, 1, 108, 1, 116, 
                    1, -1, 1, 107, 1, 110, 1, 101, 1, 107, 1, 122, 1, 103, 
                    1, -1, 1, 122, 1, 95, 1, 122, 2, -1, 1, 122, 1, 117, 
                    1, 116, 1, 108, 1, 122, 1, 116, 1, 114, 1, -1, 1, 111, 
                    1, 116, 1, 115, 3, 122, 1, 110, 1, 116, 1, 101, 1, 110, 
                    1, 122, 1, 103, 1, 101, 1, 111, 3, 122, 1, 97, 1, 122, 
                    1, 101, 1, 115, 2, -1, 1, 111, 1, 112, 1, 122, 1, 101, 
                    1, -1, 1, 122, 1, 110, 1, 109, 2, 122, 3, -1, 3, 122, 
                    1, 103, 1, 101, 1, 122, 1, 119, 2, -1, 1, 110, 1, 95, 
                    1, 105, 1, 101, 1, 113, 1, 119, 1, 122, 1, -1, 1, 122, 
                    1, -1, 2, 122, 1, -1, 4, 122, 1, 100, 1, 114, 1, 99, 
                    1, 117, 1, 110, 2, -1, 1, 111, 1, 105, 1, 99, 1, 116, 
                    1, 97, 1, 122, 1, 108, 1, 114, 1, 108, 1, 97, 1, 114, 
                    1, -1, 1, 111, 2, 101, 1, 110, 1, 101, 1, 114, 1, 99, 
                    1, 122, 1, 103, 2, 122, 1, 116, 1, -1, 1, 108, 2, -1, 
                    1, 105, 1, 101, 1, 111, 1, 122, 1, 110, 1, -1, 1, 122, 
                    1, -1 )
      ACCEPT = unpack( 1, -1, 1, 1, 3, -1, 1, 6, 1, -1, 1, 8, 1, 10, 3, 
                       -1, 1, 19, 1, 20, 1, -1, 1, 23, 1, 24, 2, -1, 1, 
                       28, 1, -1, 1, 31, 1, 32, 1, 33, 1, 34, 2, -1, 1, 
                       40, 1, 41, 11, -1, 1, 52, 1, 53, 1, 54, 1, 55, 1, 
                       15, 1, 2, 10, -1, 1, 16, 1, 17, 2, -1, 1, 21, 1, 
                       22, 1, 26, 1, 25, 22, -1, 1, 50, 1, 51, 8, -1, 1, 
                       9, 3, -1, 1, 18, 24, -1, 1, 49, 6, -1, 1, 7, 3, -1, 
                       1, 36, 1, 46, 7, -1, 1, 48, 21, -1, 1, 14, 1, 27, 
                       4, -1, 1, 37, 5, -1, 1, 43, 1, 47, 1, 44, 7, -1, 
                       1, 3, 1, 35, 7, -1, 1, 45, 1, -1, 1, 38, 2, -1, 1, 
                       42, 9, -1, 1, 30, 1, 39, 11, -1, 1, 29, 12, -1, 1, 
                       11, 1, -1, 1, 13, 1, 4, 5, -1, 1, 12, 1, -1, 1, 5 )
      SPECIAL = unpack( 251, -1 )
      TRANSITION = [
        unpack( 1, 43, 1, 42, 1, -1, 1, 43, 1, 42, 18, -1, 1, 43, 1, 17, 
                1, 40, 3, -1, 1, 1, 1, 40, 1, 15, 1, 24, 1, 28, 1, 21, 1, 
                5, 1, 16, 1, 8, 1, 7, 10, 39, 1, -1, 1, 27, 1, 14, 1, 2, 
                1, 10, 2, -1, 26, 41, 1, 13, 1, -1, 1, 23, 1, -1, 1, 41, 
                1, -1, 1, 41, 1, 3, 1, 4, 1, 6, 1, 9, 1, 31, 1, 30, 1, 41, 
                1, 11, 2, 41, 1, 37, 1, 25, 1, 18, 1, 34, 1, 20, 1, 41, 
                1, 26, 1, 32, 1, 29, 1, 38, 1, 33, 1, 35, 1, 41, 1, 36, 
                1, 41, 1, 12, 1, 19, 1, 22, 34, -1, 1, 43 ),
        unpack(  ),
        unpack( 1, 44 ),
        unpack( 1, 47, 6, -1, 1, 49, 2, -1, 1, 48, 2, -1, 1, 46 ),
        unpack( 1, 50 ),
        unpack(  ),
        unpack( 1, 51, 9, -1, 1, 52, 2, -1, 1, 53 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 54, 1, -1, 1, 55 ),
        unpack( 1, 56 ),
        unpack( 1, 58, 7, -1, 1, 59 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 60 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 62 ),
        unpack( 1, 64 ),
        unpack(  ),
        unpack( 1, 65, 12, -1, 1, 66, 2, -1, 1, 67 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 68 ),
        unpack( 1, 70, 3, -1, 1, 69, 3, -1, 1, 71 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 73, 7, -1, 1, 72, 8, -1, 1, 74 ),
        unpack( 1, 75, 12, -1, 1, 76 ),
        unpack( 1, 78, 10, -1, 1, 77 ),
        unpack( 1, 79 ),
        unpack( 1, 80 ),
        unpack( 1, 81 ),
        unpack( 1, 82 ),
        unpack( 1, 83 ),
        unpack( 1, 84 ),
        unpack( 1, 85 ),
        unpack( 1, 86, 1, -1, 10, 39 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 88 ),
        unpack( 1, 89 ),
        unpack( 1, 90 ),
        unpack( 1, 91, 19, -1, 1, 92 ),
        unpack( 1, 93 ),
        unpack( 1, 94 ),
        unpack( 10, 41, 7, -1, 26, 41, 4, -1, 1, 41, 1, -1, 22, 41, 1, 
                 95, 3, 41 ),
        unpack( 1, 97 ),
        unpack( 1, 98 ),
        unpack( 1, 99 ),
        unpack(  ),
        unpack(  ),
        unpack( 10, 41, 7, -1, 26, 41, 4, -1, 1, 41, 1, -1, 26, 41 ),
        unpack( 1, 101 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 102 ),
        unpack( 1, 103 ),
        unpack( 1, 104 ),
        unpack( 1, 105 ),
        unpack( 1, 106 ),
        unpack( 1, 109, 14, -1, 1, 107, 1, 108 ),
        unpack( 1, 110 ),
        unpack( 1, 111 ),
        unpack( 1, 112 ),
        unpack( 1, 113 ),
        unpack( 1, 114 ),
        unpack( 1, 115 ),
        unpack( 1, 116 ),
        unpack( 1, 117 ),
        unpack( 1, 118 ),
        unpack( 1, 119 ),
        unpack( 1, 120 ),
        unpack( 1, 121 ),
        unpack( 1, 122 ),
        unpack( 1, 123 ),
        unpack( 1, 124 ),
        unpack( 10, 41, 7, -1, 26, 41, 4, -1, 1, 41, 1, -1, 26, 41 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 126 ),
        unpack( 1, 127 ),
        unpack( 1, 128 ),
        unpack( 1, 129 ),
        unpack( 1, 130 ),
        unpack( 1, 131 ),
        unpack( 10, 41, 7, -1, 26, 41, 4, -1, 1, 41, 1, -1, 26, 41 ),
        unpack( 1, 133 ),
        unpack(  ),
        unpack( 1, 134 ),
        unpack( 1, 135 ),
        unpack( 10, 41, 7, -1, 26, 41, 4, -1, 1, 41, 1, -1, 26, 41 ),
        unpack(  ),
        unpack( 10, 41, 7, -1, 26, 41, 4, -1, 1, 41, 1, -1, 26, 41 ),
        unpack( 1, 138 ),
        unpack( 1, 139 ),
        unpack( 1, 140 ),
        unpack( 1, 141 ),
        unpack( 1, 142 ),
        unpack( 1, 143 ),
        unpack( 1, 144 ),
        unpack( 10, 41, 7, -1, 26, 41, 4, -1, 1, 41, 1, -1, 26, 41 ),
        unpack( 1, 146 ),
        unpack( 1, 147 ),
        unpack( 1, 148 ),
        unpack( 1, 149 ),
        unpack( 1, 150 ),
        unpack( 1, 151 ),
        unpack( 1, 152 ),
        unpack( 1, 153 ),
        unpack( 1, 154 ),
        unpack( 1, 155 ),
        unpack( 1, 156 ),
        unpack( 1, 157 ),
        unpack( 1, 158 ),
        unpack( 1, 159 ),
        unpack( 1, 160 ),
        unpack(  ),
        unpack( 1, 161 ),
        unpack( 1, 162 ),
        unpack( 1, 163 ),
        unpack( 1, 164 ),
        unpack( 10, 41, 7, -1, 26, 41, 4, -1, 1, 41, 1, -1, 26, 41 ),
        unpack( 1, 165 ),
        unpack(  ),
        unpack( 10, 41, 7, -1, 26, 41, 4, -1, 1, 41, 1, -1, 26, 41 ),
        unpack( 1, 166 ),
        unpack( 10, 41, 7, -1, 26, 41, 4, -1, 1, 41, 1, -1, 26, 41 ),
        unpack(  ),
        unpack(  ),
        unpack( 10, 41, 7, -1, 26, 41, 4, -1, 1, 41, 1, -1, 26, 41 ),
        unpack( 1, 169, 16, -1, 1, 170 ),
        unpack( 1, 171 ),
        unpack( 1, 172 ),
        unpack( 10, 41, 7, -1, 26, 41, 4, -1, 1, 41, 1, -1, 26, 41 ),
        unpack( 1, 174 ),
        unpack( 1, 175 ),
        unpack(  ),
        unpack( 1, 176 ),
        unpack( 1, 177 ),
        unpack( 1, 178 ),
        unpack( 10, 41, 7, -1, 26, 41, 4, -1, 1, 41, 1, -1, 26, 41 ),
        unpack( 10, 41, 7, -1, 26, 41, 4, -1, 1, 41, 1, -1, 26, 41 ),
        unpack( 10, 41, 7, -1, 26, 41, 4, -1, 1, 41, 1, -1, 26, 41 ),
        unpack( 1, 182 ),
        unpack( 1, 183 ),
        unpack( 1, 184 ),
        unpack( 1, 185 ),
        unpack( 10, 41, 7, -1, 26, 41, 4, -1, 1, 41, 1, -1, 26, 41 ),
        unpack( 1, 186 ),
        unpack( 1, 187 ),
        unpack( 1, 188 ),
        unpack( 10, 41, 7, -1, 26, 41, 4, -1, 1, 41, 1, -1, 26, 41 ),
        unpack( 10, 41, 7, -1, 26, 41, 4, -1, 1, 41, 1, -1, 26, 41 ),
        unpack( 10, 41, 7, -1, 26, 41, 4, -1, 1, 41, 1, -1, 26, 41 ),
        unpack( 1, 191 ),
        unpack( 10, 41, 7, -1, 26, 41, 4, -1, 1, 41, 1, -1, 26, 41 ),
        unpack( 1, 192 ),
        unpack( 1, 193, 14, -1, 1, 194, 1, 195 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 196 ),
        unpack( 1, 197 ),
        unpack( 10, 41, 7, -1, 26, 41, 4, -1, 1, 41, 1, -1, 26, 41 ),
        unpack( 1, 199 ),
        unpack(  ),
        unpack( 10, 41, 7, -1, 26, 41, 4, -1, 1, 41, 1, -1, 26, 41 ),
        unpack( 1, 201 ),
        unpack( 1, 202 ),
        unpack( 10, 41, 7, -1, 26, 41, 4, -1, 1, 41, 1, -1, 26, 41 ),
        unpack( 10, 41, 7, -1, 26, 41, 4, -1, 1, 41, 1, -1, 26, 41 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 10, 41, 7, -1, 26, 41, 4, -1, 1, 41, 1, -1, 26, 41 ),
        unpack( 10, 41, 7, -1, 26, 41, 4, -1, 1, 41, 1, -1, 26, 41 ),
        unpack( 10, 41, 7, -1, 26, 41, 4, -1, 1, 41, 1, -1, 26, 41 ),
        unpack( 1, 204 ),
        unpack( 1, 205 ),
        unpack( 10, 41, 7, -1, 26, 41, 4, -1, 1, 41, 1, -1, 26, 41 ),
        unpack( 1, 206 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 207 ),
        unpack( 1, 208 ),
        unpack( 1, 209 ),
        unpack( 1, 210 ),
        unpack( 1, 211 ),
        unpack( 1, 212 ),
        unpack( 10, 41, 7, -1, 26, 41, 4, -1, 1, 41, 1, -1, 26, 41 ),
        unpack(  ),
        unpack( 10, 41, 7, -1, 26, 41, 4, -1, 1, 41, 1, -1, 26, 41 ),
        unpack(  ),
        unpack( 10, 41, 7, -1, 26, 41, 4, -1, 1, 41, 1, -1, 26, 41 ),
        unpack( 10, 41, 7, -1, 26, 41, 4, -1, 1, 41, 1, -1, 26, 41 ),
        unpack(  ),
        unpack( 10, 41, 7, -1, 26, 41, 4, -1, 1, 41, 1, -1, 26, 41 ),
        unpack( 10, 41, 7, -1, 26, 41, 4, -1, 1, 41, 1, -1, 26, 41 ),
        unpack( 10, 41, 7, -1, 26, 41, 4, -1, 1, 41, 1, -1, 26, 41 ),
        unpack( 10, 41, 7, -1, 26, 41, 4, -1, 1, 41, 1, -1, 26, 41 ),
        unpack( 1, 215, 1, 216 ),
        unpack( 1, 217 ),
        unpack( 1, 218 ),
        unpack( 1, 219 ),
        unpack( 1, 220 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 221 ),
        unpack( 1, 222 ),
        unpack( 1, 223 ),
        unpack( 1, 224 ),
        unpack( 1, 225 ),
        unpack( 10, 41, 7, -1, 26, 41, 4, -1, 1, 41, 1, -1, 26, 41 ),
        unpack( 1, 227 ),
        unpack( 1, 228 ),
        unpack( 1, 229 ),
        unpack( 1, 230 ),
        unpack( 1, 231 ),
        unpack(  ),
        unpack( 1, 232 ),
        unpack( 1, 233 ),
        unpack( 1, 234 ),
        unpack( 1, 235 ),
        unpack( 1, 236 ),
        unpack( 1, 237 ),
        unpack( 1, 238 ),
        unpack( 10, 41, 7, -1, 26, 41, 4, -1, 1, 41, 1, -1, 26, 41 ),
        unpack( 1, 240 ),
        unpack( 10, 41, 7, -1, 26, 41, 4, -1, 1, 41, 1, -1, 26, 41 ),
        unpack( 10, 41, 7, -1, 26, 41, 4, -1, 1, 41, 1, -1, 26, 41 ),
        unpack( 1, 243 ),
        unpack(  ),
        unpack( 1, 244 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 245 ),
        unpack( 1, 246 ),
        unpack( 1, 247 ),
        unpack( 10, 41, 7, -1, 26, 41, 4, -1, 1, 41, 1, -1, 26, 41 ),
        unpack( 1, 249 ),
        unpack(  ),
        unpack( 10, 41, 7, -1, 26, 41, 4, -1, 1, 41, 1, -1, 26, 41 ),
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
          1:1: Tokens : ( AND | ASGN | BREAK | CHANGE_COLOR | CHANGE_DIR | COMMA | DEF | DIV | DO | DOT | DRAW_CIRCLE | DRAW_RECTANGLE | DRAW_SQUARE | ELSE | EQ | GEQ | GREATER | IF | LBRACE | LBRAK | LEQ | LESS | LPAREN | MINUS | NEG | NEQ | NULL | OR | PEN_DOWN | PEN_UP | PLUS | RBRACE | RBRAK | RPAREN | R_BEGIN | R_END | R_MOVE | R_RESET | R_RETURN | SEMI | STAR | TIMES | TLK | T__58 | T__59 | VAR_TYPE | BOOLEAN | COLOR | DIR | FLOAT | INT | STRING | ID | NEWLINE | WS );
        __dfa_description__
      end

    end


    private

    def initialize_dfas
      super rescue nil
      @dfa14 = DFA14.new( self, 14 )


    end

  end # class Lexer < ANTLR3::Lexer

  at_exit { Lexer.main( ARGV ) } if __FILE__ == $0

end
