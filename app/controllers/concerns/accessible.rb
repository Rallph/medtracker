# ../controllers/concerns/accessible.rb
module Accessible
  extend ActiveSupport::Concern
  included do
    before_action :check_user
  end

  protected
  def check_user
    if current_administrator
      flash.clear
      redirect_to administrator_root_path and return
    elsif current_nurse
      flash.clear
      redirect_to nurse_root_path and return
    elsif current_parent
      flash.clear
      redirect_to parent_root_path and return
    end
  end
end
