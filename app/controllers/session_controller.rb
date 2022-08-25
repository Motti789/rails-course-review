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
      elsif user == nil
        flash[:error] = "User is empty"
        redirect_to '/signin'
      else
        flash[:error] = "Password is empty"
        redirect_to '/signin'
      end
    end
  
    
  
    def destroy
      session.clear
      redirect_to root_path, notice: 'Logged Out'
    end

    

        def omniauth
          @user = User.find_by(uid: auth['uid']) 
          if @user
            session[:user_id] = @user.id
            redirect_to user_path(@user), notice: "Successfully logged in"
          else
            @user = User.create(uid: auth['uid'], name: auth['info']['nickname'], password: SecureRandom.hex(12))
            session[:user_id] = @user.id
            redirect_to user_path(@user), notice: "Successfully logged in"
          end 
        end

    private

  def auth
    request.env['omniauth.auth']
  end
end


    
  