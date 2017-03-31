describe 'The Apprentice News homepage', type: :feature do
  before(:each) do

    mock_data = [{'url'=>'https://www.gov.uk', 'title' => 'GOV.UK'}]

    database = double :database
    allow(database).to receive :init
    allow(database).to receive(:get_submissions).and_return mock_data

    Capybara.app = ApprenticeNews.new(nil, database)

  end

  it 'should have a heading' do
    visit '/'
    expect(page).to have_text('Apprentice News')
  end

  it 'should have a list of submissions' do
    visit '/'
    expect(page).to have_link('GOV.UK')
  end

end
