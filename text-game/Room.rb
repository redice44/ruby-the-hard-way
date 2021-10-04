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
