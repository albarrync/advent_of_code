#!/usr/bin/env ruby

def calculate_powers
  input = File.open('input.txt').read
  games = input.split("\n")

  max_results = []
  games.each do |game|
    result = parse_game_maxes(game)
    max_results.push(result)
  end

  minimums = []
  max_results.map(&:values).each do |game_minimums|
    minimums.push(game_minimums.inject(:*))
  end

  puts minimums.sum
end

def parse_game_maxes(game)
  game_maxes = {"red" => 0, "green" => 0, "blue" => 0}
  game_id, sets = game.match(/^Game (\d*): (.*)/).captures
  sets.split(";").each do |set|
    set_results = parse_set(set)
    set_results.map do |color, amount|
      game_maxes[color] = amount if set_results[color].to_i > game_maxes[color].to_i
    end
  end

  game_maxes
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

calculate_powers
