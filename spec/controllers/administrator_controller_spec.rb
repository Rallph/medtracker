require 'rails_helper'

RSpec.describe AdministratorController, type: :controller do

  before { login_with(double('admin'), :administrator) }

  describe "GET #homepage" do
    it "returns http success" do
      get :homepage
      expect(response).to have_http_status(:success)
    end
  end

end
