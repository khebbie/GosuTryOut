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

      @dog2 = Player.new(self, "images/dog_icon.png")
      @dog_mower2 = DogMower.new(@dog2)
      @dog2.x = 200
      @dog2.y = 50
      @dog2.pixel_movement = 10


      @hurray = Player.new(self, "images/hurray.png")
      @hurray.x = -300
      @hurray.y = -300

      @loser= Player.new(self, "images/loser.png")
      @loser.x = -300
      @loser.y = -300


      @has_won = false
      @has_lost = false
    end

    def update
    if button_down? Gosu::Button::KbEscape
        close
    end

     if @has_won
        @hurray.move_down
        @hurray.move_right
      elsif @has_lost
        @loser.move_down
        @loser.move_right
      else

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

        @dog_mower.update
        @dog_mower2.update
        if @player1.hit_by?(@dog) or @player1.hit_by?(@dog2)
         @has_lost = true 
        end

        if @cake.hit_by?(@player1)
          @has_won = true
        end
      end
    end

        def draw
          @player1.draw
          @dog.draw
          @dog2.draw
          @cake.draw
          @hurray.draw
          @loser.draw
        end

    end

window = MyGame.new
window.show
