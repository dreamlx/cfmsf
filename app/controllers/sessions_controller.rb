class SessionsController < Devise::SessionsController

  def new
    super
  end

  def create
    if valid_captcha?(params[:captcha]) || Rails.env == "test"
      self.resource = warden.authenticate!(auth_options)
      set_flash_message(:notice, :signed_in) if is_navigational_format?
      sign_in(resource_name, resource)
      redirect_to stored_location_for(resource)
    else
      redirect_to new_user_session_path, alert: "captcha_wrong"
    end
  end
end
