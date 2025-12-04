class Users::BookmarksController < ApplicationController
  def index
    @bookmarks = current_user.bookmarks.includes(:product)

    render json: @bookmarks.as_json(include: :product), status: :ok
  end

  private

  def current_user
    @user = User.find(1)
  end
end
