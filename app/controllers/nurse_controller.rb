class NurseController < ApplicationController

  before_action :authenticate_nurse!

  def homepage
  end
end
