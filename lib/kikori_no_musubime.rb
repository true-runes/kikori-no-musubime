class KikoriNoMusubime
  attr_accessor :dice_number, :current_position, :current_turn

  DICE_VALUE_LANGE = (1..6).freeze
  INIT_PERMUTATION = [[1], [2], [3], [4], [5], [6]].freeze

  def initialize
    @dice_number      = 0
    @current_position = 0
    @current_turn     = 0
  end

  def throw_dice
    dice_probability
  end

  def dice_probability
    rand(1..6)
  end

  # 以降は純粋な計算部分なのでクラスの趣旨からはズレる
  def dicer_permutation_array(base_array)
    result_array = []

    base_array.each do |array|
      new_array = []

      DICE_VALUE_LANGE.each do |i|
        new_array = array + [i]
        result_array << new_array
      end
    end

    result_array
  end

  def dice_permutation(number_of_trials:)
    permutation = INIT_PERMUTATION

    (number_of_trials - 1).times do
      permutation = dicer_permutation_array(permutation)
    end

    permutation
  end
end
