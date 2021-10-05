require "./Room.rb"
require "./StandardResponse.rb"

class ThroneRoom < Room
  def initialize()
    super(
      'Throne Room',
      'a dimly lit throne ahead of you. Armor stands line the musky, red carpet leading to the throne.',
      'a dim throne'
    )
  end

  def act
    look('the throne. Approach? (A)')
    look('a backwards facing armor stand. Turn it around? (T)')
    action = action(['A', 'T'])
    case action
    when 'A'
      kings_penalty
    when 'T'
      move_armor
    end
  end

  def kings_penalty
    puts 'The dead king\'s eyes light a blaze as you approach. Fog pours from his loose jaw. A deep rumbling stops as abruptly as it started. Without ceremony, your existance is snuffed out.'
    StandardResponse.bad_end
  end

  def armor_death(walk_location)
    puts "You walk towards the #{walk_location}, but are met by an oversided suit of armor. You take one fatal step too close. The armor cuts you down in one swift motion."
    StandardResponse.bad_end
  end

  def move_armor
    puts 'WIth great effort you rotate the armor stand to face forward. As you turn around, the armor creeks. You prepare for the worst, but as you turn around you see it rotate around again.'
    decide
  end
end
