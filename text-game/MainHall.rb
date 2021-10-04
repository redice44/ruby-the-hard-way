module MainHall
  Room_name = 'Main Hall'
  Valid_directions = ['N', 'E', 'W']
  Description = 'tall pillars and long, candle lit tables'

  def MainHall.far_description
    return "the flickering canles on the tables of the #{Room_name}"
  end

  def MainHall.enter(previous_room)
    Room.enter(Room_name, previous_room)
    MainHall.decide
  end

  def MainHall.decide
    Room.look(Description)
    decision = Room.move_or_act
    case decision
    when 'M'
      MainHall.move
    when 'A'
      MainHall.act
    end
  end

  def MainHall.move
    Room.look("to the north (N) you see #{ThroneRoom.far_description}")
    Room.look("to the east (E) you see #{Kitchen.far_description}")
    Room.look("to the west (W) you see #{Dungeon.far_description}")
    move = Room.move(Valid_directions)
    case move
    when 'N'
      ThroneRoom.enter(Room_name)
    when 'E'
      Kitchen.enter(Room_name)
    when 'W'
      Dungeon.enter(Room_name)
    end
  end

  def MainHall.act
    Room.look('an inviting seat at the table. Sit? (S)')
    Room.look('a long crack in one of the pillars. Investigate? (I)')
    action = Room.action(['S', 'I'])
    case action
    when 'S'
      MainHall.comfy_chair
    when 'I'
      MainHall.room_collapse
    end
  end

  def MainHall.comfy_chair
    puts 'You sit down in the surprisingly comforatable chair. Your body relaxes in its cloud-like embrace. You comforatably drift into your final sleep.'
    StandardResponse.bad_end
  end

  def MainHall.room_collapse
    puts 'You walk over to the long crack and examine it. Curious if it is stable, you knock it with your hand. Dust shakes from the ceiling. Creeking strain of stone echos through the hall. You lean against the pill and slide to the ground, accepting the foreseen outcome.'
    StandardResponse.bad_end
  end
end
