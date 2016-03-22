require 'rails_helper'

RSpec.describe "routes for pages" do
  it "routes / to the home page" do
    expect(get("/")).to route_to("pages#home")
  end
end
