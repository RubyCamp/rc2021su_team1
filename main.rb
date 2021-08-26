require 'dxruby'

require_relative 'title/director'
require_relative 'game/director'
require_relative 'rule/director'
require_relative 'bad_ending/director'
require_relative 'normal_ending/director'
require_relative 'good_ending/director'
require_relative 'best_ending/director'

Window.width = 800
Window.height = 600
Window.caption = "Invite visitors to Shimane"

$current_scene = :title

directors = {
    :title => Title::Director.new,
    :game => Game::Director.new,
    :rule => Rule::Director.new,
    :bad_ending => Bad_ending::Director.new,
    :normal_ending => Normal_ending::Director.new,
    :good_ending => Good_ending::Director.new,
    :best_ending => Best_ending::Director.new
}

Window.loop do
    break if Input.key_push?(K_ESCAPE)
    directors[$current_scene].play
end