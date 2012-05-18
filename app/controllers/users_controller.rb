class UsersController < ApplicationController
  
  skip_before_filter :authorize, only: [:new, :create]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      UserMailer.welcome_email(@user).deliver
      flash[:notice] = "Welcome!"
      redirect_to root_path
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    @user = User.find(params[:id])
    @user.locale = params[:user][:locale]
    if @current_user.id === @user.id && @user.save
      set_flash_message(:notice)
      redirect_to root_path
    else
       render :edit
    end
  end
  
end
