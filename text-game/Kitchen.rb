module Kitchen
  Room_name = 'Kitchen'
  Valid_directions = ['N', 'W']
  Description = 'a wild scene of hatches and flesh flying through the air. A skeleton with embers for eyes at the center'
  Far_description = 'a bustling kitchen'

  def Kitchen.enter(previous_room)
    Room.enter(Room_name, previous_room)
    Kitchen.decide
  end

  def Kitchen.decide
    Room.look(Description)
    decision = Room.move_or_act
    case decision
    when 'M'
      Kitchen.move
    when 'A'
      Kitchen.act
    end
  end

  def Kitchen.move
    Room.look("to the north (N) you see #{ButlerHallway::Far_description}")
    Room.look("to the west (W) you see #{MainHall::Far_description}")
    move = Room.move(Valid_directions)
    case move
    when 'N'
      ButlerHallway.enter(Room_name)
    when 'W'
      MainHall.enter(Room_name)
    end
  end

  def Kitchen.act
    Room.look('a juicy piece of meat. Man you\'re hungry. Take the meat? (T)')
    Room.look('a cleaver on the table. Attack the chef? (A)')
    action = Room.action(['T', 'A'])
    case action
    when 'T'
      Kitchen.too_much_food
    when 'A'
      Kitchen.poor_chef
    end
  end

  def Kitchen.too_much_food
    puts 'You sneakily grab the haunch of meat and take a bite. An intense wave of gluttony overcomes you. You stand there and eat and eat and eat. You notice the undead chef keeps the meat coming. It\'s your last thought.'
    StandardResponse.bad_end
  end

  def Kitchen.poor_chef
    puts 'You grab the cleaver, yell, and charge at the Chef. Swinging wildly with your eyes shut. You connect! You strike again and again. You open eyes to bask in your victory, but are met with the chef\'s face of sadness. It sulks and mumbles, "I just want to cook good food."'
    puts 'A bit baffled you feel bad and put down the cleaver.'
    Kitchen.decide
  end
end
