class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  # private
  #
  # # Never trust parameters from the scary internet, only allow the white list through.
  # def user_params
  #   params.require(:user).permit(:provider, :uid, :name, :oauth_token, :oauth_expires_at)
  # end
end
