When /I approve a new "(.*?)" with name "(.*?)" and email "(.*?)"/ do | job_type, name, email |

  if (job_type == "nurse")
    @nurse = Nurse.where('email = :nurse_email', {nurse_email: email})
    @nurse.first.update(account_approved: true)
  else
    @admin = Administrator.where('email = :admin_email', {admin_email: email})
    @admin.first.update(account_approved: true)
  end
  visit :approve_accounts


end

Then /I should see a "(.*?)" with email "(.*?)" who needs approval/ do |job_type, email|

  tr = find('tr', id: job_type + "-" + email)

  tr.should have_content('Approve Access')

end

Then /"(.*?)" with email "(.*?)" should be approved/ do |job_type, email|

  tr = find('tr', id: job_type + "-" + email)

  tr.should have_no_content('Approve Access')
  tr.should have_content('Approved')

end