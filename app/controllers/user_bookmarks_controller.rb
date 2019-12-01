class UserBookmarksController < ApplicationController
  def new
    @user_bookmark = UserBookmark.new
  end

  def create
    @user_bookmark = UserBookmark.create(user_id: params[:user_id].to_i, learning_opportunity_id: params[:learning_opportunity_id].to_i)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @user_bookmark = UserBookmark.find(params[:id])
    @user_bookmark.destroy
    redirect_back(fallback_location: root_path)
  end

  private
end
