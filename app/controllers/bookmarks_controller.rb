class BookmarksController < ApplicationController
  def create
    bookmark = current_user.bookmarks.build(shop_id: params[:shop_id])
    if bookmark.save
      redirect_to root_path, notice: 'ブックマークしました'
    else
      redirect_to root_path 
    end
  end

  def destroy
    bookmark = current_user.bookmarks.find_by(shop_id: params[:shop_id])
    if bookmark.destroy
      redirect_to root_path, notice: 'ブックマークを解除しました'
    else
      redirect_to root_path
    end
  end
end