# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!

  protected

  def after_update_path_for(_resource)
    # 自分で設定した「マイページ」へのパス
    users_path
  end

  # The path used after sign up.
  def after_sign_up_path_for(_resource)
    books_path
  end
end
