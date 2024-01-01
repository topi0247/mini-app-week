class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login(@user.email, @user.password)
      redirect_to posts_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      redirect_to user_path(id: params[:id])
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @user = current_user
    @user.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :nickname, :profile, :email, :password, :password_confirmation, :avatar, :avatar_cache) # rubocop:disable Layout/LineLength
  end
end
