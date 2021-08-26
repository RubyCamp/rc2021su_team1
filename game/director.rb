require_relative 'player'
require_relative 'shijimi_enemy'
require_relative 'shijimi'
require_relative 'omamori'
require_relative 'grape'
require_relative 'meat'
require_relative 'omamori_enemy'
require_relative 'grape_enemy'
require_relative 'meat_enemy'


module Game
    class Director
        attr_accessor :score 
        def initialize
            @n = 2
            @score = 0
            $high_score = 0
            @time = 3659
            @bg = Image.load('images/bg_game.jpg')
            @player = Player.new
            @shijimi_enemies = []
            @n.times do
                @shijimi_enemies << Shijimi_enemy.new(rand(50)+805, rand(300)-125, rand(1..3)+rand, self)
            end
            @omamori_enemies = []
            @n.times do
                @omamori_enemies << Omamori_enemy.new(rand(50)+805, rand(300)-300, rand(1..3)+rand, self)
            end
            @grape_enemies = []
            @n.times do
                @grape_enemies << Grape_enemy.new(rand(50)+805, rand(300)-1100, rand(1..3)+rand, self)
            end
            @meat_enemies = []
            @n.times do
                @meat_enemies << Meat_enemy.new(rand(50)+805, rand(300)-650, rand(1..3)+rand, self)
            end

            @shijimi = []
            @omamori = [] 
            @grape = []
            @meat = []
        end

        def play

            @time = @time - 1

            if @time < 60
                if @score < 10
                    $current_scene = :bad_ending
                elsif @score < 15
                    $current_scene = :normal_ending
                elsif @score < 20
                    $current_scene = :good_ending
                else 
                    $current_scene = :best_ending
                end
                reset
            end

            Window.draw_scale(0, 0, @bg, 0.78125, 0.78125, 0, 0)
            @player.update
            @player.draw

            Sprite.update(@shijimi_enemies)
            Sprite.update(@omamori_enemies)
            Sprite.update(@grape_enemies)
            Sprite.update(@meat_enemies)

            Sprite.update(@shijimi)
            Sprite.update(@omamori)
            Sprite.update(@grape)
            Sprite.update(@meat)

            
            Sprite.draw(@shijimi_enemies)
            Sprite.draw(@omamori_enemies)
            Sprite.draw(@grape_enemies)
            Sprite.draw(@meat_enemies)

            Sprite.draw(@shijimi)
            Sprite.draw(@omamori)
            Sprite.draw(@grape)
            Sprite.draw(@meat)
            

            Window.draw_font(10, 10, "スコア：#{@score}", Font.new(32), {color: C_BLUE})
            Window.draw_font(300,10,"残り時間：#{@time/60}", Font.new(32), {color: C_BLUE})
            Window.draw_font(500, 10, "ハイスコア：#{$high_score}", Font.new(32), {color: C_BLUE})

            Sprite.check(@shijimi,@shijimi_enemies)
            Sprite.check(@omamori,@omamori_enemies)
            Sprite.check(@grape,@grape_enemies)
            Sprite.check(@meat,@meat_enemies)

            Sprite.check(@shijimi_enemies,@omamori)
            Sprite.check(@shijimi_enemies,@grape)
            Sprite.check(@shijimi_enemies,@meat)

            Sprite.check(@omamori_enemies,@shijimi)
            Sprite.check(@omamori_enemies,@grape)
            Sprite.check(@omamori_enemies,@meat)

            Sprite.check(@grape_enemies,@shijimi)
            Sprite.check(@grape_enemies,@omamori)
            Sprite.check(@grape_enemies,@meat)

            Sprite.check(@meat_enemies,@shijimi)
            Sprite.check(@meat_enemies,@omamori)
            Sprite.check(@meat_enemies,@grape)

            Sprite.clean(@shijimi_enemies)
            (@n-@shijimi_enemies.size).times do
                @shijimi_enemies << Shijimi_enemy.new(rand(50)+805, rand(300)-125, rand(1..3)+rand, self)
            end
            Sprite.clean(@omamori_enemies)
            (@n-@omamori_enemies.size).times do
                @omamori_enemies << Omamori_enemy.new(rand(50)+805, rand(300)-300, rand(1..3)+rand, self)
            end
            Sprite.clean(@grape_enemies)
            (@n-@grape_enemies.size).times do
                @grape_enemies << Grape_enemy.new(rand(50)+805, rand(300)-1100, rand(1..3)+rand, self)
            end
            Sprite.clean(@meat_enemies)
            (@n-@meat_enemies.size).times do
                @meat_enemies << Meat_enemy.new(rand(50)+805, rand(300)-650, rand(1..3)+rand, self)
            end

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

            Sprite.clean(@shijimi)
            Sprite.clean(@omamori)
            Sprite.clean(@grape)
            Sprite.clean(@meat)

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