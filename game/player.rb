class Player < Sprite
    def initialize
        image = Image.load('images/noschar1.png')
        self.scale_x = 1.5
        self.scale_y = 1.5
        self.x = 390
        self.y = 480
        super(x, y, image)
    end

    def update
        self.x += Input.x * 3
    end
end
