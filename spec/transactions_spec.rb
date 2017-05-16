describe Transactions do
  subject(:transactions) { described_class.new }
  describe '#list' do
    it 'Should be empty initially' do
      expect(transactions.list).to be_empty
    end
  end

  describe '#create_transaction' do
    it 'should push date, money, and balance into list' do
      transactions.create_transaction("12/10/2015", 10, 10)
      expect(transactions.list).to eq [{:date=>"12/10/2015", :money=>10, :balance=>10}]
    end
  end

end
