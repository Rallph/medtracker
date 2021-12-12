require 'rails_helper'

RSpec.describe AdministratorController, type: :controller do

  before { login_with(double('admin'), :administrator) }

  describe "GET #homepage" do
    it "returns http success" do
      get :homepage
      expect(response).to have_http_status(:success)
    end
  end

  describe 'Add Student' do
    it 'should create an instance of Student' do
      expect(Student).to receive(:create!)
      get :submit_new_student, {student_name: 'fake_name', school_id: 'fake_id', date_of_birth: 10/10/2021, parent_email: "kmema@uiowa.edu"}
    end
    it 'should reach the student name not specified flash' do
      get :submit_new_student, {student_name: '', school_id: 'fake_id', date_of_birth: 10/10/2021, parent_email: "kmema@uiowa.edu"}
    end
    it 'should reach the school id not specified flash' do
      get :submit_new_student, {student_name: 'fake_name', school_id: '', date_of_birth: 10/10/2021, parent_email: "kmema@uiowa.edu"}
    end
    it 'should reach the DOB not specified flash' do
      get :submit_new_student, {student_name: 'fake_name', school_id: 'fake_id', date_of_birth: 10/10/2021, parent_email: "kmema@uiowa.edu"}
    end
    it 'should reach the parent email not specified flash' do
      get :submit_new_student, {student_name: 'fake_name', school_id: 'fake_id', date_of_birth: 10/10/2021, parent_email: ""}
    end
  end

end
