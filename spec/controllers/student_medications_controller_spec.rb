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


  end

end
