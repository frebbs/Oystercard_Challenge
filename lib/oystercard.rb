class OysterCard
  attr_reader :balance

  MIN_BALANCE = 1
  MAX_BALANCE = 90
  MIN_JOURNEY_COST = 1
  @in_journey =  nil

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

  def touch_in
    raise "You need to top up" if @balance < MIN_BALANCE
    @in_journey = true
  end

  def touch_out
    deduct(MIN_JOURNEY_COST)
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end
end