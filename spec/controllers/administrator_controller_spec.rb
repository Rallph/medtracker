require 'rails_helper'

RSpec.describe AdministratorController, type: :controller do

  #before { login_with(double('admin'), :administrator) }
  before {
    administrator = double('administrator', school_id: 1, id: 1)
    login_with(administrator, :administrator)
  }

  describe "GET #homepage" do
    it "returns http success" do
      get :homepage
      expect(response).to have_http_status(:success)
    end
  end

  describe "Render Administrator Inventory Page" do
    #it "returns http success" do
      #get :inventory
      #expect(response).to have_http_status(:success)
      #end

    it "should query the SchoolMedication Model" do
      fake_school = double('school1', school_id: 1)
      fake_medication = [double('medicine1'), double('medicine2')]
      expect(School).to receive(:find).and_return(fake_school)
      expect(SchoolMedication).to receive(:where).and_return(fake_medication)
      get :inventory

      #expect(response).to render_template("inventory")
    end
  end

end
