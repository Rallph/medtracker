Given /the following Nurses have been added to MedMonitor:/ do |nurses_table|
  nurses_table.hashes.each do |nurse|

    Nurse.create(nurse)
  end
end

Given /the following Administrators have been added to MedMonitor:/ do |adminstrators_table|

  adminstrators_table.hashes.each do |admin|

    Administrator.create(admin)
  end
end

Given /^I am on the MedMonitor home page$/ do
  visit root_path
end

When /^I attempt to login with username: "(.*?)" and password: "(.*?)"$/ do |username, password|

  fill_in 'username_field', :with => username
  fill_in 'password_field', :with => password
  click_button 'login'

end

Then /^I should see: "(.*?)"$/ do |alert|

  page.should have_content(alert)

end


