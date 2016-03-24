class PathGenerator

  CHARSET = ('a'..'z').to_a + ('A'..'Z').to_a +
            %w[0 1 2 3 4 5 6 7 8 9 ' ( ) * - . _]

  attr_reader :row_id

  def initialize(row_id)
    @row_id = row_id
  end

  def generate_path
    result = []
    value = row_id
    numeric_base = CHARSET.count

    while value > 0
      remainder = value % numeric_base
      if remainder == 0
        remainder = CHARSET.count
        value = value / numeric_base - 1
      else
        value /= numeric_base
      end

      result.unshift(CHARSET[remainder - 1])
    end

    result.join
  end
end
