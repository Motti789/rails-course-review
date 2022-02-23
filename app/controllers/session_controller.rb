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
      # user = User.find_or_create_by(uid: request.env['omniauth.auth'][:uid], provider: request.env['omniauth.auth'] [:provider]) do |u|
      #   u.username = request.env['omniauth.auth'][:info][:first_name]
      #   u.email = request.env['omniauth.auth'][:info][:email]
      #   u.password = SecureRandom.hex(15) 
    #   end 
    #   if user.valid?
    #     session[:user_id] = user.id
    #     redirect_to user_path(user), notice: "Successfully logged in"
    #   else
    #     redirect_to login_path
    #   end
    # end
    
  