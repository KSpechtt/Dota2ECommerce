# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.boolean :status
      t.decimal :cost
      t.references :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
