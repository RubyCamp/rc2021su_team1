class Bullet < Sprite
    def initialize(x, y, speed)
        image = Image.load('images/apple.png')
        @speed = speed
        self.x = x
        self.y = y
        super(x, y, image)
    end

    def update
        self.y -= @speed
        if self.y < 0 - image.width
            self.vanish
        end
    end

    def shot
        self.vanish
    end
end