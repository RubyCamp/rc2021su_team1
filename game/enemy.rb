class Enemy < Sprite
    def initialize(x, y, speed, director)
        image = Image.load('images/normal_enemy.png')
        @speed = speed
        @director = director
        super(x, y, image)
    end

    def update
        self.x -= @speed
        if self.x < 0 - image.width
            self.vanish
        end
    end

    def hit
        self.vanish
        @director.score = @director.score + 1
    end
end
