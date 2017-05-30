class ItemsController < ApplicationController
  def index
  end

  def show
    @item = Item.where(item_hash: params[:item_hash]).first
    json_response @item, :ok
  end
end