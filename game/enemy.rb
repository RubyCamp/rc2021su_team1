class Enemy < Sprite
    def initialize(x, y, speed)
        image = Image.load('images/normal_enemy.png')
        @speed = speed
        super(x, y, image)
    end

    def update
        self.x -= @speed
    end
end
