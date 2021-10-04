module ThroneRoom
  Room_name = 'Throne Room'
  Valid_directions = ['NE', 'S']
  Description = 'a dimly lit throne ahead of you. Armor stands line the musky, red carpet leading to the throne.'
  Far_description = 'a dim throne'

  def ThroneRoom.enter(previous_room)
    Room.enter(Room_name, previous_room)
    ThroneRoom.decide
  end

  def ThroneRoom.decide
    Room.look(Description)
    decision = Room.move_or_act
    case decision
    when 'M'
      ThroneRoom.move
    when 'A'
      ThroneRoom.act
    end
  end

  def ThroneRoom.move
    Room.look("to the northeast (NE) you see a flickering candle in #{ButlerHallway::Far_description}")
    Room.look("to the south (S) you see #{MainHall::Far_description}")
    move = Room.move(Valid_directions)
    case move
    when 'NE'
      ThroneRoom.armor_death('small passageway')
    when 'S'
      MainHall.enter(Room_name)
    end
  end

  def ThroneRoom.act
    Room.look('the throne. Approach? (A)')
    Room.look('a backwards facing armor stand. Turn it around? (T)')
    action = Room.action(['A', 'T'])
    case action
    when 'A'
      ThroneRoom.kings_penalty
    when 'T'
      ThroneRoom.move_armor
    end
  end

  def ThroneRoom.kings_penalty
    puts 'The dead king\'s eyes light a blaze as you approach. Fog pours from his loose jaw. A deep rumbling stops as abruptly as it started. Without ceremony, your existance is snuffed out.'
    StandardResponse.bad_end
  end

  def ThroneRoom.armor_death(walk_location)
    puts "You walk towards the #{walk_location}, but are met by an oversided suit of armor. You take one fatal step too close. The armor cuts you down in one swift motion."
    StandardResponse.bad_end
  end

  def ThroneRoom.move_armor
    puts 'WIth great effort you rotate the armor stand to face forward. As you turn around, the armor creeks. You prepare for the worst, but as you turn around you see it rotate around again.'
    ThroneRoom.decide
  end
end
