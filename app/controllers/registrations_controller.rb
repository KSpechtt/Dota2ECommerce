# frozen_string_literal: true

#  Class
class RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:user)
          .permit(:full_name,
                  :email,
                  :city,
                  :address,
                  :province_id,
                  :password,
                  :password_confirmation)
  end

  def account_update_params
    params.require(:user)
          .permit(:full_name,
                  :email,
                  :city,
                  :address,
                  :province_id,
                  :password,
                  :password_confirmation,
                  :current_password)
  end
end
