# frozen_string_literal: true

class OrderItem < ApplicationRecord
  belongs_to :item
  belongs_to :order

  validates :quantity, :cost, presence: true
end
