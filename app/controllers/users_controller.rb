class UsersController < ApplicationController
  allow_unauthenticated_access only: %i[ new create ]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_home_path, notice: "Signed up successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @user = Current.session&.user
  end

  private

  def user_params
    params.require(:user).permit(:email_address, :password, :password_confirmation)
  end
end
