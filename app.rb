require './lib/kikori_no_musubime'
require 'pp'

obj = KikoriNoMusubime.new
# pp obj.dice_permutation(number_of_trials: 3)
puts obj.go_forward(dice_number: 3)
puts obj.go_forward(dice_number: 4)
puts obj.go_forward(dice_number: 1)
puts obj.go_forward(dice_number: 5)
puts obj.go_forward(dice_number: 6)
