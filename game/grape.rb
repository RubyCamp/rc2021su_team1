class Grape < Sprite
    def initialize(x, y, speed)
        image = Image.load('images/Grape.png')
        self.scale_x = 0.2
        self.scale_y = 0.2
        #image.set_color_key(C_WHITE)
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

   
end