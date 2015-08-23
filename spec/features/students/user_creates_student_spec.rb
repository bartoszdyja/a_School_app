require 'spec_helper'

feature 'User creates student' do
  background do
    sign_in
    expect(page).to have_content 'Logout'
    visit students_path
    click_on 'Add new one'
  end

  scenario 'with valid input' do
    fill_in 'First name', with: 'Adrian'
    fill_in 'Last name', with: 'Nowacki'
    click_button 'Create Student'
    expect(page).to have_content 'Student has been created!'
  end

  scenario 'with missing first name' do
    fill_in 'Last name', with: 'Nowacki'
    click_button 'Create Student'
    expect(page).to have_content "can't be blank"
  end

  scenario 'with missing Last name' do
    fill_in 'First name', with: 'Adrian'
    click_button 'Create Student'
    expect(page).to have_content "can't be blank"
  end

  scenario 'with incomplete birthdate' do
    fill_in 'First name', with: 'Adrian'
    fill_in 'Last name', with: 'Nowacki'
    select '2010', from: 'student_birthdate_1i'
    select '1', from: 'student_birthdate_3i'
    click_button 'Create Student'
    expect(page).to have_content 'Student has been created!'
    expect(page).to_not have_content "birthdate"
  end

  scenario 'with complete birthdate' do
    fill_in 'First name', with: 'Adrian'
    fill_in 'Last name', with: 'Nowacki'
    select '2010', from: 'student_birthdate_1i'
    select 'January', from: 'student_birthdate_2i'
    select '1', from: 'student_birthdate_3i'
    click_button 'Create Student'
    expect(page).to have_content "birthdate"
    expect(page).to have_content "2010-01_01"
  end

end
