require 'rails_helper'

RSpec.describe "routes for Urls" do
  it "routes shortened url to urls controller search action" do
    expect(get("/a")).to route_to("urls#search", path: "a")
  end

  it "routes another shortened url to urls controller search action" do
    expect(get("/ay)1z")).to route_to("urls#search", path: "ay)1z")
  end
end
