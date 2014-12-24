Position.delete_all
[
  ["Politician", "POLT"],
  ["Actor", "ACTR"],
  ["Actress", "ACTS"],
  ["Athlete", "ATHL"],
  ["Musician", "MUSC"],
  ["Dead Person", "DEAD"],
  ["Reality Show Star", "REAL"]
].each do |name, abbreviation|
  Position.create!(:name => name, :abbreviation => abbreviation)
end

Team.delete_all
["Geoff's Geoggers", "Prof's Pranksters", "Matty's Minglers"].each do |title|
  Team.create!(:title => title)
end

Player.delete_all
[
  ["Britany Spears", "MUSC"],
  ["Lindsay Lohan", "ACTS"],
  ["Andy Dick", "ACTR"],
  ["amy winehouse", "MUSC"],
  ["angelina", "REAL"],
  ["kanye", "MUSC"],
  ["paula abdul", "MUSC"],
  ["artie lang", "ACTR"],
  ["lady gaga", "MUSC"],
  ["charlie sheen", "ACTR"],
  ["tom sizemore", "ACTR"],
  ["Millard Fillmore", "DEAD"],
  ["Kwame Kilpatrick", "POLT"],
  ["snooki", "REAL"],
  ["lilly allen", "MUSC"],
  ["gary coleman", "ACTR"],
  ["50 cent", "MUSC"],
  ["megan fox", "ACTS"],
  ["mitch mcconnell", "POLT"],
  ["jack nicholson", "ACTR"],
  ["jessica simpson", "MUSC"],
  ["madonna", "MUSC"],
  ["sean penn", "ACTR"],
  ["dustin diamond", "ACTR"],
  ["Lil Wayne", "MUSC"],
  ["Lenny Dykstra", "ATHL"],
  ["paris hilton", "REAL"],
  ["janis dickenson", "ACTS"],
  ["mike tyson", "ATHL"],
  ["dennis rodman", "ATHL"],
  ["the situation", "REAL"],
  ["marvin harrison", "ATHL"],
  ["mel gibson", "ACTR"],
  ["silvio berlusconi", "POLT"],
  ["osama bin laden", "POLT"],
  ["heidi montag", "REAL"],
  ["charles rangel", "POLT"],
  ["Nancy Pelosi", "POLT"],
  ["Tom Cruise", "ACTR"]
].each do |name, position|
  Player.create!(:first_name => name.split(' ').first, :last_name => name.split(' ')[1..-1].join(' '), :position => Position.find_by_abbreviation(position))
end

Player.all.shuffle.in_groups(Team.count).zip(Team.all).each do |players, team|
  team.players = players
end
