class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :null_session

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile, :department])
  end

  def after_sign_in_path_for(resource)
    root_path(resource)
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.name = "Guest"
      user.profile = "ゲストユーザーとしてログインしています。こちらはプロフィールの項目です。" 
      user.password = "123qwe"
    end
  end

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admins_top_path
    when Devise
      root_path
    end
  end

end