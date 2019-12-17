class OysterCard
  attr_reader :balance, :entry_station

  MIN_BALANCE = 1
  MAX_BALANCE = 90
  MIN_JOURNEY_COST = 1
  @entry_station = nil

  def initialize(balance = 0)
    @balance = balance
  end

  def top_up(balance)
    raise "Error, cannot top up if balance greater then #{MAX_BALANCE}" if (balance + @balance) > MAX_BALANCE
    @balance += balance
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in(station)
    raise "You need to top up" if @balance < MIN_BALANCE
    @entry_station = station
  end

  def touch_out
    deduct(MIN_JOURNEY_COST)
    @entry_station = nil
  end

  def in_journey?
    @entry_station == nil ? false : true
  end
end