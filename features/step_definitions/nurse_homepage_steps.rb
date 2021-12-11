Given /the following medications have been added to the school inventory:/ do |users_table|

  users_table.hashes.each do |medication|
    SchoolMedication.create(medication)
  end
end

Then /I should see buttons for: "(.*?)"/ do |button_names|

  buttons = button_names.split(',')

  buttons.each do |button|

    expect(page.has_link?(button)).to be_truthy

  end

end

Then /I should see medicine alerts for "(.*?)" with quantities "(.*?)"/ do |mdicines_in_low_supply, medicine_quantities|

  medicines = mdicines_in_low_supply.split(',')
  quantities = medicine_quantities.split(',')

  medicines_mapped_to_quantities = medicines.zip(quantities)

  medicines_mapped_to_quantities.each do |medicine|

    element = find('p', text: medicine[0])
    element.should have_content(medicine[1])

  end

end


Given /the following students have been added to MedMonitor with parent id 1:/ do |users_table|

  users_table.hashes.each do |user|
      student = Student.create(user)
      student.parents << Parent.find(1)
  end
end
