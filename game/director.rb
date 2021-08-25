require_relative 'player'
require_relative 'enemy'

module Game
    class Director
        def initialize
            @bg = Image.load('images/bg_game.png')
            @player = Player.new
            @enemies = []
            5.times do
                @enemies << Enemy.new(rand(50)+805, rand(300), rand(1..3)+rand)
            end
        end

        def play
            Window.draw(0, 0, @bg)
            @player.update
            @player.draw
            Sprite.update(@enemies)
            Sprite.draw(@enemies)
            
            Sprite.clean(@enemies)
            (5-@enemies.size).times do
                @enemies << Enemy.new(rand(50)+805, rand(300), rand(1..3)+rand)
            end
        end
    end
end
