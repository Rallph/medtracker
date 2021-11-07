require 'spec_helper'
require 'rails_helper'


describe SessionController do

  describe "login" do

    it "should return to the home screen if the username is missing" do
      expect(1).to be (2)
    end

    it "should return to the home screen if the password is missing" do
      expect(1).to be (2)
    end

    it "should correctly set the session variable" do
      expect(1).to be (2)
    end

    it "should redirect to home page for nurses when nurse logs in" do
      expect(1).to be (2)
    end

    it "should redirect to home page for admins when admin logs in" do
      expect(1).to be (2)
    end

  end

  describe "logout" do

    it "should correclty clear user_id in session variable" do
      expect(1).to be (2)
    end

  end

end