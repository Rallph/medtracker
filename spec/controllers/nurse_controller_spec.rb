require 'rails_helper'

RSpec.describe NurseController, type: :controller do

  before {
    nurse = double('nurse', school_id: 1, id: 1, account_approved: true)
    login_with(nurse, :nurse)
  }

  describe "Render Nurse Inventory" do
    before(:each) do
      nurse = double('nurse', school_id: 1, id: 1, account_approved: true)
      student_medications = [double('st_med1'), double('st_med2')]
      school_medications = [double('sc_med1'), double('sc_med2')]
    end
    it "returns http success" do
      fake_school = double('school1', id: 1)
      allow(School).to receive(:find).and_return(fake_school)
      get :inventory
      expect(response).to have_http_status(:success)
    end
    it "should query the schools, SchoolMedication, StudentMedication model" do
      fake_school = double('school1', id: 1)
      student_medications = [double('st_med1', school_id: 1), double('st_med2', school_id: 1)]
      school_medications = [double('sc_med1', school_id: 1), double('sc_med2', school_id: 1)]
      expect(School).to receive(:find).and_return(fake_school)
      expect(SchoolMedication).to receive(:where).and_return(school_medications)
      expect(StudentMedication).to receive(:where).and_return(student_medications)
      get :inventory
    end
  end


  describe "Render Nurse Homepage" do
    it "returns http success" do
      get :homepage
      expect(response).to have_http_status(:success)
    end

    it "should query the SchoolMedication Model" do
      fake_medicines = [double('medicine1'), double('medicine2')]
      expect(SchoolMedication).to receive(:where).and_return(fake_medicines)
      get :homepage
    end

    it "should render the nurse homepage" do

      fake_medicines = [double('medicine1'), double('medicine2')]
      allow(SchoolMedication).to receive(:where).and_return(fake_medicines)
      get :homepage

      expect(response).to render_template("homepage")
    end

    it "should assign the @meds_in_low_supply member variable" do
      fake_medicines = [double('medicine1'), double('medicine2')]
      allow(SchoolMedication).to receive(:where).and_return(fake_medicines)
      get :homepage
      expect(assigns(:meds_in_low_supply)).to eq(fake_medicines)
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
      allow(SchoolMedicationTransaction).to receive(:create!).and_return(double('transaction', :decrease_medication_quantity => nil))
      post :administer_submit, { select_student: "1", select_school_medication: "1", dosage: "1", time: "2021-11-16T18:06", comment: ""}
      expect(flash[:info]).to be_truthy
      expect(response).to redirect_to :administer
    end

    it 'should call the school medication transaction model to create a new transaction when a school medication is selected in the form' do
      expect(SchoolMedicationTransaction).to receive(:create!).and_return(double('transaction', :decrease_medication_quantity => nil))
      post :administer_submit, { select_student: "1", select_school_medication: "1", dosage: "1", time: "2021-11-16T18:06", comment: ""}
    end

    it 'should call the student medication transaction model to create a new transaction when a student medication is selected in the form' do
      expect(StudentMedicationTransaction).to receive(:create!).and_return(double('transaction', :decrease_medication_quantity => nil))
      post :administer_submit, { select_student: "1", select_student_medication: "1", dosage: "1", time: "2021-11-16T18:06", comment: ""}
    end
  end

  describe 'Add Medication' do
    it 'should create an instance of SchoolMedication' do
      expect(SchoolMedication).to receive(:create!)
      get :add_medication_submit, {name_of_medication: 'fake_med_name', unit_of_measurement: 'fake_unit', initial_amount: 10}
    end
    it 'should create an instance of StudentMedication' do
      expect(StudentMedication).to receive(:create!)
      get :add_medication_submit, {name_of_medication: 'fake_med_name', unit_of_measurement: 'fake_unit', initial_amount: 10, belongs_to_student: "on", student_id: 1}
    end
    it 'should reach the no student id flash' do
      get :add_medication_submit, {name_of_medication: 'fake_med_name', unit_of_measurement: 'fake_unit', initial_amount: 10, belongs_to_student: "on", student_id: ''}
    end
    it 'should reach the no initial amount flash' do
      get :add_medication_submit, {name_of_medication: 'fake_med_name', unit_of_measurement: 'fake_unit', initial_amount: '', belongs_to_student: "on", student_id: 1}
    end
    it 'should reach the invalid initial amount flash' do
      get :add_medication_submit, {name_of_medication: 'fake_med_name', unit_of_measurement: 'fake_unit', initial_amount: 'a', belongs_to_student: "on", student_id: 1}
    end
    it 'should reach the no unit of measurement flash' do
      get :add_medication_submit, {name_of_medication: 'fake_med_name', unit_of_measurement: '', initial_amount: 10, belongs_to_student: "on", student_id: 1}
    end
    it 'should reach the no name of medication flash' do
      get :add_medication_submit, {name_of_medication: '', unit_of_measurement: 'fake_unit', initial_amount: 10, belongs_to_student: "on", student_id: 1}
    end
    it 'should reach the invalid student id flash' do
      get :add_medication_submit, {name_of_medication: 'fake_med_name', unit_of_measurement: 'fake_unit', initial_amount: 10, belongs_to_student: "on", student_id: 'a'}
    end
  end

end
