# ../controllers/concerns/accessible.rb
module Accessible
  extend ActiveSupport::Concern
  included do
    before_action :check_user
  end

  protected
  def check_user
    if current_administrator
      flash[:alert] = "You are already signed in. If you want to sign into a different account, you must sign out of your current account first."
      redirect_to root_path and return
    elsif current_nurse
      flash[:alert] = "You are already signed in. If you want to sign into a different account, you must sign out of your current account first."
      redirect_to root_path and return
    elsif current_parent
      flash[:alert] = "You are already signed in. If you want to sign into a different account, you must sign out of your current account first."
      redirect_to root_path and return
    end
  end
end
