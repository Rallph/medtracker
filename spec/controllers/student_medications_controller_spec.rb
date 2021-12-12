require 'rails_helper'

RSpec.describe StudentMedicationsController, type: :controller do

  before {
    nurse = double('nurse', school_id: 1, id: 1)
    login_with(nurse, :nurse)
  }

  describe "get medications of a student" do

    it 'returns http success' do
      allow(StudentMedication).to receive(:where).and_return([])

      get :get_medications_for_student, { :student_id => "1" }
      expect(response).to have_http_status(:success)
    end

    it 'assigns the medications_for_student instance variable' do
      allow(StudentMedication).to receive(:where).and_return([])
      expect(assigns(@medications_for_student))
      get :get_medications_for_student, { :student_id => "1" }
    end

    it 'returns the specified students medications in json format' do
      med_results= [{ id: 1, medication_name: "med", quantity: 10, unit: "unit", school_id: 1, student_id: 1 }]
      allow(StudentMedication).to receive(:where).and_return(med_results)

      get :get_medications_for_student, { :student_id => "1" }
      expect(JSON.parse(response.body)).to eq(med_results.map(&:stringify_keys))
    end


  end

end
