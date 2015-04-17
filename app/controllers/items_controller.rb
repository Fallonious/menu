class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_meal, only: [:edit]

  def index
    @categories = Category.all
  end

  def show
    redirect_to edit_item_path(@item)
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def create
    @item = Item.new(name, price, description, category_id)
    respond_to do |format|
      if @item.save
        redirect_to root_path, notice: 'New item was successfully created.'
        # format.json { render :show, status: :created, location: @item }
      else
        render :new
        # format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    # respond_to do |format|
    if @item.update(item_params)
      redirect_to root_path, notice: 'Item was successfully updated.'
      # format.json { render :show, status: :ok, location: @item }
    else
      render :edit
        # format.json { render json: @item.errors, status: :unprocessable_entity }
    end
  end

  def destroy
    @item.destroy
    # respond_to do |format|
    redirect_to root_path, notice: 'Item was successfully destroyed.'
    # format.json { head :no_content }
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

  def set_meal
    session[:item] = Item.find(params[:id]).name
  end

  def item_params
    params.require(:item).permit(:name, :price, :description, :category_id)
  end

end
