class OysterCard
  attr_reader :balance, :max_balance

  MAX_BALANCE = 90

  def initialize(balance = 0)
    @balance = balance
  end

  def top_up(balance)
    raise "Error, cannot top up if balance greater then 90" if (balance + @balance) > MAX_BALANCE
    @balance += balance
  end
end