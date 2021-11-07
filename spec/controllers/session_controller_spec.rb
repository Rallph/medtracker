require 'spec_helper'
require 'rails_helper'


describe SessionController do

  describe "login" do

    before(:each) do

      @nurse_double = double('nurse1')
      @admin_double = double('admin')
      allow(Nurse).to receive(:find_by).and_return(@nurse_double)
      allow(Administrator).to receive(:find_by).and_return(double(@admin_double))

    end

    it "should return to the home screen if the username is missing" do
      subject { post 'session/login', {"username" => "bob", "account_type" => "Nurse"} }
      expect(subject).to redirect_to("session/welcome")

    end

    it "should return to the home screen if the password is missing" do
      subject { post 'session/login', {"username" => "", "password" => "goff", "account_type" => "Administrator"} }
      expect(subject).to redirect_to("session/welcome")
    end

    it "should return to the home screen if the user is not found" do

      subject { post 'session/login', {"username" => "bob", "password" => "goff", "account_type" => "Administrator"} }
      allow(Administrator).to receive(:find_by).and_return(nil)
      expect(subject).to redirect_to("session/welcome")

    end

    it "should correctly set the session variable" do

      allow(@admin_double).to receive(:id).and_return('21')
      subject { post 'session/login', {"username" => "bob", "password" => "goff", "account_type" => "Administrator"} }
      expect(session[:user_id]).to eq("21")

    end

    it "should redirect to home page for nurses when nurse logs in" do
      subject { post 'session/login', {"username" => "bob", "password" => "goff", "account_type" => "Nurse"} }
      expect(subject).to redirect_to("nurse/homepage")
    end

    it "should redirect to home page for admins when admin logs in" do
      subject { post 'session/login', {"username" => "bob", "password" => "goff", "account_type" => "Administrator"} }
      expect(subject).to redirect_to("administrator/homepage")
    end

  end

  describe "logout" do

    it "should correclty clear user_id in session variable" do
      expect(1).to be (2)
    end

  end

end