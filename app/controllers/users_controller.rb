class UsersController < ApplicationController
  
  def index
    @users = User.all
  end

  def new
    @users = User.new
  end

  def create
    @users = User.new(user_params)
    if @users.save
      redirect_to "/users"
    else
      render "/users/new"
    end
  end

  # Android 端注册
  def sign_up_from_android
    @name = params[:user][":name"]
    @password = params[:user][":password"]
    @users = User.all.to_a
    if @name.blank? || @password.blank?
      render :json => "用户名和密码不能为空"
    else
      if @users.map{ |item| item.name == @name }.include?(true)
        render :json => "用户已存在"
      else
        @user = User.create(:name => @name, :password => @password)
        if @user.save
          render :json => "Successfully"
        end
      end
    end
  end

  # Android 端获取用户信息
  def fetch_users_info
    @users = User.all.to_a
    render :json => @users
  end

  # rails 端登陆
  def sign_in
    @users = User.all.to_a
    if @users.map{ |item| item.name == params[:user][:name] && item.password == params[:user][:password] }.include?(true)
      render "/users/sign_in"
    else 
      redirect_to "/users/new"
    end
  end

  def show
    @users = User.new
  end

  def destroy
    @users = User.find(params[:id])
    @users.destroy
    redirect_to "/users"
  end

  private
    def user_params
      params.require(:user).permit(:name, :password)
    end
end