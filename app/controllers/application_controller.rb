class ApplicationController < ActionController::Base
    before_action :require_login
    def require_login
      unless logged_in?
        redirect_to new_user_session_path, alert: "ログインが必要です"
      end
    end

    private

    def not_authenticated
      redirect_to login_path, danger: "ログインしてください"
    end
end
