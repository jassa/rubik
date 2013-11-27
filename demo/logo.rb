require 'VM.rb'

Shoes.app(title: "Logo - Rubik Demo", :width => 1000,
    :height => 630, resizable: false) do

  def send_source_code(input_stream)
    reset_canvas
    @commands = [] unless caller[0][/`.*'/][1..-2] == 'send_command'
    Rubik::VM.new(self, input_stream)
  rescue => e
    alert(e)
    @commands.pop
  end

  def send_command(input_stream)
    @commands << input_stream

    program = <<-EOF
begin
  #{@commands.join("\n")}
end
EOF

    send_source_code(program)
  end

  def reset_canvas
    @turtle.left = @turtle.top = 285
    @turtle.path = 'demo/img/turtle-up-0.png'
    @drawings.map(&:remove)
    @drawings = []
  end

  def demo_start
    stack do
      background black

      flow do
        flow width: 600, height: 600 do
          background "#EEC".."#996"

          caption "Type in your commands below, " +
            "or paste your source code in the text area", margin: 8

          @turtle = image('demo/img/turtle-up-0.png', top: 285, left: 285)
        end
        flow width: 400, height: 600, margin: 15 do
          background beige

          stack do
            @code = edit_box '-Source Code-', width: 370, height: 544
            button "OK" do
              send_source_code(@code.text) unless @code.text == '-Source Code-'
            end
          end
        end
      end

      flow height: 30, margin: 3 do
        background white
        @input = edit_line '> Commands', width: 938, height: 24
        button "OK", height: 26 do
          send_command(@input.text) unless @input.text == '> Commands'
        end
      end

      keypress do |k|
      end
    end

    animate(9) do |i|
      if i % 3 == 0
        frame = @turtle.path.match(/\d/)[0].to_i
        frame = frame == 2 ? 0 : frame + 1
        @turtle.path = @turtle.path.gsub(/\d/, frame.to_s)
      end
    end

  end

  @commands = []
  @drawings = []

  demo_start

end
