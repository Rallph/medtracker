class StudentMedicationTransaction < ActiveRecord::Base
  belongs_to :nurse
  belongs_to :student_medication

  def decrease_medication_quantity
    medication = StudentMedication.find_by(id: self.student_medication_id)
    medication.quantity -= self.change_in_quantity.to_i
    medication.save
  end
end
