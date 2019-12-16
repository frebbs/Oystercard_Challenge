class OysterCard
  attr_reader :balance, :max_balance

  MAX_BALANCE = 90

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
end