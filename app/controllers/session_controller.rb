class SessionController < ApplicationController
  
  def welcome
  end

  def login

    #insert try catch block here
    username = params.require(:username_field)
    password = params.require(:password_field)

    # set session to indicate user is logged in



  end
  
  def logout
  end
end
