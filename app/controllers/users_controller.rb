class UsersController < ApplicationController

  def show
    @entry = current_user.entries.last
    @user = User.find(params[:id])
  end

end
