class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to "/dashboard"
      flash[:notice] = "Account created successfully"
    else
      flash[:success] = "An error occurred!"
      render "new"
    end
  end

def dashboard
  if current_user
    @user = current_user
    @link = Link.new
    @count = @user.links.count
    @recent_links = @user.links.most_recent_links.page(params[:recent_links]).per(5)
    @popular_links = @user.links.most_popular_links.page(params[:popular_links]).per(4)
  else 
    redirect_to "/login" 
    flash[:success] = "you have to be signed in"
  end
end

def show
end



  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
