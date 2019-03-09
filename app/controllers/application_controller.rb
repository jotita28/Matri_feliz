class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name phone image])
  end

  protected

  def after_sign_in_path_for(*)
    if user_signed_in?
      todos_path
    else
      new_service_path
    end
  end
end
