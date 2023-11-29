class SessionsController < ApplicationController
    def new 
        @user = User.new

    end

    def create
        email = params[:session][:email]
        password = params[:session][:password]
        @user = User.find_by_credentials(email, password)
        if @user
            @user.reset_session_token!
            login(@user)
            redirect_to :new_user
        else 
            redirect_to :new_session
        end
    end

    def destroy
        logout!
        redirect_to :new_user
    end

    def session_params
        params.require(:session).permit(:email, :password)
    end

end
