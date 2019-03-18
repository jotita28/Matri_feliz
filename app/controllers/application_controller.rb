# Lógica general del sistema
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
    format.html { redirect_to root_url, alert: exception.message }
    end
    end

  def current_ability
    if admin_user_signed_in?
      @current_ability ||= Ability.new(current_admin)
    elsif user_signed_in?
      @current_ability ||= Ability.new(current_user)
    else
      @current_ability ||= Ability.new(current_purveyor)
    end
  end

  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name phone image])
  end

  def after_sign_in_path_for(*)
    if user_signed_in?
      todos_path
    elsif purveyor_signed_in?
      new_service_path
    else
      admin_dashboard_path
    end
  end
end
