class LevelController
  attr_reader :level
  def initialize(game_window)
    @game_window = game_window
    @level = 1
    @dogs = Array.new
    @dogmovers = Array.new
@font = Gosu::Font.new(game_window, Gosu::default_font_name, 20)
	Level1()
  end
def Level4()
createDog(500, 800)
Level3()
  end

 def Level3()
    createDog(800, 50)
Level2()
  end

 def Level2()
    createDog(0, 300)
    createDog(500, 150)
    createDog(150, 600)
	Level1()
  end

  def Level1()
    createDog(200, 250)
    createDog(50, 80)
    createDog(550, 450)

  end

  def createDog(x,y)
    dog = Player.new(@game_window, "images/dog_icon.png")
    dog_mower = DogMower.new(dog)
    dog.x = x
    dog.y = y 
    dog.pixel_movement = 10
    @dogs.push dog	
    @dogmovers.push dog_mower
end
  def hit_by?(player)
	@dogs.each do |dog|
		return true if player.hit_by?(dog)
	end
	false
  end

  def level_up(player)
    @level += 1
player.x= 0
player.y = 0
   @dogs = Array.new
   @dogmovers = Array.new
  self.send("Level#{@level}")
  end


  def draw
	@dogs.each do |dog|
		dog.draw
	end
@font.draw("Level #{@level}", 10, 10, ZOrder::UI, 1.0, 1.0, 0xffffff00)

  end

  def update
	@dogmovers.each do |mover|
		mover.update
	end    

  end
  end
module ZOrder
  Background, Stars, Player, UI = *0..3
end

