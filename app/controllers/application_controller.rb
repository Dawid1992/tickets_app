class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :chek_log_in
  # before_action :chek_fans_alert

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  def chek_log_in # nie apropos kodu, ale jak coś, to check
    if user_signed_in?
      @log_in = true
      unless User.exists?(admin: true)
        current_user.update_attribute :admin, true
      end
    else
      @log_in = false
    end
  end

  # def chek_fans_alert
  #   if user_signed_in?
  #     if(Fanalert.exists?(user_id: current_user.id))
  #       @allowToFollow = false
  #     else
  #       @allowToFollow = true
  #     end
  #   else
  #     @allowToFollow = false
  #   end
  # end


end
