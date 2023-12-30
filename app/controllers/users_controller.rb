class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login(@user.email, @user.password)
      redirect_to psot_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :nickname, :email, :password, :password_confirmation)
  end
end
