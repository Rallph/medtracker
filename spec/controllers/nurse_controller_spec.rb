require 'rails_helper'

RSpec.describe NurseController, type: :controller do

  before { login_with(double('nurse'), :nurse) }

  describe "GET #homepage" do
    it "returns http success" do
      get :homepage
      expect(response).to have_http_status(:success)
    end
  end

end
