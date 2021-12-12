Given /the following "(.*?)" have been added to MedMonitor:/ do |user_type, users_table|

  users_table.hashes.each do |user|

    if (user_type == "Administrators")
      Administrator.create(user)
    elsif (user_type == "Nurses")
      Nurse.create(user)
    elsif (user_type == "Parents")
      Parent.create(user)
    else
      Student.create(user)
    end
  end
end

Given /^I am on the MedMonitor home page$/ do
  visit root_path
end

When /^I log in as a "(.*?)" with email: "(.*?)" and password: "(.*?)"$/ do |user_type, username, password|
  
  visit "/#{user_type}s/sign_in"
  fill_in  "#{user_type}_email", :with => username
  fill_in  "#{user_type}_password", :with => password
  click_button 'Log in'

end

When /^I attempt to visit the "(.*?)" sign in page$/ do |user_type|

  visit "/#{user_type}s/sign_in"

end

Then /^I should see the "(.*?)" homepage$/ do  |homepage|

  if homepage == "administrator"
    buttons = ["Manage Access","View Reports/Logs"]
  else
    buttons = ["Administer Medicine","Reports/Logs"]
  end

  buttons.each do |button|

    expect(page.has_link?(button)).to be_truthy

  end
end

Then /^I should see: "(.*?)"$/ do |alert|

  page.should have_content(alert)

end


