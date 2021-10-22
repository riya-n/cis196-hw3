class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to "/posts/#{@post.id}"
    else
      render :new
    end
  end

  def show
    begin
      @post = Post.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to "/posts" unless @post
    end
  end

  def edit
    begin
      @post = Post.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to "/posts" unless @post
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    if @post.save
      redirect_to "/posts/#{@post.id}"
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to "/posts"
  end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end
end
