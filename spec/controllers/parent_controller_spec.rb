require 'rails_helper'

RSpec.describe ParentController, type: :controller do
  before {
    @fake_students = [double('student1'), double('student2')]
    @parent = double('parent', school_id: 1, id: 1, students: @fake_students)
    login_with(@parent, :parent)
    allow(controller).to receive(:current_parent).and_return(@parent)
  }

  describe "Render Parent's student medication page" do
    before(:each) do
      @fake_students = [double('student1'), double('student2')]
      @parent = double('parent', school_id: 1, id: 1, students: @fake_students)
      login_with(@parent, :parent)
      allow(controller).to receive(:current_parent).and_return(@parent)
    end
    it 'returns http success' do
      get :inventory
      expect(response).to have_http_status(:success)
    end

    it 'should assign the @students member variable' do
      get :inventory
      expect(assigns(:students)).to eq(@fake_students)
    end
  end

  describe "Parent has no assigned student" do
    before(:each) do
      @fake_students = []
      @fake_parent = double('parent1', school_id: 1, id: 1, students: @fake_students)
      login_with(@fake_parent, :parent)
      allow(controller).to receive(:current_parent).and_return(@fake_parent)
    end
    it 'should redirect to the parent homepage' do
      get :inventory
      expect(response).to redirect_to(:parent_root)
    end

  end

  describe "Parent's student has no approved student medication" do

  end
end
