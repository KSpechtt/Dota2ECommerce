# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_191_122_205_919) do
  create_table 'abouts', force: :cascade do |t|
    t.text 'description'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'active_admin_comments', force: :cascade do |t|
    t.string 'namespace'
    t.text 'body'
    t.string 'resource_type'
    t.integer 'resource_id'
    t.string 'author_type'
    t.integer 'author_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[author_type author_id], name: 'index_active_admin_comments_on_author_type_and_author_id'
    t.index ['namespace'], name: 'index_active_admin_comments_on_namespace'
    t.index %w[resource_type resource_id], name: 'index_active_admin_comments_on_resource_type_and_resource_id'
  end

  create_table 'admin_users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['email'], name: 'index_admin_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_admin_users_on_reset_password_token', unique: true
  end

  create_table 'categories', force: :cascade do |t|
    t.string 'category_name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'contacts', force: :cascade do |t|
    t.string 'name'
    t.string 'phone_number'
    t.string 'email'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'items', force: :cascade do |t|
    t.string 'name'
    t.decimal 'cost'
    t.string 'image'
    t.text 'description'
    t.text 'lore'
    t.boolean 'onSale'
    t.integer 'quantity'
    t.integer 'category_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['category_id'], name: 'index_items_on_category_id'
  end

  create_table 'order_items', force: :cascade do |t|
    t.integer 'quantity'
    t.decimal 'cost'
    t.integer 'item_id'
    t.integer 'order_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['item_id'], name: 'index_order_items_on_item_id'
    t.index ['order_id'], name: 'index_order_items_on_order_id'
  end

  create_table 'orders', force: :cascade do |t|
    t.boolean 'status'
    t.decimal 'cost'
    t.integer 'user_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['user_id'], name: 'index_orders_on_user_id'
  end

  create_table 'provinces', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'full_name'
    t.string 'login_name'
    t.string 'password'
    t.string 'city'
    t.string 'address'
    t.integer 'province_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['province_id'], name: 'index_users_on_province_id'
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'items', 'categories'
  add_foreign_key 'order_items', 'items'
  add_foreign_key 'order_items', 'orders'
  add_foreign_key 'orders', 'users'
  add_foreign_key 'users', 'provinces'
end
