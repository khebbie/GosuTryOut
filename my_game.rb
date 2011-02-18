require 'rubygems'
require 'gosu'
require 'player'
require 'dogmower'

class MyGame < Gosu::Window
    def initialize
      super(800, 600, false)
      @player1 = Player.new(self, "images/player1_icon.png")
      @dog = Player.new(self, "images/dog_icon.png")
      @dog_mower = DogMower.new(@dog)
      @dog.x = 100
      @dog.y = 100
    end

    def update
      if button_down? Gosu::Button::KbLeft
        @player1.move_left
      end

      if button_down? Gosu::Button::KbRight
        @player1.move_right
      end

       if button_down? Gosu::Button::KbUp
        @player1.move_up
      end

        if button_down? Gosu::Button::KbDown
        @player1.move_down
      end

        if button_down? Gosu::Button::KbTab
          close
        end
    @dog_mower.update

    end

    def draw
      @player1.draw
      @dog.draw
    end

end

window = MyGame.new
window.show
