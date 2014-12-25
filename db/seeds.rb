Position.delete_all
[
  ["Politician", "POLT"],
  ["Actor", "ACTR"],
  ["Actress", "ACTR"],
  ["Athlete", "ATHL"],
  ["Musician", "MUSC"],
  ["Comedian", "COMD"],
  ["Dead Person", "DEAD"],
  ["Reality Star", "REAL"],
  ["Flex", "FLEX"],
  ["Other", "OTHR"],
  ["Bench", "BNCH"]
].each do |name, abbreviation|
  Position.create!(:name => name, :abbreviation => abbreviation)
end

League.delete_all
league = League.create!(:name => 'The Leagues of Champions')

[
  ["ACTR", 2],
  ["ATHL", 1],
  ["MUSC", 1],
  ["POLT", 1],
  ["DEAD", 1],
  ["REAL", 1],
  ["FLEX", 2],
  ["BNCH", 6]
].each do |pos, cnt|
  league.league_roster_slots.create!(:position => Position.find_by_abbreviation(pos), :count => cnt)
end

Team.delete_all
[
  "Jackson",
  "Sebas",
  "Prof",
  "Lynch",
  "Connors",
  "Gabe",
  "Geoff",
  "Matty",
  "Joel",
  "Kies",
  "Kevin",
  "Lou",
  "Vinny"].each do |title|
  Team.create!(:title => title, :league => league)
end

Player.delete_all
[
  ["Britany Spears", "MUSC"],
  ["Lindsay Lohan", "ACTR"],
  ["Andy Dick", "COMD"],
  ["amy winehouse", "MUSC"],
  ["angelina", "REAL"],
  ["kanye", "MUSC"],
  ["paula abdul", "MUSC"],
  ["artie lang", "COMD"],
  ["lady gaga", "MUSC"],
  ["charlie sheen", "ACTR"],
  ["tom sizemore", "ACTR"],
  ["Millard Fillmore", "DEAD"],
  ["Kwame Kilpatrick", "POLT"],
  ["snooki", "REAL"],
  ["lilly allen", "MUSC"],
  ["gary coleman", "ACTR"],
  ["50 cent", "MUSC"],
  ["megan fox", "ACTR"],
  ["mitch mcconnell", "POLT"],
  ["jack nicholson", "ACTR"],
  ["jessica simpson", "MUSC"],
  ["madonna", "MUSC"],
  ["sean penn", "ACTR"],
  ["dustin diamond", "ACTR"],
  ["Lil Wayne", "MUSC"],
  ["Lenny Dykstra", "ATHL"],
  ["paris hilton", "REAL"],
  ["janis dickenson", "ACTR"],
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
  ["Tom Cruise", "ACTR"],
  ["johnny weir", "ATHL"],
  ["katy perry", "MUSC"],
  ["Fidel Castro", "POLT"],
  ["hugo chavez", "POLT"],
  ["tiger woods", "ATHL"],
  ["dr. conrad murray", "OTHR"],
  ["whitney houston", "MUSC"],
  ["micky rourke", "ACTR"],
  ["Lauren Conrad", "REAL"],
  ["Alex Rodriguez", "ATHL"],
  ["allen iverson", "ATHL"],
  ["Carmello Anthony", "ATHL"],
  ["Billy Bob Thorton", "ACTR"],
  ["kim jong il", "POLT"],
  ["rod blogojevich", "POLT"],
  ["boy george", "MUSC"],
  ["ron artest", "ATHL"],
  ["bill clinton", "POLT"],
  ["cameron douglas", "ACTR"],
  ["chad ocho cinco", "ATHL"],
  ["jose canseco", "ATHL"],
  ["alexa ray joel", "MUSC"],
  ["jwoww", "REAL"],
  ["miley cyrus", "MUSC"],
  ["Spencer Pratt", "REAL"],
  ["Andre the giant", "DEAD"],
  ["joan rivers", "ACTR"],
  ["michael jackson", "DEAD"],
  ["Tila Tequila", "REAL"],
  ["kristin cavallari", "REAL"],
  ["ellen degeneres", "ACTR"],
  ["brittany murphy", "ACTR"],
  ["POTGG", "REAL"],
  ["kim kardashian", "REAL"],
  ["L Ron Hubbard", "OTHR"],
  ["CT", "REAL"],
  ["charles barkley", "ACTR"],
  ["Anne Hathaway", "ACTR"],
  ["T.I.", "MUSC"],
  ["dakota fanning", "ACTR"],
  ["dmx", "MUSC"],
  ["gary busey", "ACTR"],
  ["mischa barton", "ACTR"],
  ["george washington", "DEAD"],
  ["joey kovar", "REAL"],
  ["mitt romney", "POLT"],
  ["jennifer aniston", "ACTR"],
  ["vienna girardi", "REAL"],
  ["courtney love", "MUSC"],
  ["paul reubens", "ACTR"],
  ["Jenna Jameson", "ACTR"],
  ["Pauly D", "REAL"],
  ["ted williams", "DEAD"],
  ["TO", "ATHL"],
  ["tiffany pollard", "REAL"],
  ["frank sinatra", "DEAD"],
  ["john mayer", "MUSC"],
  ["andrew koenig", "DEAD"],
  ["Gretchen Rossi ", "REAL"],
  ["JFK", "DEAD"],
  ["brian austin green", "ACTR"],
  ["Patrick Swayze", "DEAD"],
  ["the miz", "REAL"],
  ["Hugh Hefner", "OTHR"],
  ["Ric Flair", "ATHL"],
  ["Mary Kate Olsen", "ACTR"],
  ["carrot top", "COMD"],
  ["hitler", "DEAD"],
  ["alec baldwin", "ACTR"],
  ["al davis", "OTHR"],
  ["kesha", "MUSC"],
  ["king tut", "DEAD"],
  ["nadya suleman", "REAL"],
  ["kim yu-na", "ATHL"],
  ["scott brown", "POLT"],
  ["elvis", "DEAD"],
  ["Perez Hilton", "REAL"],
  ["Vince Shlomi", "OTHR"],
].each do |name, position|
  Player.create!(:first_name => name.split(' ').first, :last_name => name.split(' ')[1..-1].join(' '), :position => Position.find_by_abbreviation(position))
end

order = []
9.times { order += Team.all }

players = Player.all.to_a
order.each do |team|
  player = players.pop
  team.assign_player(player, player.position)
end
