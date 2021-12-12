class SchoolMedicationTransaction < ActiveRecord::Base
  belongs_to :student
  belongs_to :nurse
  belongs_to :school_medication

  after_create :decrease_medication_quantity

  private
    def decrease_medication_quantity
      medication = SchoolMedication.find_by(id: self.school_medication_id)
      medication.quantity -= self.change_in_quantity.to_i
      medication.save
    end

end
