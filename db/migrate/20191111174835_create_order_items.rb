# frozen_string_literal: true

class CreateOrderItems < ActiveRecord::Migration[6.0]
  def change
    create_table :order_items do |t|
      t.integer :quantity
      t.decimal :cost
      t.references :item, null: true, foreign_key: true
      t.references :order, null: true, foreign_key: true

      t.timestamps
    end
  end
end
