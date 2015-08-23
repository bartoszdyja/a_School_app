require 'spec_helper'

feature 'User checks student details' do
  let!(:student) { create :student, first_name: 'Jan', last_name: 'Nowak' }

  background do
    sign_in
    expect(page).to have_content 'Logout'
    visit students_path
    find(:xpath, "//a[@title='show']").click
  end

  scenario do
    within('.breadcrumbs') do
      expect(page).to have_content 'RoR Workhops » Students » Jan Nowak'
    end
  end

  scenario 'show payment details only when sign in' do
    logout
    visit report_payments_path
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end
