require 'rubygems'
require 'gosu'
require 'player'
require 'dogmower'

class MyGame < Gosu::Window
    def initialize
      super(800, 600, false)
      @player1 = Player.new(self, "images/player1_icon.png")

      @cake = Player.new(self, "images/cake_icon.png")
      @cake.y = 500
      @cake.x = 50

      @dog = Player.new(self, "images/dog_icon.png")
      @dog_mower = DogMower.new(@dog)
      @dog.x = 100
      @dog.y = 300
      @dog.pixel_movement = 10

      @hurray = Player.new(self, "images/hurray.png")
      @hurray.x = -300
      @hurray.y = -300

      @has_won = false
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

        if button_down? Gosu::Button::KbEscape
          close
        end
    @dog_mower.update
    if @player1.hit_by?(@dog)
      close
    end

    if @cake.hit_by?(@player1)
    
      @has_won = true
    end

    if @has_won
      @hurray.move_down
      @hurray.move_right
    end

    end

    def draw
      @player1.draw
      @dog.draw
      @cake.draw
      @hurray.draw
    end

end

window = MyGame.new
window.show
