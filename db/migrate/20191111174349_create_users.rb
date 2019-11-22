# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :login_name
      t.string :password
      t.string :city
      t.string :address
      t.string :email
      t.references :province, null: true, foreign_key: true

      t.timestamps
    end
  end
end
