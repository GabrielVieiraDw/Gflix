require 'rails_helper'

feature "welcome", type: :feature do
  scenario 'Show Welcome message' do
    visit('/')
    expect(page).to have_content('Welcome')
  end
end