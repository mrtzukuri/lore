class UserBookmarksController < ApplicationController
  def new
    @user_bookmark = UserBookmark.new
  end

  def create
    @user_bookmark = UserBookmark.create!(user_id: params[:user_id].to_i, learning_opportunity_id: params[:learning_opportunity_id].to_i)
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.js
    end
  end

  def destroy
    @user_bookmark = UserBookmark.find(params[:id])
    @user_bookmark.destroy
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.js
    end
  end
end
