class BookmarksController < ApplicationController
  before_action :set_user

  def create
    @bookmark = @user.bookmarks.new(bookmark_params)
    if @bookmark.save
      render json: @bookmark.as_json, status: :created
    else
      render json: { errors: @bookmark.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    @bookmark = @user.bookmarks.find(params[:id])
    if @bookmark.destroy
      head :no_content
    else
      render json: { errors: @bookmark.errors.full_messages }, status: :bad_request
    end
  end

  private

  def current_user
    @user = User.find(1)
  end

  def bookmark_params
    params.require(:bookmark).permit(:product_id)
  end
end
