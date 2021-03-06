require 'rails_helper'

RSpec.describe AdministratorController, type: :controller do

  before {
    admin =  double('admin', school_id: 1, account_approved: true)
    login_with(admin, :administrator)
  }

  describe "Render Homepage" do

    before(:each) do
      @fake_nurses = [double('nurse1'), double('nurse2')]
      @fake_admins = [double('admin1'), double('admin2')]
    end

    it "returns http success" do
      get :homepage
      expect(response).to have_http_status(:success)
    end

    it "should query the Nurse Model" do
      expect(Nurse).to receive(:where).and_return(@fake_nurses)
      get :homepage
    end

    it "should query the Administrator Model" do
      expect(Administrator).to receive(:where).and_return(@fake_admins)
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

    it "should assign the @unapproved_admins member variable" do
      allow(Administrator).to receive(:where).and_return(@fake_admins)
      get :homepage
      expect(assigns(:unapproved_admins)).to eq(@fake_admins)
    end

  end

  describe "Render approve accounts Page" do

    before(:each) do
      @fake_nurses = [double('nurse1', account_approved: true), double('nurse2', account_approved: false)]
      @fake_admins = [double('nurse1', account_approved: false), double('nurse2', account_approved: true)]
    end

    it "returns http success" do
      get :approve_accounts
      expect(response).to have_http_status(:success)
    end

    it "should query the Nurse Model" do
      expect(Nurse).to receive(:where).and_return(@fake_nurses)
      get :approve_accounts
    end

    it "should query the Administrator Model" do
      expect(Administrator).to receive(:where).and_return(@fake_admins)
      get :approve_accounts
    end

    it "should render the approve_accounts page" do
      allow(Nurse).to receive(:where).and_return(@fake_nurses)
      get :approve_accounts

      expect(response).to render_template("approve_accounts")
    end

    it "should assign the @school_nurses member variable" do
      allow(Nurse).to receive(:where).and_return(@fake_nurses)
      get :approve_accounts
      expect(assigns(:school_nurses)).to eq(@fake_nurses)
    end

    it "should assign the @unapproved_nurses member variable" do
      allow(Nurse).to receive(:where).and_return(@fake_nurses)
      get :approve_accounts
      expect(assigns(:unapproved_nurses)).to eq([@fake_nurses[1]])
    end

    it "should assign the @approved_nurses member variable" do
      allow(Nurse).to receive(:where).and_return(@fake_nurses)
      get :approve_accounts
      expect(assigns(:approved_nurses)).to eq([@fake_nurses[0]])
    end

    it "should assign the @school_admins member variable" do
      allow(Administrator).to receive(:where).and_return(@fake_admins)
      get :approve_accounts
      expect(assigns(:school_admins)).to eq(@fake_admins)
    end

    it "should assign the @unapproved_admins member variable" do
      allow(Administrator).to receive(:where).and_return(@fake_admins)
      get :approve_accounts
      expect(assigns(:unapproved_admins)).to eq([@fake_admins[0]])
    end

    it "should assign the @approved_admins member variable" do
      allow(Administrator).to receive(:where).and_return(@fake_admins)
      get :approve_accounts
      expect(assigns(:approved_admins)).to eq([@fake_admins[1]])
    end

  end

  describe "approve_new_account route" do

    before(:each) do
      @fake_nurses = [double('nurse1', :update => 1), double('nurse2')]
      @fake_admins = [double('admin1', :update => 1), double('admin2')]
      @email = "bob@bob.com"
      @admin_role = "Administrator"
      @nurse_role = "Nurse"
    end

    it "should assign the @email member variable" do

      allow(Nurse).to receive(:where).and_return(@fake_nurses)
      allow(Administrator).to receive(:where).and_return(@fake_admins)
      post :approve_new_account, {"email" => @email, "role" => @nurse_role}
      expect(assigns(:email)).to eq(@email)

    end

    it "should assign the @role member variable" do

      allow(Nurse).to receive(:where).and_return(@fake_nurses)
      allow(Administrator).to receive(:where).and_return(@fake_admins)
      post :approve_new_account, {"email" => @email, "role" => @admin_role}
      expect(assigns(:role)).to eq(@admin_role)

    end

    it "should query the nurse model when the role is nurse" do
      expect(Nurse).to receive(:where).and_return(@fake_nurses)
      post :approve_new_account, {"email" => @email, "role" => @nurse_role}
    end

    it "should query the admin model when the role is admin" do
      expect(Administrator).to receive(:where).and_return(@fake_admins)
      post :approve_new_account, {"email" => @email, "role" => @admin_role}
    end

    it "should call the update method on the returned nurse object when the role is nurse" do
      allow(Nurse).to receive(:where).and_return(@fake_nurses)
      expect(@fake_nurses[0]).to receive(:update).with(account_approved: true).and_return(nil)
      post :approve_new_account, {"email" => @email, "role" => @nurse_role}
    end

    it "should call the update method on the returned admin object when the role is admin" do
      allow(Administrator).to receive(:where).and_return(@fake_admins)
      expect(@fake_admins[0]).to receive(:update).with(account_approved: true).and_return(nil)
      post :approve_new_account, {"email" => @email, "role" => @admin_role}

    end

    it "should redirect to the approve accounts page" do
      allow(Nurse).to receive(:where).and_return(@fake_nurses)
      post :approve_new_account, {"email" => @email, "role" => @nurse_role}
      expect(response).to redirect_to(:approve_accounts)
    end

  end




  describe 'Add Student' do
    it 'should create an instance of Student' do
      allow(Parent).to receive(:where).and_return([double("parent", :students => [])])
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
      get :submit_new_student, {student_name: 'fake_name', school_id: 'fake_id', date_of_birth: '', parent_email: "kmema@uiowa.edu"}
    end
    it 'should reach the parent email not specified flash' do
      get :submit_new_student, {student_name: 'fake_name', school_id: 'fake_id', date_of_birth: 10/10/2021, parent_email: ''}
    end
  end

  describe "Render Administrator Inventory Page" do
    #it "returns http success" do
      #get :inventory
      #expect(response).to have_http_status(:success)
      #end
    #
    it "should query the School Model" do
      fake_school = double("school1", :school_id => 1)
      expect(School).to receive(:find).and_return(fake_school)
      get :inventory
    end

    it "should query the SchoolMedication Model" do
      fake_school = double("school1", :school_id => 1)
      fake_medication = [double('medicine1'), double('medicine2')]
      allow(School).to receive(:find).and_return(fake_school)
      expect(SchoolMedication).to receive(:where).and_return(fake_medication)
      get :inventory
      #expect(response).to render_template("inventory")
    end
    it "should query the StudentMedication Model" do
      fake_medication = [double('medicine1'), double('medicine2')]
      fake_school = double("school1", :school_id =>1)
      allow(School).to receive(:find).and_return(fake_school)
      expect(StudentMedication).to receive(:where).and_return(fake_medication)
      get :inventory

    end
  end

end
