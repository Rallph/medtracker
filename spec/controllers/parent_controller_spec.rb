require 'rails_helper'

RSpec.describe ParentController, type: :controller do

  before {
    @fake_students = [double('student1'), double('student2')]
    @admin = double('admin', school_id: 1, id: 1, students: @fake_students)
    login_with(@admin, :administrator)
    allow(controller).to receive(:current_parent).and_return(@admin)
  }

  describe "Render Admin Homepage" do

    it "returns http success" do
      get :homepage
      expect(response).to have_http_status(:success)
    end

    it "should get the students of the current parent" do
      expect(controller).to receive(:current_parent).and_return(@admin)
      get :homepage
    end

    it "should render the nurse homepage" do

      get :homepage
      expect(response).to render_template("homepage")
    end

    it "should assign the @students member variable" do
      get :homepage
      expect(assigns(:students)).to eq(@fake_students)
    end

  end

end
