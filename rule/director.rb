module Rule
    class Director
        def initialize
            @bg = Image.load('images/rule1.jpg')
            $sc = 1
        end

        def play
            if $sc == 1
                @bg = Image.load('images/rule1.jpg')
            end
            Window.draw(0, 0, @bg)
            if Input.key_push?(K_SPACE)
                if $sc == 2
                    if Input.key_push?(K_SPACE)
                        $sc = 1
                        $current_scene = :game
                    end
                end
                @bg = Image.load('images/rule2.jpg')
                $sc = 2
            end
            # Window.draw_font(150, 170, "Invite visitors to Shimane", Font.new(48),:color => C_RED)
            # Window.draw_font(430, 550, "Push SPACE key to start ", Font.new(32),:color => C_BLUE)
        end
    end

end
