class Turtle

  attr_accessor :turtle

  @@directions = [:up, :down, :left, :right]

  def initialize(app, turtle, drawings)
    @app = app
    @turtle = turtle
    @drawings = drawings
    @direction = @@directions.first
  end

  def change_color(color)
    if color == 'random'
      color = Shoes::COLORS.keys.sample
    end

    @app.stroke @app.send(color.to_sym)
  end

  def change_direction(direction)
    if @@directions.include?(direction.to_sym)
      turtle.path = turtle.path.gsub(/-(.*)-/, "-#{direction}-")
      @direction = direction.to_sym
    end
  end

  def draw_circle(radius)
    x_radius, y_radius = ensure_within_limits(radius, radius)
    radius = [x_radius, y_radius].min
    draw_shape(:oval, radius)
  end

  def draw_rectangle(w, h)
    w, h = ensure_within_limits(w, h)
    draw_shape(:rect, w, h)
  end

  def draw_square(side)
    w = h = side
    w, h = ensure_within_limits(w, h)
    draw_shape(:rect, w, h)
  end

  def draw_shape(method, *args)
    x1, y1 = turtle.left + offset_x, turtle.top + offset_y
    @app.nofill
    @drawings << @app.send(method, x1, y1, *args)
  end

  def move(x)
    x *= direction_modifier

    x1, y1 = turtle.left, turtle.top
    x2, y2 = direction == :top ? [x1, y1 + x] : [x1 + x, y1]

    x2, y2 = ensure_within_limits(x2, y2)

    turtle.move x2, y2

    if @draw
      @drawings << @app.line(x1 + offset_x, y1 + offset_y,
        x2 + offset_x, y2 + offset_y)
    end
  end

  def talk(msg)
    @app.alert(msg)
  end

  def pen_down
    @draw = true
  end

  def pen_up
    @draw = false
  end

  private

  def ensure_within_limits(x, y)
    x = [x, 0].max
    x = [x, 575].min
    y = [y, 0].max
    y = [y, 575].min

    return x, y
  end

  def offset_x
    turtle.width / 2
  end

  def offset_y
    turtle.height / 2
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
