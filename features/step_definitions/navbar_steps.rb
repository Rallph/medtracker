Then /I should not see login information or logout option/ do

  result = 0
  begin
    user_info = find("#user_info")
  rescue
    result += 1
  end

  begin
    logout = find("#logout")
  rescue
    result += 1
  end
  if result.eql? 2
    result = true
  else
    result = false
  end
  expect(result).to be_truthy

end

Then /^I should see '(.*?) logged in as "(.*?)"' and logout option$/ do |type, email|
  result = true
  user_info = find("#user_info")
  user_string = type+" signed in as: "+email
  if not user_info.text.eql? user_string
    result = false
  end
  logout = find("#logout")
  if not logout.text.eql? 'Log Out'
    result = false
  end
  puts user_info.text
  puts logout.text
  expect(result).to be_truthy
end

When /I press the logout button/ do
  find("#logout").click
end

Then /I should be redirected to the MedMonitor home page/ do
  expect(page).to have_current_path('/')
end