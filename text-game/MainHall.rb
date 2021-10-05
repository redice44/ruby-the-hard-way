require "./Room"
require "./StandardResponse.rb"

class MainHall < Room
  def initialize
    super(
      'Main Hall', 
      'tall pillars and long, candle lit tables',
      'the flickering candles on the tables of the Main Hall'
    )
  end

  def act
    look('an inviting seat at the table. Sit? (S)')
    look('a long crack in one of the pillars. Investigate? (I)')
    action = action(['S', 'I'])
    case action
    when 'S'
      comfy_chair
    when 'I'
      room_collapse
    end
  end

  def comfy_chair
    puts 'You sit down in the surprisingly comforatable chair. Your body relaxes in its cloud-like embrace. You comforatably drift into your final sleep.'
    StandardResponse.bad_end
  end

  def room_collapse
    puts 'You walk over to the long crack and examine it. Curious if it is stable, you knock it with your hand. Dust shakes from the ceiling. Creeking strain of stone echos through the hall. You lean against the pill and slide to the ground, accepting the foreseen outcome.'
    StandardResponse.bad_end
  end
end
