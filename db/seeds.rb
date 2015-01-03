require 'waiver_wire'

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
  WaiverWire.add_player(team, player.id)
end

ScoringCategory.delete_all
%w(Legal Fighting Career Marital Health Other).each do |category|
  ScoringCategory.create!(:name => category)
end

ScoringStatistic.delete_all
[
  ['Legal', 'DUI', 20],
  ['Legal', 'Posession of Drugs', 20],
  ['Legal', 'Sale of Drugs', 30],
  ['Legal', 'Fraud', 30],
  ['Legal', 'Tax Evasion', 30],
  ['Legal', 'Insider Trading', 25],
  ['Legal', 'Murder', 100],
  ['Legal', 'Rape', 80],
  ['Legal', 'Weapon posession', 25],
  ['Legal', 'Car crash (your fault)', 20],
  ['Legal', 'Bribe', 20],
  ['Legal', 'Bankruptcy', 40],
  ['Legal', 'Being sued', 30],
  ['Legal', 'Sueing somebody', 30],
  ['Legal', 'Killing animals', 60],
  ['Legal', 'Being caught in the slave trade', 125],
  ['Legal', 'Caught shoplifting', 25],
  ['Legal', 'Disowning your parents', 45],
  ['Legal', 'Armed robbery', 65],
  ['Legal', 'Public Intoxication', 20],
  ['Legal', 'Other arrest', 20],
  ['Fighting', 'Disorderly Conduct', 15],
  ['Fighting', 'Assaulting Paparazzi', 20],
  ['Fighting', 'Getting Punched and not fighting back', -10],
  ['Fighting', 'Fighting with a weapon', 40],
  ['Fighting', 'Putting someone in the hospital', 5],
  ['Career', 'Leaked Sex Tape', 0],
  ['Career', 'Appearing in Nude magazine on purpose', 20],
  ['Career', 'Leaked nude pictures', 25],
  ['Career', 'Crossing Industry Lines (allan iverson rapping)', 20],
  ['Career', 'Being on a reality show', 20],
  ['Career', 'Having your own reality show', 30],
  ['Career', 'Winning an award in your industry', 10],
  ['Career', 'being in a gossip story with gary busey, mike tyson', 15],
  ['Career', 'start dating someone more than 15 yrs younger', 5],
  ['Career', 'Nip Slip', 10],
  ['Marital', 'Domestic Violence', 5],
  ['Marital', 'Molestation', 50],
  ['Marital', 'Being molested', 65],
  ['Marital', 'Child Porn', 35],
  ['Marital', 'Being in child porn', 80],
  ['Marital', 'Legitimate Child', -10],
  ['Marital', 'Bastard Child', 15],
  ['Marital', 'Divorce', 15],
  ['Marital', 'Marriage within 6 months of dating', 25],
  ['Marital', 'Marriage after 6 months', -15],
  ['Marital', 'Cheating on gf/bf', 15],
  ['Marital', 'Cheating on spouse', 30],
  ['Marital', 'Coming out gay', 50],
  ['Marital', 'Adoption', -15],
  ['Marital', 'Peeing or Pooping on sexual partner', 30],
  ['Health', 'Confirmed contraction of an STD', 30],
  ['Health', 'Hospital Visit (non-routine)', 15],
  ['Health', 'Eating Disorder', 10],
  ['Health', 'Plastic Surgery', 5],
  ['Health', 'Over Dose', 30],
  ['Health', 'Televised Drunken Appearance', 25],
  ['Health', 'Attempted Suicide - Drugs', 45],
  ['Health', 'Attempted Suicide - Other', 65],
  ['Health', 'Successful Suicide - Drugs', 80],
  ['Health', 'Successful Suicide - Other', 100],
  ['Health', 'Base (Normal) Death', 65],
  ['Health', 'Awesome Death', 30],
  ['Health', 'Being Murdered', 50],
  ['Health', 'Burning Alive', 175],
  ['Health', 'Going to Rehab', 15],
  ['Health', 'Sex related death', 20],
  ['Health', 'Vomits in public', 20],
  ['Health', 'Girl accused of having penis', 40],
  ['Health', 'Having a testicle removed', 40],
  ['Health', 'Sex Change', 60],
  ['Health', 'Being eaten by a wild animal', 150],
  ['Health', 'Private phone calls being leaked', 10],
  ['Health', 'Admitting drug use for the first time', 10],
  ['Health', 'Becoming paralized', 50],
  ['Health', 'Getting shot', 50],
  ['Health', 'Caught crossdressing', 30],
  ['Health', 'Incest', 50],
  ['Health', 'Caught beefing in public', 20],
  ['Health', 'Committed to psych ward', 50],
  ['Other', 'Having a fast food restaurant named after you', 150],
  ['Other', 'Pet eaten by wild animal', 40],
  ['Other', 'Being attacked by a monkey', 60],
  ['Other', 'Becoming a minister', 35],
  ['Other', 'Becoming an endorser of Subway or Taco Bell', 25],
  ['Other', 'Getting a visible tattoo above the shoulders', 15],
  ['Other', 'Getting caught mooning somebody', 5],
  ['Other', 'Caught letting dog shit and not picking it up', 15],
  ['Other', 'Wearing a mask in public', 15],
  ['Other', 'Claiming you saw ghosts, aliens, or UFOs', 20],
  ['Other', 'Joining or leading a cult', 35],
  ['Other', 'Inexplicably disappearing for days at a time', 30],
  ['Other', 'Has Pog Collection or plays magic the gathering', 20],
  ['Other', 'Accused of Cannibalism', 250],
  ['Other', 'Caught harboring illegal immigrants', 150],
  ['Other', 'Caught smuggling monkeys or rare birds', 200],
  ['Other', 'Caught clubbing baby seals', 200],
  ['Other', 'Seen stale fishing', 45],
  ['Other', 'Other']
].each do |cat, desc, pts|
  ScoringStatistic.create!(:description => desc, :scoring_category => ScoringCategory.find_by_name(cat), :suggested_points => pts)
end

PointSubmission.delete_all
150.times do
  PointSubmission.create!(
    :proof_url => Faker::Internet.url('example.com'),
    :scoring_statistic => ScoringStatistic.offset(rand(ScoringStatistic.count)).first,
    :status => ['submitted', 'approved', 'rejected'].shuffle.first,
    :player => Player.offset(rand(Player.count)).first,
    :comment => Faker::Lorem.sentence(6)
  )
end


