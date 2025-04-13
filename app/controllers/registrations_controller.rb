class RegistrationsController < Devise::RegistrationsController
  private

  def after_sign_up_path_for(_resource)
    root_path # ここをログイン後のホーム画面に変更
  end

  def after_update_path_for(resource)
    edit_user_registration_path
  end
end
