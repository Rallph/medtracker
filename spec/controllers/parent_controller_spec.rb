require 'rails_helper'

RSpec.describe ParentController, type: :controller do
  before {
    @fake_students = [double('student1'), double('student2')]
    @parent = double('parent', school_id: 1, id: 1, students: @fake_students)
    login_with(@parent, :parent)
    allow(controller).to receive(:current_parent).and_return(@parent)
  }

  describe "Render Parent's student medication page" do
    before(:each) do
      @fake_students = [double('student1'), double('student2')]
      @parent = double('parent', school_id: 1, id: 1, students: @fake_students)
      login_with(@parent, :parent)
      allow(controller).to receive(:current_parent).and_return(@parent)
    end
    it 'returns http success' do
      get :parent_inventory
      expect(response).to have_http_status(:success)
    end

    it 'should assign the @students member variable' do
      get :parent_inventory
      expect(assigns(:students)).to eq(@fake_students)
    end
  end

  describe "Parent has no assigned student" do
    before(:each) do
      @fake_students = []
      @fake_parent = double('parent1', school_id: 1, id: 1, students: @fake_students)
      login_with(@fake_parent, :parent)
      allow(controller).to receive(:current_parent).and_return(@fake_parent)
    end
    it 'should redirect to the parent homepage' do
      get :parent_inventory
      expect(response).to redirect_to(:parent_root)
    end

  end

  describe "Parent's student has no approved student medication" do

  end

  before {
    @fake_students = [double('student1'), double('student2')]
    @admin = double('admin', school_id: 1, id: 1, students: @fake_students)
    login_with(@admin, :administrator)
    allow(controller).to receive(:current_parent).and_return(@admin)
  }

  describe "Render Parent Homepage" do

    it "returns http success" do
      get :homepage
      expect(response).to have_http_status(:success)
    end

    it "should get the students of the current parent" do
      expect(controller).to receive(:current_parent).and_return(@admin)
      get :homepage
    end

    it "should render the parent homepage" do

      get :homepage
      expect(response).to render_template("homepage")
    end

    it "should assign the @students member variable" do
      get :homepage
      expect(assigns(:students)).to eq(@fake_students)
    end

  end

  describe "Render Parent Consent Form" do
    it 'should query the models: Student, SchoolMedication, and StudentMedication' do
      fake_approval = [double('fa', student_or_school: 'school', school_medication_id: 1), double('fa', student_or_school: 'student', student_medication_id: 1)]
      fake_students = [double('student1', full_name: 'student1', id: 1, medication_approvals: fake_approval)] #, double('student2', full_name: 'student2', id: 2)]
      expect(Student).to receive(:where).and_return(fake_students)

      fake_school_meds = [double('school_med', id: 1),double('school_med', id: 2)]
      expect(SchoolMedication).to receive(:all).and_return(fake_school_meds)

      fake_student_meds = [double('student_med', id: 1), double('student_med', id: 2)]
      expect(StudentMedication).to receive(:where).and_return(fake_student_meds)

      get :consent_form, {student_id: 1}
    end
  end

  describe "Approve Medication" do
    it 'should create an instance of the MedicationApproval model' do
      expect(MedicationApproval).to receive(:create!)
      post :approve_medication, {student_id: 1, med_type: 'school', sc_medication_id: 1}
    end
    it 'should create an instance of the MedicationApproval model' do
      expect(MedicationApproval).to receive(:create!)
      post :approve_medication, {student_id: 1, med_type: 'student', st_medication_id: 1}
    end
  end

  describe "Disapprove Medication" do
    it 'should query the MedicationApproval model' do
      fake_approvals = [double('fa', student_id: 1, student_or_school: 'school', school_medication_id: 1)]
      expect(MedicationApproval).to receive(:where).and_return(fake_approvals)
      # allow(MedicationApproval).to receive(:destroy).and_return(false)
      expect(fake_approvals[0]).to receive(:destroy).with(no_args).and_return(nil)


      post :disapprove_medication, {student_id: 1, med_type: 'school', medication_id: 1}
    end

    it 'should query the MedicationApproval model' do
      fake_approvals = [double('fa2', student_id: 1, student_or_school: 'school', school_medication_id: 1)]
      expect(MedicationApproval).to receive(:where).and_return(fake_approvals)
      expect(fake_approvals[0]).to receive(:destroy).with(no_args).and_return(nil)
      post :disapprove_medication, {student_id: 1, med_type: 'student', medication_id: 1}
    end
  end

end
