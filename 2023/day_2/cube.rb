#!/usr/bin/env ruby

def valid_games
  game_results = []
  input = File.open('input.txt').read
  games = input.split("\n")

  games.each do |game|
    result = validate_game(game)
    game_results.push(result)
  end

  possible_games = game_results.reject{ |game| game == false }
  puts possible_games.map(&:to_i).sum
end

def validate_game(game)
  result = parse_game(game)
end

def parse_game(game)
  max_cubes = {"red"   => 12,
               "green" => 13,
               "blue"  => 14 }

  game_maxes = {"red" => 0, "green" => 0, "blue" => 0}
  game_id, sets = game.match(/^Game (\d*): (.*)/).captures
  sets.split(";").each do |set|
    set_results = parse_set(set)
    set_results.map do |color, amount|
      game_maxes[color] = amount if set_results[color].to_i > game_maxes[color].to_i
    end
  end

  game_maxes.all?{ |color, amount| game_maxes[color] <= max_cubes[color]} ? game_id : false
end

def parse_set(set)
  pull_maxes = {"red"   => 0, "green" => 0, "blue"  => 0}

  pull = set.split(",").map(&:strip)
  color_pairs = pull.map{ |pair| pair.split(" ") } 
  color_pairs.each do |pair|
    pull_maxes[pair[1]] += pair[0].to_i
  end
  pull_maxes
end

valid_games
