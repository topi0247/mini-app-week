class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new; end

  def create
    @user = login(params[:email], params[:password])

    if @user
      # TODO: フラッシュメッセージを表示する
      redirect_to posts_path
    else
      # TODO: フラッシュメッセージを表示する
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    logout
    # TODO: フラッシュメッセージを表示する
    redirect_to root_path, status: :see_other
  end
end
