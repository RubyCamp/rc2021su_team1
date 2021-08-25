require_relative 'player'
require_relative 'enemy'
require_relative 'bullet'

module Game
    class Director
        attr_accessor :score 
        def initialize
            @score = 0
            @time = 3659
            @bg = Image.load('images/bg_game.png')
            @player = Player.new
            @enemies = []
            5.times do
                @enemies << Enemy.new(rand(50)+805, rand(300), rand(1..3)+rand, self)
            end
            @bullet = []
        end

        def play

            @time = @time - 1

            if @time < 3000
                $current_scene = :title
                reset
            end

            Window.draw(0, 0, @bg)
            @player.update
            @player.draw

            Sprite.update(@enemies)
            Sprite.update(@bullet)
            
            Sprite.draw(@enemies)
            Sprite.draw(@bullet)

            Window.draw_font(10, 10, "スコア：#{@score}", Font.new(32), {color: C_BLUE})
            Window.draw_font(300,10,"残り時間：#{@time/60}", Font.new(32), {color: C_BLUE})

            Sprite.check(@bullet,@enemies)

            Sprite.clean(@enemies)
            (5-@enemies.size).times do
                @enemies << Enemy.new(rand(50)+805, rand(300), rand(1..3)+rand, self)
            end
            
            @bullet.delete_if{|bullet| bullet.vanished?}

            if Input.key_push?(K_Z)
                @bullet << Bullet.new(@player.x, @player.y, 5)
            end
        end
        def reset
            @time = 3600
            @score = 0
            @player.x = 390
            @player.y = 480
        end
    end
end