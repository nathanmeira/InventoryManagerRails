class ItemsController < ApplicationController
  def index
    @items = Item.all
  end
  def show
    @item = Item.find(params[:id])
  end
  def new
    @item = Item.new
  end
  def create
    @item = Item.new

    @item.update(item_params)
    @item.save
    redirect_to items_path
  end
  def edit
    @item = Item.find(params[:id])
  end
  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to item_path(params[:id])
  end
  private
    def item_params
      params.require(:item).permit(:product_id,:name,:cost,:price)
    end
end
