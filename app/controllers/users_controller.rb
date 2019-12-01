class UsersController < ApplicationController

  def show
    @user = current_user
    @bookmarks = UserBookmark.where(user: current_user)
  end

end
