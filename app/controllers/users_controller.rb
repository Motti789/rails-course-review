class UsersController < ApplicationController

    def new
     @user = User.new
    end

    def create
        @user = User.new(user_params)
          if @user.save
          session[:user_id] = @user.id
          redirect_to user_path(@user), notice: "Signed up successfully"
        else
            flash[:danger] = 'Invalid email/password combination' # Not quite right!
          render 'new'
      end
    end

    def show
        @user = User.find_by(id: params[:id])
    end

    def user_params
     params.require(:user).permit(:name, :password)
    end
end