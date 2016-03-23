class UrlGenerator

  CHARSET = ('a'..'z').to_a + ('A'..'Z').to_a +
            %w[0 1 2 3 4 5 6 7 8 9 ' ( ) * - . _]

  attr_reader :row_id

  def initialize(row_id)
    @row_id = row_id
  end

  def generate_short_url
    candidate = []
    char_length = 1
    loop do
      candidate = CHARSET.permutation(char_length).to_a[row_id - 1]
      break unless candidate == nil
      char_length += 1
    end
    candidate.join
  end
end
