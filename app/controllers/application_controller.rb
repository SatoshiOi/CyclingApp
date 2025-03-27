class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  def after_sign_in_path_for(resource)
    dashboard_path
  end

  def after_sign_in_path_for(resource)
    dashboard_path
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # ユーザー登録(sign_up)時に :name を許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :name ])
    # ユーザー情報更新(account_update)時に :name を許可
    devise_parameter_sanitizer.permit(:account_update, keys: [ :name ])
  end
end
