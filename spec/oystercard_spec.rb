require './lib/oystercard'

describe OysterCard do

  it "creates an instance of OysterCard" do
    expect(subject).to be_a OysterCard
  end

  it "has a defult balance of 0" do
    expect(subject.balance).to be(0)
  end

  describe "#top_up" do
    context 'Allows the user to top_up card' do
      it "allows the uset to top up money" do
        expect(subject).to respond_to(:top_up)
      end

      it "adds a balance to the card" do
        subject.top_up(10)
        expect(subject.balance).to eq(10)
      end
    end
  end
end