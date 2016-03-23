require 'rails_helper'
require 'url_generator'

describe UrlGenerator do
  it "returns a one character string for id 1" do
    short_url = UrlGenerator.new(1).generate_short_url

    expect(short_url).to eq("a")
  end

  it "returns a one character string for id 69" do
    short_url = UrlGenerator.new(69).generate_short_url

    expect(short_url).to eq("_")
  end

  it "returns a two character string for id 70" do
    short_url = UrlGenerator.new(70).generate_short_url

    expect(short_url).to eq("bc")
  end

  it "returns a two character string for id 4_692" do
    short_url = UrlGenerator.new(4_692).generate_short_url

    expect(short_url).to eq("_.")
  end

  it "returns a three character string for id 4_693" do
    short_url = UrlGenerator.new(4_693).generate_short_url

    expect(short_url).to eq("bde")
  end

  it "returns a three character string for id 314_364" do
    short_url = UrlGenerator.new(314_364).generate_short_url

    expect(short_url).to eq("_.-")
  end
end
