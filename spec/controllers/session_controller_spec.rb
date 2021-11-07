require 'spec_helper'
require 'rails_helper'


describe SessionController do

  describe "login" do

    before(:each) do

      @nurse_double = double('nurse1')
      @admin_double = double('admin')
      allow(Nurse).to receive(:find_by).with(any_args).and_return(@nurse_double)
      allow(Administrator).to receive(:find_by).with(any_args).and_return(@admin_double)

    end

    it "should return to the home screen if the username is missing" do
      post :login, {"username_field" => "", "password_field" => "goff", "account_type" => "Nurse"}
      expect(response).to redirect_to(root_path)

    end

    it "should return to the home screen if the password is missing" do
      post :login, {"username_field" => "bob", "password_field" => "", "account_type" => "Administrator"}
      expect(response).to redirect_to(root_path)
    end

    it "should return to the home screen if the user is not found" do

      allow(Administrator).to receive(:find_by).with(any_args).and_return(nil)
      post :login, {"username_field" => "bob", "password_field" => "goff", "account_type" => "Administrator"}
      expect(subject).to redirect_to(root_path)

    end

    it "should correctly set the session variable" do

      allow(@admin_double).to receive(:id).and_return('21')
      post :login, {"username_field" => "bob", "password_field" => "goff", "account_type" => "Administrator"}
      expect(session[:user_id]).to eq("21")

    end

    it "should redirect to home page for nurses when nurse logs in" do

      allow(@nurse_double).to receive(:id).and_return('21')
      post :login, {"username_field" => "bob", "password_field" => "goff", "account_type" => "Nurse"}
      expect(response).to redirect_to(nurse_homepage_path)
    end

    it "should redirect to home page for admins when admin logs in" do

      allow(@admin_double).to receive(:id).and_return('21')
      post :login, {"username_field" => "bob", "password_field" => "goff", "account_type" => "Administrator"}
      expect(response).to redirect_to(administrator_homepage_path)
    end

  end

  describe "logout" do

    it "should correclty clear user_id in session variable" do

      session[:user_id] = '1234'
      post :logout, {}
      expect(session[:user_id]).to eq(nil)
    end

    it "should redirect user to root page of website" do
      post :logout, {}
      expect(response).to redirect_to(root_path)

    end

  end

end