require 'rails_helper'

RSpec.feature 'Perspective management' do
  feature 'creating a new perspective' do
    scenario 'I can find the new perspective link' do
      visit '/perspectives'
      
      click_link 'New Perspective'
      
      expect(page).to have_content('Create a new perspective')
    end
    
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
    fixtures :perspectives

    scenario 'I can get to a list of perspectives from the home page' do
      visit '/'
      
      click_link 'All Perspectives'
    end
    
    scenario 'I can see a list of all perspectives' do
      visit '/perspectives'
      
      expect(page).to have_content('Today')
      expect(page).to have_content('Plan')
    end
  end
end