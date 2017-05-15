describe Account do
  subject(:account) { described_class.new }
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
  end
end
