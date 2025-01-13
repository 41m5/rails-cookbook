class BookmarksController < ApplicationController
  before_action :set_category, only: [:new, :create]
  before_action :set_bookmark, only: [:destroy]

  def new
    @bookmark = @category.bookmarks.new
    end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.category = @category
    if @bookmark.save
      redirect_to category_path(@category)
    else
      @recipe = Recipe.new
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to category_path(@bookmark.category), notice: "Recipe removed from category."
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:description, :recipe_id)
  end

  def set_category
    @category = Category.find(params[:category_id])
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end
end
