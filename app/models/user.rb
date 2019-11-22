# frozen_string_literal: true

class User < ApplicationRecord
  has_many :orders
  belongs_to :province

  validates :full_name, :login_name, :password, :city, :address, :email, presence: true

  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
end
