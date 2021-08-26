module Best_ending
    class Director
        def initialize
            @bg = Image.load('images/best_end.jpg')
        end

        def play
            Window.draw(0, 0, @bg)
            # Window.draw_font(150, 170, "Invite visitors to Shimane", Font.new(48),:color => C_RED)
            Window.draw_font(400, 550, "Push SPACE key to title ", Font.new(32),:color => C_BLUE)
            if Input.key_push?(K_SPACE)
                $current_scene = :title
            end
        end
    end

end
