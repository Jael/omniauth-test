class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user
      redirect_to user_steps_path, notice: "Signed up sucessfully!"
    else
      render :new
    end
  end
end
