class UsersController < ApplicationController
  def index
  end

  def show
    @user =　User.find(params[:id])
    @post_images = @user.post_images    
  end

  def edit
  end
end
