Given /the following "(.*?)" have been added to MedMonitor:/ do |user_type, users_table|

  users_table.hashes.each do |user|

    if (user_type == "Administrators")
      Administrator.create(user)
    elsif (user_type == "Nurses")
      Nurse.create(user)
    else
      Parent.create(user)
    end
  end
end

Given /^I am on the MedMonitor home page$/ do
  visit root_path
end

When /^I attempt to login as a "(.*?)" with email: "(.*?)" and password: "(.*?)"$/ do |user_type, username, password|
  
  visit "/#{user_type}s/sign_in"
  fill_in  "#{user_type}_email", :with => username
  fill_in  "#{user_type}_password", :with => password
  click_button 'Log in'

end

Then /^I should see: "(.*?)"$/ do |alert|

  page.should have_content(alert)

end


