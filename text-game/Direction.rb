module Direction
  format = "to the %s (%s) you see"

  DESCRIPTION = {
    'N' => format % ['north', 'N'],
    'NE' => format % ['north east', 'NE'],
    'E' => format % ['east', 'E'],
    'SE' => format % ['south east', 'SE'],
    'S' => format % ['south', 'S'],
    'SW' => format % ['south west', 'SW'],
    'W' => format % ['west', 'W'],
    'NW' => format % ['north west', 'NW']
  }
end
