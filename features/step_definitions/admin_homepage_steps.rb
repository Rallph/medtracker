Then /I should see access alerts for nurse\(s\):"(.*?)" with email\(s\) "(.*?)"/ do |nurse_names, nurse_emails|

  medicines = nurse_names.split(',')
  quantities = nurse_emails.split(',')

  medicines_mapped_to_quantities = medicines.zip(quantities)

  medicines_mapped_to_quantities.each do |medicine|

    element = find('p', text: medicine[0])
    element.should have_content(medicine[1])

  end
end


When /I open the manage access page/ do

  click_link 'Manage Access'

end
