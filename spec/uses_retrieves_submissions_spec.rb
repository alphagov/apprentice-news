require './app/database.rb'

describe Database do
  let!(:database){Database.new}
  it 'should retrieve submissions data' do
    database.init
    subs = database.retrieval
    expect(subs).to eql("blah")
  end


end
