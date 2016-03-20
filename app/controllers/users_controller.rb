class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    @user.save
    flash.notice = "'#{@user.user_name}' account created!"
    session[:user_id] = @user.id
    redirect_to :controller => :articles, action: "index"
  end

  def new
    @user = User.new
  end

  def show
    if current_user.id.to_s == params[:id].to_s
      @user = User.find(params[:id])
    else
      redirect_to :controller => :articles, action: "index"
    end
  end

  def user_params
    params.require(:user).permit(:user_name, :email, :password, :image)
  end
end
