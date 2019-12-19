class OysterCard
  attr_reader :balance, :scanned_at, :trip_history
  attr_reader :in_journey, :current_journey

  MIN_BALANCE = 1
  MAX_BALANCE = 90
  MIN_JOURNEY_COST = 1

  @current_journey = {}
  @scanned_at = nil
  @in_journey = false

  def initialize(balance = 0)
    @balance = balance
  end

  def top_up(balance)
    raise "Error, cannot top up if balance greater then #{MAX_BALANCE}" if (balance + @balance) > MAX_BALANCE
    @balance += balance
  end

  def touch_in(station)
    raise "You need to top up" if @balance < MIN_BALANCE
    @in_journey = true
    @current_journey = { :start => station}
    @scanned_at = station

  end

  def touch_out(station)
    deduct(MIN_JOURNEY_COST)
    @in_journey = false
    @current_journey.merge!(:end => station)
    @scanned_at = station


  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    @scanned_at ? true : false
  end

end
