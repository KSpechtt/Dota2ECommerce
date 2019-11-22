# frozen_string_literal: true

class CategoriesController < ApplicationController
  def index
    @categories = Category.order(:category_name)
  end

  def show
    @categories = Category.find(params[:id])
    @items = @categories.items.page(params[:page]).per(12)
  end
end
