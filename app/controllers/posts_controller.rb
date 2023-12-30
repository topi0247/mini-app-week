class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user)
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(title: params[:title], body: params[:body])

    if post.save
      redirect_to posts_path
    else
      render 'new', status: :unprocessable_entity
    end
  end
end
