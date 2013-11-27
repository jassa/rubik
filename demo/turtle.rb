class Turtle

  attr_accessor :turtle

  @@directions = [:up, :down, :left, :right]

  def initialize(app, turtle, drawings)
    @app = app
    @turtle = turtle
    @drawings = drawings
    @direction = @@directions.first
  end

  def change_direction(direction)
    if @@directions.include?(direction.to_sym)
      turtle.path = turtle.path.gsub(/-(.*)-/, "-#{direction}-")
      @direction = direction.to_sym
    end
  end

  def draw_square(x)
    x1, y1 = turtle.left + offset_x, turtle.top + offset_y
    w = h = x

    @app.nofill
    @drawings << @app.rect(x1, y1, w, h)
  end

  def move(x)
    x *= direction_modifier

    x1, y1 = turtle.left, turtle.top
    x2, y2 = direction == :top ? [x1, y1 + x] : [x1 + x, y1]

    turtle.move x2, y2

    if @draw
      @drawings << @app.line(x1 + offset_x, y1 + offset_y,
        x2 + offset_x, y2 + offset_y)
    end
  end

  def pen_down
    @draw = true
  end

  def pen_up
    @draw = false
  end

  private

  def offset_x
    turtle.width / 2
  end

  def offset_y
    turtle.height / 2
  end

  def fps
    24
  end

  def direction
    case @direction
      when :up, :down
        :top
      when :left, :right
        :left
    end
  end

  def direction_modifier
    case @direction
    when :up, :left
      -1
    else
      1
    end
  end

end
