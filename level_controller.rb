class LevelController
  attr_reader :level
  def initialize(game_window)
    @game_window = game_window
    @level = 1
    @dogs = Array.new
    @dogmovers = Array.new

    createDog(0, 300)
    createDog(300, 50)
    createDog(500, 150)
    createDog(200, 250)
    createDog(150, 50)
    createDog(150, 450)
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
player.x= 150
player.y = 0
  end

  def draw
	@dogs.each do |dog|
		dog.draw
	end
  end

  def update
	@dogmovers.each do |mover|
		mover.update
	end    

  end
end
