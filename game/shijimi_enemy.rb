class Shijimi_enemy < Sprite
    def initialize(x, y, speed, director)
        image = Image.load('images/shijimi_enemy.jpg')
        image.set_color_key(C_WHITE)
        self.scale_x = 0.2
        self.scale_y = 0.2
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
