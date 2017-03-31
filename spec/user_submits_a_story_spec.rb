describe 'The Apprentice News submission page', type: :feature do
  before(:each) do
    database = double(:database)
    allow(database).to receive(:init)
    Capybara.app = ApprenticeNews.new(nil, database)
  end

  it 'should allow the user to submit a story' do
    pending 'Not implemented yet'
    visit '/submit'
    expect(page).to have_text('Submit a story')
  end

end
