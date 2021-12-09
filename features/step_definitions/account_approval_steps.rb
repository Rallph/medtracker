When /I approve a new "(.*?)" with name "(.*?)" and email "(.*?)"/ do | job_type, name, email |

  @nurse = Nurse.where('email = :nurse_email', {nurse_email: email})
  @nurse.first.update(account_approved: true)
  visit :approve_accounts


end

Then /I should see a user with email "(.*?)" who needs approval/ do |email|

  tr = find('tr', id: email)

  tr.should have_content('Approve Access')

end

Then /"(.*?)" with email "(.*?)" should be approved/ do |job_type, email|

  tr = find('tr', id: email)

  tr.should have_no_content('Approve Access')
  tr.should have_content('Approved')

end