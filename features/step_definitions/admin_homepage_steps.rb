Then /I should see access alerts for user\(s\):"(.*?)" with email\(s\) "(.*?)"/ do |user_names, user_emails|

  users = user_names.split(',')
  emails = user_emails.split(',')

  users_mapped_to_emails = users.zip(emails)

  users_mapped_to_emails.each do |user|

    element = find('p', text: user[0])
    element.should have_content(user[1])

  end
end


When /I open the manage access page/ do

  click_link 'Manage Access'

end
