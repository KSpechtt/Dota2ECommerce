# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :intitialize_session
  before_action :load_cart

  def index
    @items = Item.all.page(params[:page]).per(12)
  end

  def show
    @items = Item.find(params[:id])
  end

  def cart; end

  def search_results
    @q = params[:search]
    @c = params[:category_name]

    @items = if @c.empty?
               Item.where('name LIKE ?', "%#{@q}%").page(params[:page]).per(12)
             else
               Item.where('name LIKE ? AND category_id = ?', "%#{@q}%", @c)
                   .page(params[:page])
             end
  end

  def filter_results
    @s = params[:onSale]
    @c = params[:cost]

    if @c == 'High'
      high_results
    elsif @c == 'Low'
      low_results
    end
  end

  def high_results
    @s = params[:onSale]

    @items = if @s == 'Sale'
               Item.where('onSale = 1').order(cost: :desc).page(params[:page])
                   .per(12)
             else
               Item.where('onSale = 0').order(cost: :desc).page(params[:page])
                   .per(12)
             end
  end

  def low_results
    @s = params[:onSale]

    @items = if @s == 'Sale'
               Item.where('onSale = 1').order(:cost).page(params[:page]).per(12)
             else
               Item.where('onSale = 0').order(:cost).page(params[:page]).per(12)
             end
  end

  def add_to_cart
    id = params[:id].to_i
    session[:cart] << id unless session[:cart].include?(id)
    flash[:notice] = 'Item successfully added to cart'
    redirect_to request.referrer
  end

  def remove_from_cart
    id = params[:id].to_i
    session[:cart].delete(id)
    redirect_to request.referrer
  end

  private

  def intitialize_session
    session[:item_quantity] ||= 0
    session[:cart] ||= []
  end

  def load_cart
    @cart = Item.find(session[:cart])
  end
end
