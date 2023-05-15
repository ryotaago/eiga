class ApplicationController < ActionController::Base
  before_action :authenticate_user_or_admin!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :guest_user?

  def authenticate_user_or_admin!

  if request.path.start_with?('/admin')
   authenticate_admin!
  else
   authenticate_user!
  end

  end
  
  def after_sign_in_path_for(resource) 
    movies_path
  end
  
  
  def guest_user?
    !user_signed_in?
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
