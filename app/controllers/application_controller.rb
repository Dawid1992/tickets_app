class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :chek_log_in

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  def chek_log_in
    if user_signed_in?
      @log_in = true
      unless User.exists?(admin: true)
        current_user.update_attribute :admin, true
      end
    else
      @log_in = false
    end
  end

end
