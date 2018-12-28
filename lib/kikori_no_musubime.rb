class KikoriNoMusubime
  attr_accessor :dice_number, :current_position, :current_turn, :goal_position

  DICE_VALUE_LANGE = (1..6).freeze
  INIT_PERMUTATION = [[1], [2], [3], [4], [5], [6]].freeze
  GOAL_POSITION    = 27

  def initialize(goal_position: GOAL_POSITION)
    @dice_number      = 0
    @current_position = 0
    @current_turn     = 0
    @goal_position    = goal_position
  end

  def throw_dice
    dice_probability
  end

  def dice_probability
    rand(1..6)
  end

  def forward_steps(dice_number:)
    return nil if dice_number == 1 # TODO: 臭う

    dice_number
  end

  def go_forward(dice_number:)
    if dice_number == 1
      @current_position = 0
    else
      @current_position += forward_steps(dice_number: dice_number)
    end
  end

  # 以降は純粋な計算部分なのでクラスの趣旨からはズレる
  def dice_permutations_array(base_array)
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

  def dice_permutations(number_of_trials:)
    permutation = INIT_PERMUTATION

    (number_of_trials - 1).times do
      permutation = dice_permutations_array(permutation)
    end

    permutation
  end
end
