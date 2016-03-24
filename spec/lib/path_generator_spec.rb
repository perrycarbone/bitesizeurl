require 'path_generator'

describe PathGenerator do
  it "returns a one character string for id 1" do
    path = PathGenerator.new(1).generate_path

    expect(path).to eq("a")
  end

  it "returns a one character string for id 69" do
    path = PathGenerator.new(69).generate_path

    expect(path).to eq("_")
  end

  it "returns a two character string for id 70" do
    path = PathGenerator.new(70).generate_path

    expect(path).to eq("aa")
  end

  it "returns a two character string for id 4_830" do
    path = PathGenerator.new(4_830).generate_path

    expect(path).to eq("__")
  end

  it "returns a three character string for id 4_831" do
    path = PathGenerator.new(4_831).generate_path

    expect(path).to eq("aaa")
  end

  it "returns a three character string for id 333_339" do
    path = PathGenerator.new(333_339).generate_path

    expect(path).to eq("___")
  end

  it "does not generate duplicate strings" do
    row_id = 1
    result = []
    1000000.times do
      result << PathGenerator.new(row_id).generate_path
      row_id += 1
    end

    expect(result.uniq.count).to eq(1000000)
  end
end
