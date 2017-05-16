require_relative 'transactions'
class Account

  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = Transactions.new
  end


  def deposit(money)
    self.balance += money
    create_transaction(Time.now.strftime("%d/%m/%Y"), money, balance)
  end

  def withdraw(money)
    raise "Insufficient funds" if balance - money < 0
    self.balance -= money
    create_transaction(Time.now.strftime("%d/%m/%Y"), -money, balance)
  end


  def show_balance
    transactions.list.each do |transaction|
      transaction
    end
  end

  def create_transaction(date, money, balance)
    self.transactions.create_transaction(date, money, balance)
  end # make private

  private
  attr_writer :balance, :transactions

end
