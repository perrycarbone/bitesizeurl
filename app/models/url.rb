class Url < ActiveRecord::Base

  validates :full_url, presence: true

  def update_times_visited!
    self.times_visited += 1
    self.save
  end

  def path_can_be_generated?
    valid_url?(self.full_url) && self.save
  end

  def generate_shortened_url!
    self.path = PathGenerator.new(self.id).generate_path
    self.save
  end

  private

  def valid_url?(url)
    uri = URI.parse(url)
    uri.kind_of?(URI::HTTP)
  rescue URI::InvalidURIError
    false
  end
end
