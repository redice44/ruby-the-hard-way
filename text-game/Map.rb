require "./ButlerHall.rb"
require "./Dungeon.rb"
require "./Kitchen.rb"
require "./MainHall.rb"
require "./Outside.rb"
require "./Path.rb"
require "./ThroneRoom.rb"

class Map
  def initialize(starting_area)
    @starting_area = starting_area
    @main_hall = MainHall.new()
    @throne_room = ThroneRoom.new()
    @kitchen = Kitchen.new()
    @dungeon = Dungeon.new()
    @butler_hallway = ButlerHallway.new()
    @outside = Outside.new()

    @main_hall.add_path(Path.new('N', @throne_room))
    @main_hall.add_path(Path.new('E', @kitchen))
    @main_hall.add_path(Path.new('W', @dungeon))

    @throne_room.add_path(Path.new('S', @main_hall))
    @throne_room.add_path(Path.new('NE', @butler_hallway)) # TODO: Kill instead (armor_death)

    @kitchen.add_path(Path.new('W', @main_hall))
    @kitchen.add_path(Path.new('N', @butler_hallway))

    @butler_hallway.add_path(Path.new('S', @kitchen))
    @butler_hallway.add_path(Path.new('W', @throne_room)) # TODO: Kill instead (armor_death)
    @butler_hallway.add_path(Path.new('N', @outside))

    @outside.add_path(Path.new('N', @main_hall))
  end

  def start
    game_loop(@main_hall, @starting_area)
  end

  def game_loop(starting_room, starting_area)
    play_room(starting_room, starting_area)
  end

  def play_room(room, previous_room)
    room.enter(previous_room)
    decision = room.decide
    case decision
    when 'M'
      next_room = room.move
      play_room(next_room, room.name)
    when 'A'
      room.act
    end
    play_room(room, previous_room)
  end
end
