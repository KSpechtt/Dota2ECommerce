# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  has_many :order_item
  has_many :items, through: :order_item

  validates :status, :cost, presence: true
end
