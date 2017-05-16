class Transactions
  attr_reader :list

  def initialize
    @list = []
  end

  def create_transaction(date, money, balance)
    self.list.push({date: date, money: money, balance: balance})
  end

  def create_statement
    puts "Date: Transaction: Balance:"
    list.each do |item|
      puts "#{item[:date]} #{item[:money]}  #{item[:balance]}"
    end
  end

private
  attr_writer :list
end
