class ItemsController < ApplicationController

  def index
    @item = Item.all
  end

  def show
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
        format.html { redirect_to root_path, notice: 'New item was successfully created.' }
        # format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        # format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to root_path, notice: 'Item was successfully updated.' }
        # format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        # format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Item was successfully destroyed.' }
      # format.json { head :no_content }
    end
  end

  private
  def set_item
    @item
  end

  def item_params
    params.require(:item).permit(:name, :price, :description, :category_id)
  end

end
