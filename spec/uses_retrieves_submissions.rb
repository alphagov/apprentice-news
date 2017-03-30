require './app/database.rb'

describe Database do
  let!(:database)(Database.new)
  it 'should retrieve submissions data' do
    database.retrieval
    expect(database.store).to eql("blah")
  end


end
