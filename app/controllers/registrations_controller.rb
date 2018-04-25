class RegistrationsController < Devise::RegistrationsController
  private
  def sign_up_params
    params.require(:customer).permit(:email, :password, :password_confirmation, :admin)
  end

  def account_update_params
    params.require(:customer).permit(:customer_id, :forename, :surname, :address, :postcode, :county, :city, :country, :created_at, :updated_at,
                                 :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at,
                                 :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip,
                                 :password, :password_confirmation, :current_password, :admin)
  end
end
