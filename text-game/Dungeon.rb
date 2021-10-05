require "./Room.rb"
require "./StandardResponse.rb"

class Dungeon < Room
  def initialize
    super(
      'Dungeon',
      'a thick fog as you descend the spiral staircase. The torches become further apart until there is barely any light. Holding your hand against the wall you continue to descend. Your next and final step is no step at all. The stairs have ended. You fall into the void never to be see again.',
      'dark, stairs going down.'
    )
  end

  def enter(previous_room)
    super(previous_room)
    look(@description)
    StandardResponse.bad_end
  end
end
