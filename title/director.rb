module Title
    class Director
        def initialize
            @bg = Image.load('images/bg_title.png')
        end

        def play
            Window.draw(0, 0, @bg)
            Window.draw_font(150, 170, "Invite visitors to Shimane", Font.new(48),:color => C_RED)
            Window.draw_font(430, 550, "Push SPACE key to start ", Font.new(32),:color => C_BLUE)
        end
    end

end
