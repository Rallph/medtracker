class AdministratorController < ApplicationController

  before_action :authenticate_administrator!

  def homepage
  end

end
