class ApplicationController < ActionController::Base
  helper_method :current_user_message?

  private

  def current_user_message?(message, current_user)
    message.user == current_user
  end
end
