require 'rails_helper'

RSpec.describe SchoolMedicationTransaction, type: :model do
  describe "decrease medication quantity" do

    it 'should call the method to find the school medication' do
      fake_medication = double('medication', :quantity => 10, :quantity= => 9, :save => nil)
      expect(SchoolMedication).to receive(:find_by).and_return(fake_medication)
      SchoolMedicationTransaction.create(school_medication_id: 1, change_in_quantity: 1)
    end

  end
end
