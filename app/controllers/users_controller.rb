class UsersController < ApplicationController
  layout "nav", only: [:edit,:show,:index,:role,:updaterole]

  def show
    @user = User.find(params[:id])
  end

  def index
  @users = User.all 
  end
  def new
   @user = User.new
  end
 
  def login
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      ActiveRecord::Base.transaction do
        @user.update_attributes(:usertype=>2, :check=> 0)
      end
      flash[:success] = "Welcome to LibSys!"
      redirect_to @user
    else
      render 'new'
    end
  end
 
  def edit
    @user = User.find(params[:id])
  end

  def role
    @user = User.find(params[:id])
  end
  
  def destroy
  @user = User.find(params[:id])
  @user.destroy
 
  redirect_to users_path
  end

  def makeadmin
    @user = User.find(params[:id])
    if @user.usertype == 2
      @user.update_attribute(:usertype, 1)
    elsif @user.usertype == 1
      @user.update_attribute(:usertype, 2)
    end
    redirect_to users_path
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Changes have been made successfully"
      redirect_to @user
    else
      render 'edit'
    end
  end
#update any user's name
    def updaterole
    @user = User.find(params[:id])
    if @user.update_attribute(:name, params[:user][:name])
      flash[:success] = "Changes have been made successfully"
      redirect_to @user
    else
      render 'edit'
    end

  end


#adding mail functionality here



  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation,:usertype,:check, :want_book,:ISBN)
    end
end
