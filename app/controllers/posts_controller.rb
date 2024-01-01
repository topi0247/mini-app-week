class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to posts_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])

    if @post.update(post_params)
      redirect_to post_path(id: params[:id])
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy

    redirect_to posts_path, status: :see_other
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :photo, :photo_cache)
  end
end
