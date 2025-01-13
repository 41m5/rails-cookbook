class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @category = Category.find(params[:category_id])
    end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.category = @category
    if @category.save
      redirect_to category_path(@category)
    else
      @recipe = Recipe.new
      render :new, status: :unprocessable_entity
    end
  end
end
