module Dungeon
  Room_name = 'Dungeon'
  Description = 'a thick fog as you descend the spiral staircase. The torches become further apart until there is barely any light. Holding your hand against the wall you continue to descend. Your next and final step is no step at all. The stairs have ended. You fall into the void never to be see again.'

  def Dungeon.far_description
    return 'dark, stairs going down.'
  end

  def Dungeon.enter(previous_room)
    Room.enter(Room_name, previous_room)
    Room.look(Description)
    StandardResponse.bad_end
  end
end
