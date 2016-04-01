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