# The input string containing the game result
game = "Philadelphia 76ers 104 Dallas Mavericks 88"

# Use a regular expression to match scores (assuming they are integers)
scores = game.scan(/\b\d+\b/).map(&:to_i)

# Extracted scores will be in an array
puts "Team 1 Score: #{scores[0]}"
puts "Team 2 Score: #{scores[1]}"


index = game.index(scores[0].to_s)
index2 = game.index(scores[1].to_s)

team_1 = game[0..index-2]
team_2 = game[(index+scores[0].to_s.length+1)..index2-2]

puts "Team 1: #{team_1}"
puts "Team 2: #{team_2}"
