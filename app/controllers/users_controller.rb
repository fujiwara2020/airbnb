class UsersController < ApplicationController

  def show
    @user = current_user
    @rooms = @user.rooms
    
  end

  def edit
  end
end
