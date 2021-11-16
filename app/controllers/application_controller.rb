class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:full_name, :school_id, :email, :password)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:full_name, :school_id, :email, :password, :current_password)}
  end


  def prevent_double_sign_in

    # redirect to home pages of respective user if they are already logged in
    if nurse_signed_in?
      redirect_to nurse_root_path and return
    elsif parent_signed_in?
      redirect_to parent_root_path and return
    elsif administrator_signed_in?
      redirect_to administrator_root_path and return
    end
  end
end
