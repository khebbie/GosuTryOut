class LevelController
  attr_reader :level
  def initialize(game_window)
    @game_window = game_window
    @level = 1

    @dog = Player.new(@game_window, "images/dog_icon.png")
    @dog_mower = DogMower.new(@dog)
    @dog.x = 100
    @dog.y = 300
    @dog.pixel_movement = 10

    @dog2 = Player.new(game_window, "images/dog_icon.png")
    @dog_mower2 = DogMower.new(@dog2)
    @dog2.x = 300
    @dog2.y = 50
    @dog2.pixel_movement = 10

  end

  def hit_by?(player)
    player.hit_by?(@dog) or player.hit_by?(@dog2)

  end

  def level_up
    @level += 1
    @dog2.draw

  end

  def draw
    @dog.draw

  end

  def update
    @dog_mower.update
    @dog_mower2.update

  end


end
