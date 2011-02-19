require 'rubygems'
require 'gosu'
require 'player'
require 'dogmower'
require 'level_controller'

class MyGame < Gosu::Window
    def initialize
      super(800, 600, false)
      @player1 = Player.new(self, "images/player1_icon.png")

      @cake = Player.new(self, "images/cake_icon.png")
      @cake.y = 500
      @cake.x = 50

      @hurray = Player.new(self, "images/hurray.png")
      @hurray.x = -300
      @hurray.y = -300

      @loser= Player.new(self, "images/loser.png")
      @loser.x = -300
      @loser.y = -300


      @has_won = false
      @has_lost = false

      @level_controller = LevelController.new(self)
    end

    def update
    if button_down? Gosu::Button::KbEscape
        close
    end

     if @has_won
        @hurray.move_down
        @hurray.move_right
        if button_down? Gosu::Button::KbEnter
          @has_won = false
        end

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
      if @level_controller.hit_by?(@player1)
          @has_lost = true 
      end

        if @cake.hit_by?(@player1)
          @has_won = true
          @level_controller.level_up
        end

        @level_controller.update
      end
    end

        def draw
          @player1.draw
          @cake.draw
          @hurray.draw
          @loser.draw
          @level_controller.draw
        end

    end

window = MyGame.new
window.show
