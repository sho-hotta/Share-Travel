module Users
  class SessionsController < Devise::SessionsController
    def guest_sign_in
      user = User.guest
      sign_in user
      flash[:success] = 'ゲストでログインしました！'
      redirect_to root_url
    end
  end
end
