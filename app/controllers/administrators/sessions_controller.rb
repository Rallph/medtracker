# frozen_string_literal: true

class Administrators::SessionsController < Devise::SessionsController

  include Accessible
  skip_before_action :check_user, only: [:destroy, :create]

end
