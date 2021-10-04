module ButlerHallway
  Room_name = 'Butler Hallway'
  Valid_directions = ['N', 'S', 'W']
  Description = 'a small hallway with a faint light towards the end.'
  Far_description = 'a small butler hallway'

  def ButlerHallway.enter(previous_room)
    Room.enter(Room_name, previous_room)
    Room.look(Description)
    ButlerHallway.move
  end

  def ButlerHallway.move
    Room.look("to the north (N) you see a faint light.")
    Room.look("to the south (S) you see #{Kitchen::Far_description}")
    Room.look("to the west (W) you see #{ThroneRoom::Far_description}")
    move = Room.move(Valid_directions)
    case move
    when 'N'
      puts 'You feel a breeze of fresh air. You can sense the exit is just ahead.'
      StandardResponse.good_end
    when 'S'
      Kitchen.enter(Room_name)
    when 'W'
      ThroneRoom.armor_death('Throne Room')
    end
  end
end
