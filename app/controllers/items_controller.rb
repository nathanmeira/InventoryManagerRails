class ItemsController < ApplicationController
  def index
    @items = Item.all
    @item = Item.new
  end
  def show
    @item = Item.find(params[:id])
  end
  def new
    @item = Item.new
  end
  def create
    @item = Item.new(item_params)
    
    respond_to do |format|
      if @item.save
        format.html { redirect_to items_path, notice: 'Successfully added a new product' }
        format.js {}
        format.json { render json: @item, location: @item }
      else
        format.html { render action: "new" }
        format.js {}
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end
  def edit
    @item = Item.find(params[:id])
  end
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(params[:id]), notice: 'Successfully updated the product'
    else
      render 'edit'
    end
  end
  def destroy
    @item = Item.find(params[:id])
    respond_to do |format|
      if @item.destroy
        format.html { redirect_to items_path, notice: 'Successfully deleted the product' }
        format.js {}
        format.json { render json: @item }
      else
        format.html { redirect_to root_path, notice: "Failed to delete the product" }
        format.js {}
        format.json { render json: @item, status: :unprocessable_entity }
      end
    end
  end
  private
    def item_params
      params.require(:item).permit(:product_id,:name,:cost,:price)
    end
end
