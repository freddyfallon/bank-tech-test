class Account

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def deposit(money)
    self.balance += money
  end

  def withdraw(money)
    self.balance -= money
  end

  private
  attr_writer :balance

end
