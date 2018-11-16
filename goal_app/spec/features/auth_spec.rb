require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  background :each do 
    visit new_user_url
  end
  
  scenario 'has a new user page' do
    expect(page).to have_content('Sign Up')
  end
  
  scenario 'takes a username and password' do
    expect(page).to have_content('Username')
    expect(page).to have_content('Password')
  end
  

  feature 'signing up a user' do
    scenario 'shows username on the homepage after signung up' do
      fill_in 'Username', with: 'mavers'
      fill_in 'Password', with: 'doggies'
      click_button 'Sign Up'
      expect(page).to have_content('mavers')
    end
  end
end

feature 'logging in' do
  background :each do 
    visit new_session_url
  end
  
  scenario 'has a log in button' do 
    expect(page).to have_content('Log In')
  end
  
  scenario 'shows username on the homepage after logging in' do
    User.create(username: 'mavers', password: 'doggies')
    fill_in 'Username', with: 'mavers'
    fill_in 'Password', with: 'doggies'
    click_button 'Log In'
    expect(page).to have_content('mavers')
  end

end

feature 'logging out' do
  background :each do 
    User.create(username: 'mavers', password: 'doggies')
    visit new_session_url
    fill_in 'Username', with: 'mavers'
    fill_in 'Password', with: 'doggies'
    click_button 'Log In'
  end
  
  scenario 'page has a log out button when logged in' do
    expect(page).to have_content('Log Out')
  end

  scenario 'doesn\'t show username on the homepage after logout' do
    click_button 'Log Out'
    expect(page).not_to have_content('mavers')
  end

end