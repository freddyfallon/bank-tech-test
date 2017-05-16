describe Account do
  subject(:account) { described_class.new }
  let(:transaction) { double :transaction }
  describe '#balance' do
    it 'should be 0 initially' do
      expect(account.balance).to eq 0
    end
  end

  describe '#deposit' do
    it 'should add money to account' do
      expect{account.deposit(10)}.to change{account.balance}.from(0).to(10)
    end
  end

  describe '#withdraw' do
    before do
      account.deposit(10)
    end

    it 'should withdraw money from account' do
      expect{account.withdraw(10)}.to change{account.balance}.from(10).to(0)
    end

    it 'should raise error if withdrawal will take balance below 0' do
      expect{account.withdraw(11)}.to raise_error("Insufficient funds")
    end
  end

  describe '#create_transaction' do
    before do
      allow(account.transactions).to receive(:list).and_return([])
    end

    it "should push date, money and balance into transactions" do
      account.create_transaction("12/10/2015", 10, 10)
      expect(account.transactions.list).to eq([{:date=>"12/10/2015", :money=>10, :balance=>10}])
    end
  end

  describe '#show_balance' do
    before do
      account.create_transaction("12/10/2015", 10, 10)
      account.create_transaction("12/10/2015", -5, 5)
    end
    it 'should list all transactions' do
      expect(account.show_balance).to eq([{:date=>"12/10/2015", :money=>10, :balance=>10}, {:date=>"12/10/2015", :money=>-5, :balance=>5}])
    end
  end
end
