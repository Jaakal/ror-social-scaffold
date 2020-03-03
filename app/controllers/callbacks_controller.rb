class CallbacksController < Devise::OmniauthCallbacksController
  def github
    @user = User.from_ominauth(request.env["omniauth.auth"])
    signin_and_redirect @user
  end
end
