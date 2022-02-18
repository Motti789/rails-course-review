class SessionController < ApplicationController

  
    def new
      if !logged_in?
        @user = User.new
      else
       redirect_to user_path(current_user)
      end
    end
  
    
    def create
       user = User.find_by(name: params[:user][:name])
      if user && user.authenticate(params[:user][:password])

        session[:user_id] = user.id
        redirect_to user_path(user), notice: "Successfully logged in"
      else
        flash[:message] = "Email or password incorrect. Please try again."
        redirect_to '/signin'
      end
    end
  
    
  
    def destroy
      session.delete("user_id")
      redirect_to root_path, notice: 'Logged Out'
    end

    def omniauth
      binding.pry
    end
  end