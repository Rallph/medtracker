When /^I attempt to sign up as a "(.*?)" with email: "(.*?)", full_name: "(.*?)", school_id: "(.*?)", and password: "(.*?)"$/ do
      |user_type, email, full_name, school_id, password|

  visit "/#{user_type}s/sign_up"
  fill_in  "#{user_type}_email", :with => email
  fill_in  "#{user_type}_full_name", :with => full_name
  fill_in  "#{user_type}_school_id", :with => school_id
  fill_in  "#{user_type}_password", :with => password
  fill_in  "#{user_type}_password_confirmation", :with => password
  click_button 'Sign up'

end