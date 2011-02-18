class Player

  attr_accessor :y
  attr_accessor :x
  attr_reader :right_boundry
  attr_reader :bottom_boundry

  def initialize(game_window, icon_path)
    @game_window = game_window
    @icon = Gosu::Image.new(@game_window,  icon_path, true)
    @x = 0
    @y = 0
    @right_boundry = @game_window.width - @icon.width
    @bottom_boundry = @game_window.height - @icon.height

  end

  def draw
    @icon.draw(@x, @y, 1)
  end
  def move_left
    if @x > 0
      @x -= 5
    end
  end

  def move_right
        if @x < @right_boundry
      @x += 5
    end
  end

  def move_up
     if @y > 0
      @y -= 5
    end
  end

  def move_down
        if @y < @bottom_boundry
      @y += 5
    end
  end

  def hit_by?(player)
    Gosu::distance(@x, @y, player.x, player.y) < 50
  end

end

