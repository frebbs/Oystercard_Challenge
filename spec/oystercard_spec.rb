require './lib/oystercard'

describe OysterCard do
  it "creates an instance of OysterCard" do
    expect(subject).to be_a OysterCard
  end

  it "has a default balance of 0" do
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

      it "returns an error balance > 90" do
        subject.top_up(90)
        expect {subject.top_up(1)}.to raise_error "Error, cannot top up if balance greater then #{OysterCard::MAX_BALANCE}"
      end

      it "has a default MAX balance" do
        subject.top_up(90)
        expect(subject.balance).to eq(90)
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
    context "it records the users start of the journey" do
      it "It allows the user to start their journey" do
        expect(subject).to respond_to(:touch_in)
      end

      it "requests the user topup if balance <= £1" do
        subject.top_up(0.5)
        expect {subject.touch_in("Bond")}.to raise_error "You need to top up"
      end

      it "records the users start station" do
        subject.top_up(10)
        expect {subject.touch_in("Bond")}.to change{subject.entry_station}.to("Bond")
      end
    end
  end

  describe "#touch_out" do
    context "records the users end journey" do
      it "ends the journey" do
        expect(subject).to respond_to(:touch_out)
      end
      it "charges the customer the minimum set amount" do
        subject.top_up(20)
        subject.touch_in("Bond")
        expect {subject.touch_out}.to change{subject.balance}.by(-OysterCard::MIN_JOURNEY_COST)
      end
      it "changes the station to nil" do
        subject.top_up(10)
        subject.touch_in("Bond")
        expect {subject.touch_out}.to change{subject.entry_station}.from("Bond").to(nil)
      end
    end
  end

  describe "#in_journey?" do
    context "records the current state of travel" do
      it "returns true if traveling" do
        subject.top_up(10)
        subject.touch_in("Bond")
        expect(subject.in_journey?).to be true
      end

      it "returns false if not traveling" do
        subject.touch_out
        expect(subject.in_journey?).to be false
      end
    end
  end
end