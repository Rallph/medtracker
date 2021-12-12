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
    @parent = double('admin', school_id: 1, id: 1, students: @fake_students)
    login_with(@parent, :administrator)
    allow(controller).to receive(:current_parent).and_return(@parent)
  }

  describe "Render Parent Homepage" do

    it "returns http success" do
      get :homepage
      expect(response).to have_http_status(:success)
    end

    it "should get the students of the current parent" do
      expect(controller).to receive(:current_parent).and_return(@parent)
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

  describe "Render Parent View Medication Distribution History" do

    before(:each) do
      @fake_parent = double('fake_parent')
      @fake_parents = [@fake_parent]
      @fake_nurse = double('nurse1', full_name: "Bob Henderson")
      @fake_med_transactions = [double('school_transaction_1', nurse_id: 1, change_in_quantity: 1, time: "3:45 PM", date: "11/12/2021", school_medication_id: 1),
                                   double('school_transaction_1', nurse_id: 2, change_in_quantity: 3, time: "4:45 PM", date: "11/12/2020", school_medication_id: 2)]
      @fake_medication = double('med1', unit: 'mL', medication_name: 'Ibuprofen')
      @fake_medications = [double('med1', unit: 'tablets', medication_name: 'Ibuprofen', student_medication_transactions: @fake_med_transactions),
                                  double('med2', unit: 'tablets', medication_name: 'Ibuprofen', student_medication_transactions: @fake_med_transactions)]
      @fake_student = double('fake_student_1', id: 1, school_medication_transactions: @fake_med_transactions,
                             student_medications: @fake_medications, parents: @fake_parents)


      allow(controller).to receive(:current_parent).and_return(@fake_parent)
      allow(SchoolMedication).to receive(:find).and_return(@fake_medication)
      allow(Student).to receive(:find).and_return(@fake_student)
      allow(Nurse).to receive(:find).and_return(@fake_nurse)

    end

    it "returns http success" do
      get :medication_history
      expect(response).to have_http_status(:success)
    end

    it "should correctly assign @med_transactions member variable" do

      get :medication_history
      correct_med_transactions = [
        {"nurse" => "Bob Henderson", "amount" => 1, "time" =>  "3:45 PM", "type" => "School Medication", "med_name" => "Ibuprofen", "units" => "mL", "date" => "11/12/2021"},
        {"nurse" => "Bob Henderson", "amount" => 3, "time" => "4:45 PM", "type" => "School Medication", "med_name" => "Ibuprofen", "units" => "mL", "date" => "11/12/2020"},
        {"nurse" => "Bob Henderson", "amount" => 1, "time" => "3:45 PM", "type" => "Student Medication", "med_name" => "Ibuprofen", "units" => "tablets", "date" => "11/12/2021"},
        {"nurse" => "Bob Henderson", "amount" => 3, "time" => "4:45 PM", "type" => "Student Medication", "med_name" => "Ibuprofen", "units" => "tablets", "date" => "11/12/2020"},
        {"nurse" => "Bob Henderson", "amount" => 1, "time" => "3:45 PM", "type" => "Student Medication", "med_name" => "Ibuprofen", "units" => "tablets", "date" => "11/12/2021"},
        {"nurse" => "Bob Henderson", "amount" => 3, "time" => "4:45 PM", "type" => "Student Medication", "med_name" => "Ibuprofen", "units" => "tablets", "date" => "11/12/2020"}
      ]


      expect(assigns(:med_transactions)).to eq(correct_med_transactions)

    end


    it "should query school medication transactions table" do

      expect(@fake_student).to receive(:school_medication_transactions)
      get :medication_history


    end

    it "should query student medications table" do

      expect(@fake_student).to receive(:student_medications)
      get :medication_history

    end

    it "should query student medication transactions table" do

      expect(@fake_medications).to all(receive(:student_medication_transactions))
      get :medication_history

    end

    it "should query school medications table" do

      expect(SchoolMedication).to receive(:find)
      get :medication_history

    end

    it "should query nurse table" do

      expect(Nurse).to receive(:find)
      get :medication_history

    end

  end

  describe "Render Parent Consent Form" do
    it 'should query the models: Student, SchoolMedication, and StudentMedication' do
      fake_approval = [double('fa', student_or_school: 'school', school_medication_id: 1), double('fa', student_or_school: 'student', student_medication_id: 1)]
      fake_students = [double('student1', full_name: 'student1', id: 1, medication_approvals: fake_approval)] #, double('student2', full_name: 'student2', id: 2)]
      expect(Student).to receive(:where).and_return(fake_students)

      fake_parents = [double('parent1', id: 1)]
      expect(fake_students[0]).to receive(:parents).with(no_args).and_return(fake_parents)

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
