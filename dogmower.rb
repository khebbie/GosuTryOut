class DogMower
  def initialize(dog)
    @dog = dog
    @should_move_right = false 
  end

  def update
    if @dog.x >  @dog.right_boundry
      @should_move_right = false
    end
    if @dog.x == 0
      @should_move_right = true
    end
    if @should_move_right
      @dog.move_right
    else
      @dog.move_left
    end
  end
end
