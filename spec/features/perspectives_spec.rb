require 'rails_helper'

RSpec.feature 'Perspective management' do
  feature 'creating a new perspective' do
    scenario 'User creates a new perspective' do
      visit '/perspectives/new'
    
      within '#new_perspective' do
        fill_in 'Title', with: 'Today'
        fill_in 'Description', with: 'My shiny today perspective'
      end
    
      click_button 'Create Perspective'
    
      expect(page).to have_content('New perspective successfully created')
    end
    
    scenario 'User leaves the title and description blank' do
      visit '/perspectives/new'
    
      within '#new_perspective' do
        fill_in 'Title', with: ''
        fill_in 'Description', with: ''
      end
    
      click_button 'Create Perspective'
    
      expect(page).to have_content('Title can\'t be blank')
      expect(page).to have_content('Description can\'t be blank')
    end
  end
  
  feature 'listing all perspectives' do
    scenario 'I can get to a list of perspectives from the home page' do
      visit '/'
      
      click_link 'All Perspectives'
    end
  end
end