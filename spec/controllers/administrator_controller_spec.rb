require 'rails_helper'

RSpec.describe AdministratorController, type: :controller do

  before {
    admin =  double('admin', school_id: 1, account_approved: true)
    login_with(admin, :administrator)
  }

  describe "Render Homepage" do

    before(:each) do
      @fake_nurses = [double('nurse1'), double('nurse2')]
    end

    it "returns http success" do
      get :homepage
      expect(response).to have_http_status(:success)
    end

    it "should query the Nurse Model" do
      expect(Nurse).to receive(:where).and_return(@fake_nurses)
      get :homepage
    end

    it "should render the admin homepage" do

      allow(Nurse).to receive(:where).and_return(@fake_nurses)
      get :homepage

      expect(response).to render_template("homepage")
    end

    it "should assign the @unapproved_nurses member variable" do
      allow(Nurse).to receive(:where).and_return(@fake_nurses)
      get :homepage
      expect(assigns(:unapproved_nurses)).to eq(@fake_nurses)
    end

  end

  describe "Render Manage Access Page" do

    before(:each) do
      @fake_nurses = [double('nurse1', account_approved: true), double('nurse2', account_approved: false)]
    end

    it "returns http success" do
      get :approve_accounts
      expect(response).to have_http_status(:success)
    end

    it "should query the Nurse Model" do
      expect(Nurse).to receive(:where).and_return(@fake_nurses)
      get :approve_accounts
    end

    it "should render the approve_accounts page" do
      allow(Nurse).to receive(:where).and_return(@fake_nurses)
      get :approve_accounts

      expect(response).to render_template("approve_accounts")
    end

    it "should assign the @unapproved_nurses member variable" do
      allow(Nurse).to receive(:where).and_return(@fake_nurses)
      get :approve_accounts
      expect(assigns(:unapproved_nurses)).to eq([@fake_nurses[1]])
    end

  end

  describe "approve_new_account route" do

    before(:each) do
      @fake_nurses = [double('nurse1', :update => 1), double('nurse2')]
      @email = "bob@bob.com"
    end

    it "should assign the @email member variable" do

      allow(Nurse).to receive(:where).and_return(@fake_nurses)
      post :approve_new_account, {"email" => @email}
      expect(assigns(:email)).to eq(@email)

    end

    it "should query the nurse model" do
      expect(Nurse).to receive(:where).and_return(@fake_nurses)
      post :approve_new_account, {"email" => @email}
    end

    it "should call the update method on the returned nurse object" do
      allow(Nurse).to receive(:where).and_return(@fake_nurses)
      expect(@fake_nurses[0]).to receive(:update).with(account_approved: true).and_return(nil)
      post :approve_new_account, {"email" => @email}

    end

    it "should redirect to the approve accounts page" do
      allow(Nurse).to receive(:where).and_return(@fake_nurses)
      post :approve_new_account, {"email" => @email}

      expect(response).to redirect_to(:approve_accounts)
    end

  end



end
