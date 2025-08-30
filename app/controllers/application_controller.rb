class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :authenticate_user!, only: [ :update_avatar ]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def update_avatar
    if current_user.update(avatar_params)
      redirect_back(fallback_location: root_path, notice: "Profile photo updated successfully!")
    else
      redirect_back(fallback_location: root_path, alert: "Failed to update profile photo.")
    end
  end

  private

  def avatar_params
    params.require(:user).permit(:avatar)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [ :avatar ])
  end
end
