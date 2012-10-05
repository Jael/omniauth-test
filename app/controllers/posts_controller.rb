class PostsController < ApplicationController
  before_filter :log_in, :only => [:index, :edit, :update, :destroy, :edit, :create] 
 
  def index
    @user = current_user
    if params[:tag]
      @posts = @user.posts.tagged_with(params[:tag])
    else
      @posts = @user.posts.all
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @user = current_user
    @post = @user.posts.build(params[:post])
    if @post.save
      redirect_to @post, notice: "successfully created the post!"
    else
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])

      if @post.update_attributes(params[:post])
        redirect_to @post
      else
        render :edit
      end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: "Successfully destroy the post!"
  end
private 
def log_in
  if !current_user
    redirect_to log_in_path, notice: "Please sign in to access this page."
  end 
end
end
