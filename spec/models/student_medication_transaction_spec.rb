require 'rails_helper'

RSpec.describe StudentMedicationTransaction, type: :model do
  describe "decrease medication quantity" do

    it 'should call the method to find the student medication' do
      fake_medication = double('medication', :quantity => 10, :quantity= => 9, :save => nil)
      expect(StudentMedication).to receive(:find_by).and_return(fake_medication)
      StudentMedicationTransaction.new(student_medication_id: 1, change_in_quantity: 1).decrease_medication_quantity
    end

    it 'should call the quantity setter on the returned medication' do
      fake_medication = double('medication', :quantity => 10, :save => nil)
      allow(StudentMedication).to receive(:find_by).and_return(fake_medication)
      expect(fake_medication).to receive(:quantity=).and_return(9)
      StudentMedicationTransaction.new(student_medication_id: 1, change_in_quantity: 1).decrease_medication_quantity
    end

    it 'should save the medication after decreasing the quantity' do
      fake_medication = double('medication', :quantity => 10, :quantity= => 9)
      allow(StudentMedication).to receive(:find_by).and_return(fake_medication)
      expect(fake_medication).to receive(:save).and_return(nil)
      StudentMedicationTransaction.new(student_medication_id: 1, change_in_quantity: 1).decrease_medication_quantity
    end
  end
end
