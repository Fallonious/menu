class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  private

  def category_params
    params.require(:category).permit(:description, :image)
  end


end
