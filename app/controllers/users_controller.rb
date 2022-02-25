class UsersController < ApplicationController
  before_action :set_user, except: [:new, :create]
    
    def new
      if !logged_in?
       @user = User.new
      else
        redirect_to user_path(current_user)
      end
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
    end

    private

    def set_user
      @user = User.find_by(id: params[:id])
    end

    def user_params
     params.require(:user).permit(:name, :password)
    end
end