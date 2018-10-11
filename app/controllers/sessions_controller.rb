class SessionsController < Devise::SessionsController

  before_action :remove_authentication_flash_message_if_root_url_requested

  private

  def remove_authentication_flash_message_if_root_url_requested
    if session[:user_return_to] == root_path and flash[:alert] == I18n.t('devise.failure.unauthenticated')
      flash[:alert] = nil
    end
  end
end
