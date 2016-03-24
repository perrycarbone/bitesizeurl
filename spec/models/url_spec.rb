require 'rails_helper'

describe Url do
  it { should validate_presence_of(:full_url) }
end
