class SessionController < ApplicationController
  
  def welcome
  end

  def login

    begin

      username = params.require(:username_field)
      password = params.require(:password_field) #this will get used when we add authentication

      admin = Administrator.find_by(username: username)
      nurse = Nurse.find_by(username: username)

      if (admin != nil)

        session[:user_id] = admin.id
        redirect_to administrator_homepage_path
      elsif (nurse != nil)
        session[:user_id] = nurse.id
        redirect_to nurse_homepage_path
      else
        # return to site landing page if user isnt found in the db
        redirect_to root_path, alert: "User with username #{username} could not be found in the database"
      end

    rescue

      redirect_to root_path, alert: "Please enter both a username and password"

    end

  end
  
  def logout
    session[:user_id] = nil
    redirect_to root_path
  end
end
