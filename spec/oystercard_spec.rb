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

      it "has a default MAX balance" do
        subject.top_up(90)
        expect(subject.balance).to eq(90)
      end

      it "returns an error balance > 90" do
        subject.top_up(90)
        expect {subject.top_up(1)}.to raise_error "Error, cannot top up if balance greater then #{OysterCard::MAX_BALANCE}"
      end
    end
  end

  describe "#deduct" do
    context "It deducts money from the oyster account" do
      it "Reduces the balance by 10" do
        subject.top_up(20)
        expect(subject.deduct(20)).to eq(0)
      end
    end
  end

  describe "#touch_in" do
    context "it records the users start of the journy" do
      it "It allows the user to start their journy" do
        expect(subject).to respond_to(:touch_in)
      end
    end
  end
end