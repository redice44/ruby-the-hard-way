require "./Room.rb"
require "./StandardResponse.rb"

class ButlerHallway < Room
  def initialize
    super(
      'Butler Hallway',
      'a small hallway with a faint light towards the end.',
      'a small butler hallway'
    )
  end
end
