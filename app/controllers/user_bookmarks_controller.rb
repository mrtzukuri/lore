class UserBookmarksController < ApplicationController
  def new
    @user_bookmark = UserBookmark.new
  end

  def create
    @user_bookmark = UserBookmark.create(set_params)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @user_bookmark = UserBookmark.find(params[:id])
    @user_bookmark.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def set_params
    params.require(:user_bookmark).permit!
  end
end
