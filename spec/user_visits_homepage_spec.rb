describe 'The Apprentice News homepage', type: :feature do

  it 'should have a heading' do
    visit '/'
    expect(page).to have_text('Apprentice News')
  end

  it 'should have a list of submissions' do
    visit '/'
    expect(page).to have_link('The most awesome link aggregation site ever')
  end

end
