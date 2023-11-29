class ApplicationController < ActionController::Base
    include Rails.application.routes.url_helpers

    helper_method :current_user, :logged_in?

    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
        return @current_user
    end

    def require_logged_in
        redirect_to :new_session unless logged_in?
    end

    def require_logged_out
        redirect_to :root if logged_in?
    end

    def login(user) 
        session[:session_token] = user.session_token 
    end

    def logged_in?
        !!current_user
    end

    def logout!
        session[:session_token] = nil
    end

end
