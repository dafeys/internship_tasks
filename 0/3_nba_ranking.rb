# https://www.codewars.com/kata/ranking-nba-teams

r = "Los Angeles Clippers 104 Dallas Mavericks 88,New York Knicks 101 Atlanta Hawks 112,Indiana Pacers 103 Memphis Grizzlies 112,"\
     "Los Angeles Lakers 111 Minnesota Timberwolves 112,Phoenix Suns 95 Dallas Mavericks 111,Portland Trail Blazers 112 New Orleans Pelicans 94,"\
     "Sacramento Kings 104 Los Angeles Clippers 111,Houston Rockets 85 Denver Nuggets 105,Memphis Grizzlies 76 Cleveland Cavaliers 106,"\
     "Milwaukee Bucks 97 New York Knicks 122,Oklahoma City Thunder 112 San Antonio Spurs 106,Boston Celtics 112 Philadelphia 76ers 95,"\
     "Brooklyn Nets 100 Chicago Bulls 115,Detroit Pistons 92 Utah Jazz 87,Miami Heat 104 Charlotte Hornets 94,"\
     "Toronto Raptors 106 Indiana Pacers 99,Orlando Magic 87 Washington Wizards 88,Golden State Warriors 111 New Orleans Pelicans 95,"\
     "Atlanta Hawks 94 Detroit Pistons 106,Chicago Bulls 97 Cleveland Cavaliers 95,"\
     "San Antonio Spurs 111 Houston Rockets 86,Chicago Bulls 103 Dallas Mavericks 102,Minnesota Timberwolves 112 Milwaukee Bucks 108,"\
     "New Orleans Pelicans 93 Miami Heat 90,Boston Celtics 81 Philadelphia 76ers 65,Detroit Pistons 115 Atlanta Hawks 87,"\
     "Toronto Raptors 92 Washington Wizards 82,Orlando Magic 86 Memphis Grizzlies 76,Los Angeles Clippers 115 Portland Trail Blazers 109,"\
     "Los Angeles Lakers 97 Golden State Warriors 136,Utah Jazz 98 Denver Nuggets 78,Boston Celtics 99 New York Knicks 85,"\
     "Indiana Pacers 98 Charlotte Hornets 86,Dallas Mavericks 87 Phoenix Suns 99,Atlanta Hawks 81 Memphis Grizzlies 82,"\
     "Miami Heat 110 Washington Wizards 105,Detroit Pistons 94 Charlotte Hornets 99,Orlando Magic 110 New Orleans Pelicans 107,"\
     "Los Angeles Clippers 130 Golden State Warriors 95,Utah Jazz 102 Oklahoma City Thunder 113,San Antonio Spurs 84 Phoenix Suns 104,"\
     "Chicago Bulls 103 Indiana Pacers 94,Milwaukee Bucks 106 Minnesota Timberwolves 88,Los Angeles Lakers 104 Portland Trail Blazers 102,"\
     "Houston Rockets 120 New Orleans Pelicans 100,Boston Celtics 111 Brooklyn Nets 105,Charlotte Hornets 94 Chicago Bulls 86,"\
     "Cleveland Cavaliers 103 Dallas Mavericks 97"

         
def nba_cup(r, to_find)
  return "" if to_find.empty?

  ranking = Hash.new { |hash, key| hash[key] = {W: 0, D: 0, L: 0, Scored: 0, Conceded: 0, Points: 0} }
  games = r.split(',')

  games.each do |game|
    return "Error(float number):#{game}" if game.include?(".")

    game_scores = game.scan(/\b\d+\b/).map(&:to_i)

    score1_index = game.index(game_scores[0].to_s)
    score2_index = game.index(game_scores[1].to_s)

    team1 = game[0..score1_index-2]
    team2 = game[(score1_index+game_scores[0].to_s.length+1)..score2_index-2]

    ranking[team1.to_sym][:Scored] += game_scores[0]
    ranking[team2.to_sym][:Scored] += game_scores[1]

    ranking[team1.to_sym][:Conceded] += game_scores[1]
    ranking[team2.to_sym][:Conceded] += game_scores[0]
    
    if game_scores[0] > game_scores[1]
      ranking[team1.to_sym][:W] += 1
      ranking[team2.to_sym][:L] += 1
      ranking[team1.to_sym][:Points] += 3
    elsif game_scores[0] == game_scores[1]
      ranking[team1.to_sym][:D] += 1
      ranking[team2.to_sym][:D] += 1
      ranking[team1.to_sym][:Points] += 1
      ranking[team2.to_sym][:Points] += 1
    else
      ranking[team2.to_sym][:W] += 1
      ranking[team1.to_sym][:L] += 1
      ranking[team2.to_sym][:Points] += 3
    end

  end
  
  if ranking.key?(to_find.to_sym)
    formatted_data = ranking[to_find.to_sym].map { |key, value| "#{key}=#{value}" }
    scores_string = formatted_data.join(";")
    "#{to_find}:#{scores_string}"
  else
    "#{to_find}:This team didn't play!"
  end
end


p nba_cup(r, "Portland Trail Blazers")
p nba_cup(r, "Boston Celtics")
p nba_cup(r, "Charlotte Hornets")
p nba_cup(r, "Moesko")
p nba_cup(r, "")
