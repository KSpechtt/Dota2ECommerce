# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.decimal :cost
      t.string :image
      t.text :description
      t.text :lore
      t.boolean :onSale
      t.integer :quantity
      # t.references :order, null: true, foreign_key: true
      t.references :category, null: true, foreign_key: true

      t.timestamps
    end
  end
end
