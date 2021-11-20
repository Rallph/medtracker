require 'rails_helper'

RSpec.describe NurseController, type: :controller do

  before {
    nurse = double('nurse', school_id: 1)
    login_with(nurse, :nurse)
  }

  describe "GET #homepage" do
    it "returns http success" do
      get :homepage
      expect(response).to have_http_status(:success)
    end
  end

  describe "Render Administer Medication Page" do
    it 'should query the student model' do
      fake_students = [double('student1', full_name: 'student1', id: 1), double('student2', full_name: 'student2', id: 2)]
      expect(Student).to receive(:where).and_return(fake_students)
      get :administer
    end

    it 'should query the school medication model' do
      fake_medication = [double('med1', medication_name: 'med1', id: 1), double('med2', medication_name: 'med2', id: 2)]
      expect(SchoolMedication).to receive(:where).and_return(fake_medication)
      get :administer
    end

    it 'should render the administer medication template' do

      fake_students = [double('student1', full_name: 'student1', id: 1), double('student2', full_name: 'student2', id: 2)]
      fake_medication = [double('med1', medication_name: 'med1', id: 1), double('med2', medication_name: 'med2', id: 2)]

      allow(Student).to receive(:where).and_return(fake_students)
      allow(SchoolMedication).to receive(:where).and_return(fake_medication)
      get :administer

      expect(response).to render_template("administer")
    end
  end

  describe 'Submit Administer Medication Form' do
    it 'should redirect to the administer form with a flash notice' do
      post :administer_submit, { selected_student: "1", selected_medication: "1", dosage: "1", time: "2021-11-16T18:06"}
      expect(flash[:info]).to be_truthy
      expect(response).to redirect_to :administer
    end

    it 'should call the school medication transaction model to create a new transaction' do
      post :administer_submit, { selected_student: "1", selected_medication: "1", dosage: "1", time: "2021-11-16T18:06"}
      expect(SchoolMedicationTransaction).to receive(:create!)
    end
  end

end
