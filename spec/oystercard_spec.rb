require './lib/oystercard'

describe OysterCard do
  it "has a defult balance of 0" do
    expect(subject.balance).to be(0)
    end
end