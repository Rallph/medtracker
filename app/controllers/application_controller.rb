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

  # check that user is both logged in and that their account has been approved
  def verify_nurse

    if current_nurse.account_approved == true
      authenticate_nurse!
    else
      flash[:warning] = "Your Account has not yet been approved by an administrator."
      redirect_to root_path
    end

  end

  # check that user is both logged in and that their account has been approved
  def verify_administrator

    if current_administrator.account_approved == true
      authenticate_administrator!
    else
      flash[:warning] = "Your Account has not yet been approved by an administrator."
      redirect_to root_path
    end

  end

end
