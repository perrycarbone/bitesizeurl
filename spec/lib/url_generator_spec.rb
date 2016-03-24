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

    expect(short_url).to eq("aa")
  end

  it "returns a two character string for id 4_830" do
    short_url = UrlGenerator.new(4_830).generate_short_url

    expect(short_url).to eq("__")
  end

  it "returns a three character string for id 4_831" do
    short_url = UrlGenerator.new(4_831).generate_short_url

    expect(short_url).to eq("aaa")
  end

  it "returns a three character string for id 333_339" do
    short_url = UrlGenerator.new(333_339).generate_short_url

    expect(short_url).to eq("___")
  end

  it "does not generate duplicate strings" do
    row_id = 1
    result = []
    1000000.times do
      result << UrlGenerator.new(row_id).generate_short_url
      row_id += 1
    end

    expect(result.uniq.count).to eq(1000000)
  end
end
