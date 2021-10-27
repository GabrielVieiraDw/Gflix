require 'rails_helper'

RSpec.describe "welcome", type: :view do
  scenario 'Show Welcome message' do
    visit('welcome#index')
    expect(page).to have_content('Welcome')
  end
end