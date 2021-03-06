# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :items, dependent: :destroy

  validates :category_name, presence: true
  validates :category_name, uniqueness: true
end
