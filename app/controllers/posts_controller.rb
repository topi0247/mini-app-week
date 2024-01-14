class PostsController < ApplicationController
  before_action :find_post, only: %i[show edit update destroy]

  def index
    @posts = Post.includes(:user).where(is_public: true)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      # TODO: フラッシュメッセージを表示する
      redirect_to posts_path
    else
      # TODO: フラッシュメッセージを表示する
      render 'new', status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    if @post.update(post_params)
      # TODO: フラッシュメッセージを表示する
      redirect_to post_path(id: params[:id])
    else
      # TODO: フラッシュメッセージを表示する
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    if @post.destroy
      # TODO: フラッシュメッセージを表示する
      redirect_to posts_path, status: :see_other
    else
      # TODO: フラッシュメッセージを表示する
      redirect_to posts_path, alert: '投稿の削除に失敗しました'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :photo, :photo_cache, :is_public)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
