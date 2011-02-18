class Dog
def initialize(game_window, icon_path)
    @game_window = game_window
    @icon = Gosu::Image.new(@game_window, "images/dog_icon.png", true)
    @x = 50
    @y = 50
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
    right_boundry = @game_window.width - @icon.width
    if @x < right_boundry
      @x += 5
    end
  end

  def move_up
     if @y > 0
      @y -= 5
    end
  end

  def move_down
     bottom_boundry = @game_window.height - icon.height
    if @y < bottom_boundry
      @y += 5
    end
  end


end
