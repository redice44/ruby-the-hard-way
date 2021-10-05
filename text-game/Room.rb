require "./StandardResponse.rb"

class Room
  attr_reader :far_description
  attr_reader :name

  def initialize(name, description, far_description)
    @description = description
    @far_description = far_description
    @name = name
    @paths = []
    @path_room = {}
    @directions = []
  end
  
  def add_path(path)
    @paths.push(path)
    @path_room[path.direction] = path.room
    @directions.push(path.direction)
  end

  def enter(previous_room)
    puts "You enter the #{@name} from the #{previous_room}"
  end

  def decide
    look(@description)
    return move_or_act
  end

  def look(description)
    puts "You see %s" % description
  end

  def move
    path_dict = {}
    @paths.each { |path| look(path.description) }
    prompt = "Which direction do you want to move? (#{@directions})"
    direction = StandardResponse.get_input(prompt, @directions)
    return @path_room[direction]
  end

  def action(actions)
    prompt = "What action do you want to take? (#{actions})"
    return StandardResponse.get_input(prompt, actions)
  end

  def move_or_act
    prompt = "Do you want to move (M) to another room or perform an action (A) here?"
    return StandardResponse.get_input(prompt, ['M', 'A'])
  end
end
