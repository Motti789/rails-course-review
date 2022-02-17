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
          flash[:message] = "Email or password incorrect. Please try again."
          render :new
        end
    end

    def show
      set_user
    end

    private

    def set_user
      @user = User.find_by(id: params[:id])
    end

    def user_params
     params.require(:user).permit(:name, :password)
    end
end