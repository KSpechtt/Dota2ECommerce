# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders, dependent: :destroy
  belongs_to :province

  validates :full_name, :password, :city, :address, presence: true

  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
end
