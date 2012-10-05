class SessionsController < ApplicationController
  def create
    if request.env["omniauth.auth"]
      c = User.new_user(request.env['omniauth.auth'])
      user = User.from_auth(request.env['omniauth.auth'])
      session[:user_id] = user.id
      flash[:notice] = "Welcome #{user.nickname}"
      if c 
        redirect_to user_steps_path
      else
        redirect_to user_posts_path(user)
      end
    
    else 
      user = User.find_by_email(params[:email]) 
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to posts_path, notice: "Welcome #{user.email}" 
      else
        flash.now[:notice] = "Invalid email or password!"
        render :new
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to log_in_path, notice: "Successfully Sign out!"

  end
end
