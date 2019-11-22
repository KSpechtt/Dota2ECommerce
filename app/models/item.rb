# frozen_string_literal: true

class Item < ApplicationRecord
  belongs_to :category
  has_many :order_item
  has_many :orders, through: :order_item

  validates :name, :cost, :image, presence: true
end
