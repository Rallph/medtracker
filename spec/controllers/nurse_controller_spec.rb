require 'rails_helper'

RSpec.describe NurseController, type: :controller do

  before { login_with(double('nurse'), :nurse) }

  describe "GET #homepage" do
    it "returns http success" do
      get :homepage
      expect(response).to have_http_status(:success)
    end
  end

  describe "Render Administer Medication Page" do
    it 'should query the student model' do
      fake_students = [double('student1'), double('student2')]
      expect(Student).to receive(:where).and_return(fake_students)
      get :administer
    end

    it 'should query the school medication model' do
      fake_medication = [double('med1'), double('med2')]
      expect(SchoolMedication).to receive(:where).and_return(fake_medication)
      get :administer
    end

    it 'should query the student medication model' do
      fake_medication = [double('med1'), double('med2')]
      expect(StudentMedication).to receive(:where).and_return(fake_medication)
      get :administer
    end

    it 'should render the administer medication template' do

      fake_students = [double('student1'), double('student2')]
      fake_medication = [double('med1'), double('med2')]

      allow(Student).to receive(:where).and_return(fake_students)
      allow(SchoolMedication).to receive(:where).and_return(fake_medication)
      allow(StudentMedication).to receive(:where).and_return(fake_medication)
      get :administer

      expect(response).to render_template("administer")
    end
  end

end
