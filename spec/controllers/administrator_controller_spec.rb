require 'rails_helper'

RSpec.describe AdministratorController, type: :controller do

  before { login_with(double('admin'), :administrator) }

  describe "Render Homepage" do

    it "returns http success" do
      get :homepage
      expect(response).to have_http_status(:success)
    end

    it "should query the Nurse Model" do
      fake_nurses = [double('nurse1'), double('nurse2')]
      expect(Nurse).to receive(:where).and_return(fake_nurses)
      get :homepage
    end

    it "should render the admin homepage" do

      fake_nurses = [double('nurse1'), double('nurse2')]
      allow(Nurse).to receive(:where).and_return(fake_nurses)
      get :homepage

      expect(response).to render_template("homepage")
    end

    it "should assign the @unapproved_nurses member variable" do
      fake_nurses = [double('nurse1'), double('nurse2')]
      allow(Nurse).to receive(:where).and_return(fake_nurses)
      get :homepage
      expect(assigns(:unapproved_nurses)).to eq(fake_nurses)
    end

  end

end
