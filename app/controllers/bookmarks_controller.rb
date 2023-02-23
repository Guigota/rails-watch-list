class BookmarksController < ApplicationController
  before_action :set_bookmark, only: :destroy

  def new
    @bookmark = Bookmark.new
    @list = set_list
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = set_list
    @bookmark.list = @list
    @bookmark.save
    redirect_to @list
  end

  def destroy
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def set_list
    @list = List.find(params[:list_id])
  end
end
