require 'dxruby'

require_relative 'title/director'
require_relative 'game/director'
require_relative 'ending/director'

Window.width = 800
Window.height = 600
Window.caption = "Invite visitors to Shimane"

$current_scene = :title

directors = {
    :title => Title::Director.new,
    :game => Game::Director.new,
    :ending => Ending::Director.new
}

Window.loop do
    break if Input.key_push?(K_ESCAPE)
    
    if Input.key_push?(K_SPACE)
        $current_scene = :game
    end

    directors[$current_scene].play
end