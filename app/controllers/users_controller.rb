class UsersController < ApplicationController


def index
  @konsulter = current_user.konsulter.all
end

def new

end

def create
  user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to root_path # '/' something is also possible depending oon where you wanna send them.
    else
      redirect_to '/signup'
    end
end


private

def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation)
end

end
