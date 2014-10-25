require 'rails_helper'

RSpec.feature 'Perspective management' do
  scenario 'User creates a new perspective' do
    visit '/perspectives/new'
    
    within '#new_perspective' do
      fill_in 'Title', with: 'Today'
      fill_in 'Description', with: 'My shiny today perspective'
    end
    
    click_button 'Create Perspective'
    
    expect(page).to have_content('New perspective successfully created')
  end
end