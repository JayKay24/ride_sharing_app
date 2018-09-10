Given('I visit the homepage') do
  visit root_path
end

When('I click the Sign Up Button') do
  click_link 'Sign Up'
end

When('I fill in the Sign up form') do
  fill_in 'First Name', with: 'James'
  fill_in 'Last Name', with: 'Kinyua'
  fill_in 'Username', with: 'JayKay'
  fill_in 'Email', with: 'james@example.com'
  fill_in 'Password', with: 'Qwertyuiop123#'
  fill_in 'Password Confirmation', with: 'Qwertyuiop123#'

  click_button 'sign up'
end

Then('I should see that I am in the vehicle registration page.') do
  message = 'You successfully signed up!'

  expect(page).to have_content(message)
end
