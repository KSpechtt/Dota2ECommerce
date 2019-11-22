# frozen_string_literal: true

ActiveAdmin.register Item do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :cost, :image, :description, :lore, :onSale, :category_id, :quantity
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :cost, :category, :image, :description, :lore, :onSale]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
