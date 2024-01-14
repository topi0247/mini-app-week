class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  before_action :set_user, only: %i[edit update destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login(@user.email, @user.password)
      # TODO: フラッシュメッセージを表示する
      redirect_to posts_path
    else
      # TODO: フラッシュメッセージを表示する
      render 'new', status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
  end

  # TODO: ログインしているユーザーのみがアクセスできるようにする
  def edit; end

  # TODO: ログインしているユーザーのみがアクセスできるようにする
  def update
    if @user.update(user_params)
      # TODO: フラッシュメッセージを表示する
      redirect_to user_path(id: params[:id])
    else
      # TODO: フラッシュメッセージを表示する
      render 'edit', status: :unprocessable_entity
    end
  end

  # TODO: ログインしているユーザーのみがアクセスできるようにする
  def destroy
    if @user.destroy
      # TODO: フラッシュメッセージを表示する
      redirect_to root_path, status: :see_other
    else
      # TODO: フラッシュメッセージを表示する
      redirect_to root_path, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :nickname, :profile, :email, :password, :password_confirmation, :avatar, :avatar_cache)
  end

  def set_user
    @user = current_user
  end
end
