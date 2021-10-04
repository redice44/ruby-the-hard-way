module StandardResponse
  def StandardResponse.prompt
    print '> '
  end

  def StandardResponse.invalid_entry(entry)
    puts "Invalid input #{entry}"
  end

  def StandardResponse.get_input(prompt, valid_input)
    while true
      puts prompt
      StandardResponse.prompt
      input = $stdin.gets.chomp.upcase
      puts "\n"
      if !valid_input.include?(input)
        StandardResponse.invalid_entry(input)
      else
        return input 
      end
    end
  end

  def StandardResponse.bad_end
    puts "\n\nYou lose."
  end
  
  def StandardResponse.good_end
    puts "\n\nYou win!"
  end
end

module Room
  def Room.enter(current_room, previous_room)
    puts "You enter the #{current_room} from the #{previous_room}"
  end

  def Room.look(description)
    puts "You see %s" % description
  end

  def Room.move(directions)
    prompt = "Which direction do you want to move? (#{directions})"
    return StandardResponse.get_input(prompt, directions)
  end

  def Room.action(actions)
    prompt = "What action do you want to take? (#{actions})"
    return StandardResponse.get_input(prompt, actions)
  end

  def Room.move_or_act
    prompt = "Do you want to move (M) to another room or perform an action (A) here?"
    return StandardResponse.get_input(prompt, ['M', 'A'])
  end
end

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

module ThroneRoom
  Room_name = 'Throne Room'
  Valid_directions = ['NE', 'S']
  Description = 'a dimly lit throne ahead of you. Armor stands line the musky, red carpet leading to the throne.'

  def ThroneRoom.far_description
    return 'a dim throne'
  end

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
    Room.look("to the northeast (NE) you see a flickering candle in #{ButlerHallway.far_description}")
    Room.look("to the south (S) you see #{MainHall.far_description}")
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

module Kitchen
  Room_name = 'Kitchen'
  Valid_directions = ['N', 'W']
  Description = 'a wild scene of hatches and flesh flying through the air. A skeleton with embers for eyes at the center'
  
  def Kitchen.far_description
    return 'a bustling kitchen'
  end

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
    Room.look("to the north (N) you see #{ButlerHallway.far_description}")
    Room.look("to the west (W) you see #{MainHall.far_description}")
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

module ButlerHallway
  Room_name = 'Butler Hallway'
  Valid_directions = ['N', 'S', 'W']
  Description = 'a small hallway with a faint light towards the end.'

  def ButlerHallway.far_description
    return 'a small butler hallway'
  end

  def ButlerHallway.enter(previous_room)
    Room.enter(Room_name, previous_room)
    Room.look(Description)
    ButlerHallway.move
  end

  def ButlerHallway.move
    Room.look("to the north (N) you see a faint light.")
    Room.look("to the south (S) you see #{Kitchen.far_description}")
    Room.look("to the west (W) you see #{ThroneRoom.far_description}")
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

MainHall.enter('warm, safe outdoors')
