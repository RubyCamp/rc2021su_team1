class Player < Sprite
    def initialize
        image = Image.load('images/player.png')
        self.scale_x = 0.5
        self.scale_y = 0.5
        self.x = 380
        self.y = 400
        image.set_color_key(C_WHITE)
        super(x, y, image)
    end

    def update
        self.x += Input.x * 3
    end
end
