require './lib/kikori_no_musubime'
require 'pp'

# initialize
number_of_trials = ARGV[0].nil? ? 2 : ARGV[0].to_i
goal_position = ARGV[1].nil? ? 27 : ARGV[1].to_i
victory_count = 0
expectation_raw_value = 0

kikori_no_musubime = KikoriNoMusubime.new
dice_permutations = kikori_no_musubime.dice_permutations(number_of_trials: number_of_trials)

dice_permutations.each do |permutation_array|
  trial_client = KikoriNoMusubime.new(goal_position: goal_position)

  permutation_array.each do |each_value|
    trial_client.go_forward(dice_number: each_value)
  end
  expectation_raw_value += trial_client.current_position

  game_result = ''
  if trial_client.current_position >= trial_client.goal_position
    game_result = 'Victory!'
    victory_count += 1
  else
    game_result = 'Defeat!'
  end

  puts '---------------------------------------'
  puts "permutation_array: #{permutation_array}"
  puts "current_position: #{trial_client.current_position}"
  puts "game_result: #{game_result}"
end

puts "\nLAST RESULTS:"
puts "victory_count: #{victory_count}"
puts "victory_probabilyty: #{victory_count / (6**number_of_trials).to_f}"
puts "expectation_raw_value: #{expectation_raw_value}"
puts "expectation_value: #{expectation_raw_value / (6**number_of_trials).to_f}"
