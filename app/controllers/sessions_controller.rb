class SessionsController < ApplicationController
  def create
    if request.env["omniauth.auth"]
      user = User.from_auth(request.env['omniauth.auth'])
      session[:user_id] = user.id
      redirect_to posts_path, notice: "Welcome #{user.nickname}" 
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
    redirect_to posts_path, notice: "Successfully Sign out!"
  end
end
