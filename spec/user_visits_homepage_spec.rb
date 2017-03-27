describe 'The Apprentice News homepage', type: :feature do

  it 'should have a heading' do
    visit '/'
    expect(page).to have_text('Apprentice News')
  end

  it 'should have a list of submissions' do
    pending 'Not implemented yet'
    visit '/'
    expect(page).to have_link('GOV.UK')
  end

  it 'should sort submissions newest first' do
    pending 'Not implemented yet'
    visit '/'
    expect(page).to have_link('Apprentice News')
    expect(page).to have_link('GOV.UK')
  end

end
