require_relative 'player'
require_relative 'shijimi_enemy'
require_relative 'shijimi'
require_relative 'omamori'
require_relative 'grape'
require_relative 'meat'

module Game
    class Director
        attr_accessor :score 
        def initialize
            @score = 0
            $high_score = 0
            @time = 3659
            @bg = Image.load('images/bg_game.jpg')
            @player = Player.new
            @shijimi_enemies = []
            5.times do
                @shijimi_enemies << Shijimi_enemy.new(rand(50)+805, rand(300)-300, rand(1..3)+rand, self)
            end
            @shijimi = []
            @omamori = [] 
            @grape = []
            @meat = []
        end

        def play

            @time = @time - 1

            if @time < 3000
                $current_scene = :title
                reset
            end

            Window.draw_scale(0, 0, @bg, 0.78125, 0.78125, 0, 0)
            @player.update
            @player.draw

            Sprite.update(@shijimi_enemies)
            Sprite.update(@shijimi)
            Sprite.update(@omamori)
            Sprite.update(@grape)
            Sprite.update(@meat)

            
            Sprite.draw(@shijimi_enemies)
            Sprite.draw(@shijimi)
            Sprite.draw(@omamori)
            Sprite.draw(@grape)
            Sprite.draw(@meat)
            

            Window.draw_font(10, 10, "スコア：#{@score}", Font.new(32), {color: C_BLUE})
            Window.draw_font(300,10,"残り時間：#{@time/60}", Font.new(32), {color: C_BLUE})
            Window.draw_font(500, 10, "ハイスコア：#{$high_score}", Font.new(32), {color: C_BLUE})

            Sprite.check(@shijimi,@shijimi_enemies)

            Sprite.clean(@shijimi_enemies)
            (5-@shijimi_enemies.size).times do
                @shijimi_enemies << Shijimi_enemy.new(rand(50)+805, rand(300), rand(1..3)+rand, self)
            end
            
            @shijimi.delete_if{|shijimi| shijimi.vanished?}

            if Input.key_push?(K_Z)
                @shijimi << Shijimi.new(@player.x-200, @player.y-100, 5)
            end
            if Input.key_push?(K_X)
                @omamori << Omamori.new(@player.x-390, @player.y-400, 5)
            end
            if Input.key_push?(K_C)
                    @grape << Grape.new(@player.x-250, @player.y-300, 5)
            end
            if Input.key_push?(K_V)
                @meat << Meat.new(@player.x-300, @player.y-300, 5)
            end
        end
        def reset
            if @score > $high_score
                $high_score = @score
            end
            @time = 3600
            @score = 0
            @player.x = 390
            @player.y = 400
        end
    end
end