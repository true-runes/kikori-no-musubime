require './lib/kikori_no_musubime'
require 'pp'

obj = KikoriNoMusubime.new
pp obj.dice_permutation(number_of_trials: 3)
