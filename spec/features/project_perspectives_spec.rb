require 'rails_helper'

RSpec.feature 'Managing project-based perspectives' do
  scenario 'User can select a project-based perspective' do
    visit '/perspectives/new'

    within '#new_perspective' do
      fill_in 'Title', with: 'Today'
      fill_in 'Description', with: 'My shiny today perspective'
      choose 'Use the project hierarchy'
    end

    click_button 'Create Perspective'

    expect(page).to have_content('New perspective successfully created')
  end
end
