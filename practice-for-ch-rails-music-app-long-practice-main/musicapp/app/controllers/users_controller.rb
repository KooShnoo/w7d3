class UsersController < ApplicationController
    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to :root
        else
            redirect_to :new_user
        end
    end

    def edit
        @user = User.find_by(id: params[:id])
        render :edit
    end

    def update
        @user = User.find_by(id: params[:id])
        if @user.save 
            redirect_to :root
        else 
            redirect_to :edit_user
        end
    end

    def user_params
        params.require(:user).permit(:email, :password)
    end

end
