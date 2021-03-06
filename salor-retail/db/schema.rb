# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140617151835) do

  create_table "actions", :force => true do |t|
    t.string   "name"
    t.text     "code"
    t.integer  "vendor_id"
    t.integer  "user_id"
    t.string   "whento"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.string   "behavior"
    t.integer  "weight",     :default => 0
    t.string   "afield"
    t.float    "value",      :default => 0.0
    t.boolean  "hidden"
    t.string   "field2"
    t.float    "value2"
    t.integer  "hidden_by"
    t.datetime "hidden_at"
    t.integer  "company_id"
    t.string   "model_type"
    t.integer  "model_id"
    t.text     "js_code"
    t.integer  "created_by"
  end

  add_index "actions", ["user_id"], :name => "index_actions_on_user_id"
  add_index "actions", ["vendor_id"], :name => "index_actions_on_vendor_id"

  create_table "broken_items", :force => true do |t|
    t.string   "name"
    t.string   "sku"
    t.float    "quantity"
    t.integer  "vendor_id"
    t.integer  "shipper_id"
    t.text     "note"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.boolean  "is_shipment_item"
    t.boolean  "hidden"
    t.integer  "hidden_by"
    t.datetime "hidden_at"
    t.integer  "company_id"
    t.integer  "user_id"
    t.integer  "price_cents",      :default => 0
    t.string   "currency"
  end

  create_table "buttons", :force => true do |t|
    t.string   "name"
    t.string   "sku"
    t.string   "old_category_name"
    t.integer  "weight"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "vendor_id"
    t.boolean  "is_buyback"
    t.integer  "category_id"
    t.string   "color"
    t.integer  "position"
    t.boolean  "hidden"
    t.integer  "hidden_by"
    t.datetime "hidden_at"
    t.integer  "company_id"
    t.integer  "user_id"
  end

  create_table "cash_registers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
    t.integer  "vendor_id"
    t.string   "scale"
    t.boolean  "hidden"
    t.string   "cash_drawer_path"
    t.boolean  "big_buttons"
    t.boolean  "hide_discounts"
    t.boolean  "no_print"
    t.string   "thermal_printer",       :default => "/dev/usb/lp0"
    t.string   "sticker_printer",       :default => "/dev/usb/lp1"
    t.string   "a4_printer"
    t.string   "pole_display"
    t.string   "customer_screen_blurb"
    t.boolean  "salor_printer"
    t.string   "color"
    t.string   "ip"
    t.boolean  "hide_buttons",          :default => true
    t.boolean  "show_plus_minus",       :default => true
    t.boolean  "detailed_edit"
    t.string   "cash_drawer_name"
    t.string   "thermal_printer_name"
    t.string   "sticker_printer_name"
    t.string   "scale_name"
    t.boolean  "always_open_drawer"
    t.string   "pole_display_name"
    t.boolean  "require_password"
    t.string   "locale"
    t.integer  "hidden_by"
    t.datetime "hidden_at"
    t.integer  "company_id"
    t.integer  "user_id"
    t.string   "customerscreen_mode"
  end

  add_index "cash_registers", ["company_id"], :name => "index_cash_registers_on_company_id"
  add_index "cash_registers", ["hidden"], :name => "index_cash_registers_on_hidden"
  add_index "cash_registers", ["vendor_id"], :name => "index_cash_registers_on_vendor_id"

  create_table "categories", :force => true do |t|
    t.integer  "vendor_id"
    t.string   "name"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.float    "quantity_sold",   :default => 0.0
    t.float    "cash_made"
    t.boolean  "button_category"
    t.integer  "position"
    t.string   "color"
    t.string   "sku"
    t.boolean  "hidden"
    t.integer  "hidden_by"
    t.datetime "hidden_at"
    t.integer  "company_id"
    t.integer  "user_id"
  end

  add_index "categories", ["company_id"], :name => "index_categories_on_company_id"
  add_index "categories", ["hidden"], :name => "index_categories_on_hidden"
  add_index "categories", ["vendor_id"], :name => "index_categories_on_vendor_id"

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "identifier"
    t.string   "mode",               :default => "local"
    t.string   "subdomain"
    t.boolean  "hidden"
    t.integer  "hidden_by"
    t.datetime "hidden_at"
    t.boolean  "active",             :default => true
    t.string   "email"
    t.string   "auth_user"
    t.string   "full_subdomain"
    t.string   "full_url"
    t.string   "virtualhost_filter"
    t.integer  "auth_https_mode"
    t.boolean  "https"
    t.boolean  "auth"
    t.string   "domain"
    t.boolean  "removal_pending"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
  end

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.integer  "vendor_id"
    t.integer  "user_id"
    t.boolean  "hidden"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "hidden_by"
    t.datetime "hidden_at"
    t.integer  "company_id"
  end

  create_table "cues", :force => true do |t|
    t.boolean  "is_handled",      :default => false
    t.boolean  "to_send",         :default => false
    t.boolean  "to_receive",      :default => false
    t.text     "payload"
    t.string   "url"
    t.string   "source_sku"
    t.string   "destination_sku"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.boolean  "hidden"
    t.integer  "hidden_by"
    t.datetime "hidden_at"
    t.integer  "vendor_id"
    t.integer  "company_id"
    t.integer  "user_id"
  end

  create_table "customers", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "street1"
    t.string   "street2"
    t.string   "postalcode"
    t.string   "state"
    t.string   "country"
    t.string   "city"
    t.string   "telephone"
    t.string   "cellphone"
    t.string   "email"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "vendor_id"
    t.string   "company_name"
    t.string   "sku"
    t.boolean  "hidden"
    t.integer  "hidden_by"
    t.string   "tax_number"
    t.datetime "hidden_at"
    t.integer  "company_id"
    t.integer  "user_id"
  end

  add_index "customers", ["company_id"], :name => "index_customers_on_company_id"
  add_index "customers", ["hidden"], :name => "index_customers_on_hidden"
  add_index "customers", ["vendor_id"], :name => "index_customers_on_vendor_id"

  create_table "discounts", :force => true do |t|
    t.string   "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "vendor_id"
    t.integer  "category_id"
    t.integer  "location_id"
    t.string   "item_sku"
    t.string   "applies_to"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.float    "amount"
    t.string   "amount_type"
    t.boolean  "hidden"
    t.string   "sku"
    t.integer  "hidden_by"
    t.datetime "hidden_at"
    t.integer  "company_id"
    t.integer  "user_id"
  end

  add_index "discounts", ["amount_type"], :name => "index_discounts_on_amount_type"
  add_index "discounts", ["applies_to"], :name => "index_discounts_on_applies_to"
  add_index "discounts", ["category_id"], :name => "index_discounts_on_category_id"
  add_index "discounts", ["company_id"], :name => "index_discounts_on_company_id"
  add_index "discounts", ["hidden"], :name => "index_discounts_on_hidden"
  add_index "discounts", ["item_sku"], :name => "index_discounts_on_item_sku"
  add_index "discounts", ["location_id"], :name => "index_discounts_on_location_id"
  add_index "discounts", ["sku"], :name => "index_discounts_on_sku"
  add_index "discounts", ["vendor_id"], :name => "index_discounts_on_vendor_id"

  create_table "discounts_order_items", :id => false, :force => true do |t|
    t.integer "order_item_id"
    t.integer "discount_id"
  end

  add_index "discounts_order_items", ["order_item_id", "discount_id"], :name => "index_discounts_order_items_on_order_item_id_and_discount_id"

  create_table "drawer_transactions", :force => true do |t|
    t.integer  "drawer_id"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.text     "notes"
    t.boolean  "refund"
    t.string   "tag"
    t.integer  "cash_register_id"
    t.integer  "order_id"
    t.integer  "order_item_id"
    t.integer  "vendor_id"
    t.boolean  "hidden"
    t.integer  "hidden_by"
    t.datetime "hidden_at"
    t.integer  "company_id"
    t.integer  "user_id"
    t.boolean  "complete_order"
    t.integer  "nr"
    t.integer  "amount_cents",        :default => 0
    t.integer  "drawer_amount_cents", :default => 0
    t.string   "currency"
  end

  add_index "drawer_transactions", ["company_id"], :name => "index_drawer_transactions_on_company_id"
  add_index "drawer_transactions", ["complete_order"], :name => "index_drawer_transactions_on_complete_order"
  add_index "drawer_transactions", ["created_at"], :name => "index_drawer_transactions_on_created_at"
  add_index "drawer_transactions", ["drawer_id"], :name => "index_drawer_transactions_on_drawer_id"
  add_index "drawer_transactions", ["hidden"], :name => "index_drawer_transactions_on_hidden"
  add_index "drawer_transactions", ["refund"], :name => "index_drawer_transactions_on_refund"
  add_index "drawer_transactions", ["user_id"], :name => "index_drawer_transactions_on_user_id"
  add_index "drawer_transactions", ["vendor_id"], :name => "index_drawer_transactions_on_vendor_id"

  create_table "drawers", :force => true do |t|
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.boolean  "hidden"
    t.integer  "hidden_by"
    t.datetime "hidden_at"
    t.integer  "vendor_id"
    t.integer  "company_id"
    t.integer  "amount_cents", :default => 0
    t.string   "currency"
  end

  create_table "emails", :force => true do |t|
    t.string   "sender"
    t.string   "receipient"
    t.string   "subject"
    t.text     "body"
    t.boolean  "technician"
    t.integer  "vendor_id"
    t.integer  "company_id"
    t.integer  "user_id"
    t.integer  "model_id"
    t.integer  "model_type"
    t.boolean  "hidden"
    t.integer  "hidden_by"
    t.datetime "hidden_at"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "histories", :force => true do |t|
    t.string   "url"
    t.string   "action_taken"
    t.string   "model_type"
    t.string   "ip"
    t.integer  "sensitivity"
    t.integer  "model_id"
    t.text     "changes_made"
    t.text     "params"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.boolean  "hidden"
    t.integer  "hidden_by"
    t.datetime "hidden_at"
    t.integer  "vendor_id"
    t.integer  "company_id"
    t.integer  "user_id"
  end

  create_table "images", :force => true do |t|
    t.string   "name"
    t.string   "imageable_type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "imageable_id"
    t.integer  "company_id"
    t.integer  "vendor_id"
    t.string   "image_type"
    t.boolean  "hidden"
    t.integer  "hidden_by"
    t.datetime "hidden_at"
  end

  create_table "inventory_report_items", :force => true do |t|
    t.integer  "inventory_report_id"
    t.integer  "item_id"
    t.float    "real_quantity"
    t.float    "quantity"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "vendor_id"
    t.boolean  "hidden"
    t.integer  "hidden_by"
    t.datetime "hidden_at"
    t.integer  "company_id"
    t.integer  "user_id"
    t.integer  "category_id"
    t.integer  "purchase_price_cents"
    t.integer  "price_cents"
    t.string   "name"
    t.string   "sku"
    t.string   "currency"
  end

  add_index "inventory_report_items", ["inventory_report_id"], :name => "index_inventory_report_items_on_inventory_report_id"
  add_index "inventory_report_items", ["item_id"], :name => "index_inventory_report_items_on_item_id"
  add_index "inventory_report_items", ["vendor_id"], :name => "index_inventory_report_items_on_vendor_id"

  create_table "inventory_reports", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "vendor_id"
    t.boolean  "hidden"
    t.integer  "hidden_by"
    t.datetime "hidden_at"
    t.integer  "company_id"
    t.integer  "user_id"
  end

  add_index "inventory_reports", ["vendor_id"], :name => "index_inventory_reports_on_vendor_id"

  create_table "invoice_blurbs", :force => true do |t|
    t.string   "lang"
    t.text     "body"
    t.boolean  "is_header"
    t.integer  "vendor_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.text     "body_receipt"
    t.boolean  "hidden"
    t.integer  "hidden_by"
    t.datetime "hidden_at"
    t.integer  "company_id"
    t.integer  "user_id"
  end

  create_table "invoice_notes", :force => true do |t|
    t.string   "name"
    t.text     "note_header"
    t.text     "note_footer"
    t.integer  "origin_country_id"
    t.integer  "destination_country_id"
    t.integer  "vendor_id"
    t.integer  "user_id"
    t.boolean  "hidden"
    t.integer  "sale_type_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.integer  "hidden_by"
    t.datetime "hidden_at"
    t.integer  "company_id"
  end

  create_table "item_shippers", :force => true do |t|
    t.integer  "shipper_id"
    t.integer  "item_id"
    t.float    "purchase_price"
    t.float    "list_price"
    t.string   "item_sku"
    t.string   "shipper_sku"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.boolean  "hidden"
    t.integer  "hidden_by"
    t.datetime "hidden_at"
    t.integer  "vendor_id"
    t.integer  "company_id"
    t.integer  "user_id"
  end

  add_index "item_shippers", ["company_id"], :name => "index_item_shippers_on_company_id"
  add_index "item_shippers", ["hidden"], :name => "index_item_shippers_on_hidden"
  add_index "item_shippers", ["item_id"], :name => "index_item_shippers_on_item_id"
  add_index "item_shippers", ["shipper_id"], :name => "index_item_shippers_on_shipper_id"
  add_index "item_shippers", ["vendor_id"], :name => "index_item_shippers_on_vendor_id"

  create_table "item_stocks", :force => true do |t|
    t.integer  "item_id"
    t.float    "quantity",      :default => 0.0
    t.integer  "location_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.integer  "vendor_id"
    t.boolean  "hidden"
    t.integer  "hidden_by"
    t.datetime "hidden_at"
    t.integer  "company_id"
    t.integer  "user_id"
    t.string   "location_type"
  end

  add_index "item_stocks", ["company_id"], :name => "index_item_stocks_on_company_id"
  add_index "item_stocks", ["hidden"], :name => "index_item_stocks_on_hidden"
  add_index "item_stocks", ["item_id"], :name => "index_item_stocks_on_item_id"
  add_index "item_stocks", ["location_id"], :name => "index_item_stocks_on_location_id"
  add_index "item_stocks", ["vendor_id"], :name => "index_item_stocks_on_vendor_id"

  create_table "item_types", :force => true do |t|
    t.string   "name"
    t.string   "behavior"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "vendor_id"
    t.boolean  "hidden"
    t.integer  "hidden_by"
    t.datetime "hidden_at"
    t.integer  "company_id"
    t.integer  "user_id"
  end

  create_table "items", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "sku"
    t.string   "image"
    t.integer  "vendor_id"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
    t.integer  "location_id"
    t.integer  "category_id"
    t.integer  "tax_profile_id"
    t.integer  "item_type_id"
    t.boolean  "activated"
    t.integer  "void"
    t.integer  "coupon_type"
    t.string   "coupon_applies"
    t.float    "quantity",                 :default => 0.0
    t.float    "quantity_sold",            :default => 0.0
    t.boolean  "hidden"
    t.integer  "part_id"
    t.boolean  "calculate_part_price"
    t.float    "height",                   :default => 0.0
    t.float    "weight",                   :default => 0.0
    t.string   "height_metric"
    t.string   "weight_metric",            :default => "g"
    t.float    "length",                   :default => 0.0
    t.float    "width",                    :default => 0.0
    t.string   "length_metric"
    t.string   "width_metric"
    t.boolean  "is_part"
    t.boolean  "is_gs1"
    t.boolean  "price_by_qty"
    t.float    "part_quantity",            :default => 0.0
    t.string   "behavior"
    t.string   "sales_metric"
    t.date     "expires_on"
    t.integer  "quantity_buyback",         :default => 0
    t.boolean  "default_buyback"
    t.float    "real_quantity",            :default => 0.0
    t.boolean  "weigh_compulsory"
    t.float    "min_quantity",             :default => 0.0
    t.boolean  "active",                   :default => true
    t.integer  "shipper_id"
    t.string   "shipper_sku"
    t.float    "packaging_unit",           :default => 1.0
    t.boolean  "ignore_qty"
    t.integer  "child_id"
    t.boolean  "must_change_price"
    t.boolean  "hidden_by_distiller"
    t.boolean  "track_expiry"
    t.string   "customs_code"
    t.string   "origin_country"
    t.text     "name_translations"
    t.integer  "hidden_by"
    t.boolean  "real_quantity_updated"
    t.datetime "hidden_at"
    t.integer  "company_id"
    t.integer  "user_id"
    t.string   "gs1_format",               :default => "2,3"
    t.integer  "price_cents",              :default => 0
    t.integer  "gift_card_amount_cents",   :default => 0
    t.integer  "purchase_price_cents",     :default => 0
    t.integer  "buy_price_cents",          :default => 0
    t.integer  "manufacturer_price_cents", :default => 0
    t.string   "currency"
    t.integer  "created_by"
    t.string   "longname"
    t.string   "shortname"
  end

  add_index "items", ["category_id"], :name => "index_items_on_category_id"
  add_index "items", ["child_id"], :name => "index_items_on_child_id"
  add_index "items", ["company_id"], :name => "index_items_on_company_id"
  add_index "items", ["coupon_applies"], :name => "index_items_on_coupon_applies"
  add_index "items", ["coupon_type"], :name => "index_items_on_coupon_type"
  add_index "items", ["hidden"], :name => "index_items_on_hidden"
  add_index "items", ["item_type_id"], :name => "index_items_on_item_type_id"
  add_index "items", ["location_id"], :name => "index_items_on_location_id"
  add_index "items", ["name"], :name => "index_items_on_name"
  add_index "items", ["part_id"], :name => "index_items_on_part_id"
  add_index "items", ["sku"], :name => "index_items_on_sku"
  add_index "items", ["tax_profile_id"], :name => "index_items_on_tax_profile_id"
  add_index "items", ["vendor_id"], :name => "index_items_on_vendor_id"

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.float    "x"
    t.float    "y"
    t.string   "shape"
    t.integer  "vendor_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.string   "applies_to"
    t.float    "quantity_sold", :default => 0.0
    t.float    "cash_made",     :default => 0.0
    t.boolean  "hidden"
    t.string   "sku",           :default => ""
    t.integer  "hidden_by"
    t.datetime "hidden_at"
    t.integer  "company_id"
    t.integer  "user_id"
  end

  add_index "locations", ["company_id"], :name => "index_locations_on_company_id"
  add_index "locations", ["hidden"], :name => "index_locations_on_hidden"
  add_index "locations", ["vendor_id"], :name => "index_locations_on_vendor_id"

  create_table "loyalty_cards", :force => true do |t|
    t.integer  "points"
    t.integer  "num_swipes"
    t.integer  "num_used"
    t.integer  "customer_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "sku"
    t.string   "customer_sku"
    t.boolean  "hidden"
    t.integer  "vendor_id"
    t.integer  "hidden_by"
    t.datetime "hidden_at"
    t.integer  "company_id"
    t.integer  "user_id"
  end

  add_index "loyalty_cards", ["company_id"], :name => "index_loyalty_cards_on_company_id"
  add_index "loyalty_cards", ["customer_id"], :name => "index_loyalty_cards_on_customer_id"
  add_index "loyalty_cards", ["hidden"], :name => "index_loyalty_cards_on_hidden"
  add_index "loyalty_cards", ["sku"], :name => "index_loyalty_cards_on_sku"
  add_index "loyalty_cards", ["vendor_id"], :name => "index_loyalty_cards_on_vendor_id"

  create_table "node_messages", :force => true do |t|
    t.string   "source_sku"
    t.string   "dest_sku"
    t.string   "mdhash"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "hidden"
    t.integer  "hidden_by"
    t.datetime "hidden_at"
    t.integer  "vendor_id"
    t.integer  "company_id"
    t.integer  "user_id"
  end

  create_table "node_queues", :force => true do |t|
    t.boolean  "handled",         :default => false
    t.boolean  "send",            :default => false
    t.boolean  "receive",         :default => false
    t.text     "payload"
    t.string   "url"
    t.string   "source_sku"
    t.string   "destination_sku"
    t.integer  "owner_ir"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.boolean  "hidden"
    t.integer  "hidden_by"
    t.datetime "hidden_at"
    t.integer  "vendor_id"
    t.integer  "company_id"
    t.integer  "user_id"
  end

  create_table "nodes", :force => true do |t|
    t.string   "name"
    t.string   "sku"
    t.string   "token"
    t.string   "node_type"
    t.string   "url"
    t.boolean  "is_self"
    t.text     "accepted_ips"
    t.integer  "vendor_id"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.string   "status"
    t.boolean  "is_busy",               :default => false
    t.boolean  "hidden"
    t.boolean  "accepts_tax_profiles",  :default => true
    t.boolean  "accepts_buttons",       :default => true
    t.boolean  "accepts_categories",    :default => true
    t.boolean  "accepts_items",         :default => true
    t.boolean  "accepts_customers",     :default => true
    t.boolean  "accepts_loyalty_cards", :default => true
    t.boolean  "accepts_discounts",     :default => true
    t.integer  "hidden_by"
    t.datetime "hidden_at"
    t.integer  "company_id"
    t.integer  "user_id"
  end

  create_table "notes", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "notable_id"
    t.string   "notable_type"
    t.integer  "user_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.boolean  "hidden"
    t.integer  "hidden_by"
    t.datetime "hidden_at"
    t.integer  "vendor_id"
    t.integer  "company_id"
  end

  add_index "notes", ["notable_id"], :name => "index_notes_on_notable_id"
  add_index "notes", ["user_id"], :name => "index_notes_on_user_id"

  create_table "order_items", :force => true do |t|
    t.integer  "order_id"
    t.integer  "item_id"
    t.float    "quantity"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.integer  "tax_profile_id"
    t.integer  "item_type_id"
    t.boolean  "activated"
    t.string   "behavior"
    t.float    "tax"
    t.integer  "category_id"
    t.integer  "location_id"
    t.boolean  "refunded"
    t.datetime "refunded_at"
    t.integer  "refunded_by"
    t.float    "rebate"
    t.integer  "coupon_id"
    t.boolean  "is_buyback"
    t.string   "sku"
    t.boolean  "weigh_compulsory"
    t.boolean  "no_inc"
    t.boolean  "action_applied"
    t.boolean  "hidden"
    t.integer  "vendor_id"
    t.integer  "hidden_by"
    t.datetime "hidden_at"
    t.integer  "company_id"
    t.integer  "user_id"
    t.float    "discount"
    t.boolean  "calculate_part_price"
    t.integer  "drawer_id"
    t.integer  "price_cents",                   :default => 0
    t.integer  "gift_card_amount_cents",        :default => 0
    t.integer  "tax_amount_cents",              :default => 0
    t.integer  "coupon_amount_cents",           :default => 0
    t.integer  "discount_amount_cents",         :default => 0
    t.integer  "rebate_amount_cents",           :default => 0
    t.integer  "total_cents",                   :default => 0
    t.datetime "completed_at"
    t.string   "currency"
    t.boolean  "is_proforma"
    t.boolean  "is_quote"
    t.boolean  "is_unpaid"
    t.boolean  "paid"
    t.datetime "paid_at"
    t.integer  "refund_payment_method_item_id"
  end

  add_index "order_items", ["activated"], :name => "index_order_items_on_activated"
  add_index "order_items", ["behavior"], :name => "index_order_items_on_behavior"
  add_index "order_items", ["category_id"], :name => "index_order_items_on_category_id"
  add_index "order_items", ["company_id"], :name => "index_order_items_on_company_id"
  add_index "order_items", ["completed_at"], :name => "index_order_items_on_completed_at"
  add_index "order_items", ["coupon_id"], :name => "index_order_items_on_coupon_id"
  add_index "order_items", ["drawer_id"], :name => "index_order_items_on_drawer_id"
  add_index "order_items", ["hidden"], :name => "index_order_items_on_hidden"
  add_index "order_items", ["is_buyback"], :name => "index_order_items_on_is_buyback"
  add_index "order_items", ["is_proforma"], :name => "index_order_items_on_is_proforma"
  add_index "order_items", ["is_quote"], :name => "index_order_items_on_is_quote"
  add_index "order_items", ["item_id"], :name => "index_order_items_on_item_id"
  add_index "order_items", ["item_type_id"], :name => "index_order_items_on_item_type_id"
  add_index "order_items", ["location_id"], :name => "index_order_items_on_location_id"
  add_index "order_items", ["no_inc"], :name => "index_order_items_on_no_inc"
  add_index "order_items", ["order_id"], :name => "index_order_items_on_order_id"
  add_index "order_items", ["refunded"], :name => "index_order_items_on_refunded"
  add_index "order_items", ["sku"], :name => "index_order_items_on_sku"
  add_index "order_items", ["tax"], :name => "index_order_items_on_tax"
  add_index "order_items", ["tax_profile_id"], :name => "index_order_items_on_tax_profile_id"
  add_index "order_items", ["total_cents"], :name => "index_order_items_on_total_cents"
  add_index "order_items", ["user_id"], :name => "index_order_items_on_user_id"
  add_index "order_items", ["vendor_id"], :name => "index_order_items_on_vendor_id"

  create_table "orders", :force => true do |t|
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.integer  "vendor_id"
    t.integer  "user_id"
    t.integer  "location_id"
    t.boolean  "paid"
    t.boolean  "hidden"
    t.integer  "cash_register_id"
    t.integer  "customer_id"
    t.float    "rebate"
    t.integer  "lc_points"
    t.string   "tag"
    t.boolean  "buy_order"
    t.boolean  "was_printed"
    t.string   "sku"
    t.integer  "drawer_id"
    t.integer  "origin_country_id"
    t.integer  "destination_country_id"
    t.integer  "sale_type_id"
    t.text     "invoice_comment"
    t.text     "delivery_note_comment"
    t.integer  "nr"
    t.boolean  "is_proforma"
    t.integer  "hidden_by"
    t.boolean  "is_unpaid"
    t.integer  "qnr"
    t.boolean  "is_quote"
    t.datetime "hidden_at"
    t.integer  "company_id"
    t.datetime "paid_at"
    t.float    "tax"
    t.integer  "tax_profile_id"
    t.integer  "total_cents",            :default => 0
    t.integer  "tax_amount_cents",       :default => 0
    t.integer  "cash_cents",             :default => 0
    t.integer  "lc_amount_cents",        :default => 0
    t.integer  "change_cents",           :default => 0
    t.integer  "payment_total_cents",    :default => 0
    t.integer  "noncash_cents",          :default => 0
    t.integer  "rebate_amount_cents",    :default => 0
    t.datetime "completed_at"
    t.string   "currency"
    t.integer  "proforma_order_id"
    t.datetime "payment_due"
    t.boolean  "subscription"
    t.integer  "subscription_interval"
    t.integer  "subscription_order_id"
    t.datetime "subscription_start"
    t.datetime "subscription_next"
    t.datetime "subscription_last"
  end

  add_index "orders", ["cash_register_id"], :name => "index_orders_on_cash_register_id"
  add_index "orders", ["company_id"], :name => "index_orders_on_company_id"
  add_index "orders", ["customer_id"], :name => "index_orders_on_customer_id"
  add_index "orders", ["drawer_id"], :name => "index_orders_on_drawer_id"
  add_index "orders", ["hidden"], :name => "index_orders_on_hidden"
  add_index "orders", ["location_id"], :name => "index_orders_on_location_id"
  add_index "orders", ["paid"], :name => "index_orders_on_paid"
  add_index "orders", ["user_id"], :name => "index_orders_on_user_id"
  add_index "orders", ["vendor_id"], :name => "index_orders_on_vendor_id"

  create_table "payment_method_items", :force => true do |t|
    t.integer  "order_id"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.integer  "vendor_id"
    t.boolean  "hidden"
    t.integer  "hidden_by"
    t.datetime "hidden_at"
    t.integer  "company_id"
    t.integer  "user_id"
    t.integer  "drawer_id"
    t.integer  "payment_method_id"
    t.boolean  "cash"
    t.boolean  "change"
    t.integer  "cash_register_id"
    t.boolean  "unpaid"
    t.boolean  "quote"
    t.boolean  "refund"
    t.integer  "amount_cents",      :default => 0
    t.string   "currency"
    t.integer  "order_item_id"
    t.boolean  "is_proforma"
    t.boolean  "is_quote"
    t.boolean  "is_unpaid"
    t.boolean  "paid"
    t.datetime "paid_at"
    t.datetime "completed_at"
  end

  add_index "payment_method_items", ["cash"], :name => "index_payment_method_items_on_cash"
  add_index "payment_method_items", ["cash_register_id"], :name => "index_payment_method_items_on_cash_register_id"
  add_index "payment_method_items", ["change"], :name => "index_payment_method_items_on_change"
  add_index "payment_method_items", ["company_id"], :name => "index_payment_method_items_on_company_id"
  add_index "payment_method_items", ["completed_at"], :name => "index_payment_method_items_on_completed_at"
  add_index "payment_method_items", ["drawer_id"], :name => "index_payment_method_items_on_drawer_id"
  add_index "payment_method_items", ["hidden"], :name => "index_payment_method_items_on_hidden"
  add_index "payment_method_items", ["is_proforma"], :name => "index_payment_method_items_on_is_proforma"
  add_index "payment_method_items", ["is_quote"], :name => "index_payment_method_items_on_is_quote"
  add_index "payment_method_items", ["order_id"], :name => "index_payment_methods_on_order_id"
  add_index "payment_method_items", ["payment_method_id"], :name => "index_payment_method_items_on_payment_method_id"
  add_index "payment_method_items", ["refund"], :name => "index_payment_method_items_on_refund"
  add_index "payment_method_items", ["user_id"], :name => "index_payment_method_items_on_user_id"
  add_index "payment_method_items", ["vendor_id"], :name => "index_payment_method_items_on_vendor_id"

  create_table "payment_methods", :force => true do |t|
    t.string   "name"
    t.string   "internal_type"
    t.integer  "vendor_id"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.integer  "hidden",        :default => 0
    t.integer  "hidden_by"
    t.boolean  "cash"
    t.boolean  "change"
    t.boolean  "unpaid"
    t.boolean  "quote"
    t.integer  "position"
    t.integer  "company_id"
    t.datetime "hidden_at"
  end

  create_table "plugins", :force => true do |t|
    t.string   "name"
    t.string   "filename"
    t.string   "base_path"
    t.integer  "company_id"
    t.integer  "vendor_id"
    t.boolean  "hidden"
    t.integer  "hidden_by"
    t.datetime "hidden_at"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.text     "files"
    t.text     "meta"
  end

  add_index "plugins", ["company_id"], :name => "index_plugins_on_company_id"
  add_index "plugins", ["hidden_by"], :name => "index_plugins_on_hidden_by"
  add_index "plugins", ["vendor_id"], :name => "index_plugins_on_vendor_id"

  create_table "receipts", :force => true do |t|
    t.string   "ip"
    t.integer  "cash_register_id"
    t.binary   "content"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "vendor_id"
    t.integer  "order_id"
    t.boolean  "hidden"
    t.integer  "hidden_by"
    t.datetime "hidden_at"
    t.integer  "company_id"
    t.integer  "user_id"
    t.integer  "drawer_id"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "hidden"
    t.integer  "hidden_by"
    t.datetime "hidden_at"
    t.integer  "vendor_id"
    t.integer  "company_id"
    t.integer  "user_id"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  create_table "sale_types", :force => true do |t|
    t.string   "name"
    t.integer  "vendor_id"
    t.integer  "user_id"
    t.boolean  "hidden"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "hidden_by"
    t.datetime "hidden_at"
    t.integer  "company_id"
  end

  create_table "shipment_items", :force => true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.integer  "location_id"
    t.integer  "item_type_id"
    t.string   "sku"
    t.integer  "shipment_id"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.boolean  "in_stock"
    t.float    "quantity"
    t.boolean  "hidden"
    t.integer  "hidden_by"
    t.integer  "vendor_id"
    t.datetime "hidden_at"
    t.integer  "company_id"
    t.integer  "user_id"
    t.integer  "price_cents",                :default => 0
    t.integer  "purchase_price_cents",       :default => 0
    t.string   "currency"
    t.integer  "total_cents"
    t.integer  "purchase_price_total_cents"
    t.integer  "tax_profile_id"
    t.float    "in_stock_quantity"
  end

  add_index "shipment_items", ["category_id"], :name => "index_shipment_items_on_category_id"
  add_index "shipment_items", ["company_id"], :name => "index_shipment_items_on_company_id"
  add_index "shipment_items", ["hidden"], :name => "index_shipment_items_on_hidden"
  add_index "shipment_items", ["item_type_id"], :name => "index_shipment_items_on_item_type_id"
  add_index "shipment_items", ["location_id"], :name => "index_shipment_items_on_location_id"
  add_index "shipment_items", ["shipment_id"], :name => "index_shipment_items_on_shipment_id"
  add_index "shipment_items", ["vendor_id"], :name => "index_shipment_items_on_vendor_id"

  create_table "shipment_items_stock_locations", :id => false, :force => true do |t|
    t.integer "shipment_item_id"
    t.integer "stock_location_id"
  end

  add_index "shipment_items_stock_locations", ["shipment_item_id", "stock_location_id"], :name => "shipment_items_stock"

  create_table "shipment_types", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "hidden"
    t.integer  "vendor_id"
    t.integer  "hidden_by"
    t.datetime "hidden_at"
    t.integer  "company_id"
  end

  add_index "shipment_types", ["name"], :name => "index_shipment_types_on_name"
  add_index "shipment_types", ["user_id"], :name => "index_shipment_types_on_user_id"

  create_table "shipments", :force => true do |t|
    t.string   "receiver_id"
    t.string   "shipper_id"
    t.string   "shipper_type"
    t.string   "receiver_type"
    t.boolean  "paid"
    t.integer  "user_id"
    t.string   "status"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "name"
    t.integer  "vendor_id"
    t.boolean  "hidden"
    t.integer  "shipment_type_id"
    t.string   "sku"
    t.integer  "hidden_by"
    t.datetime "hidden_at"
    t.integer  "company_id"
    t.integer  "price_cents",                :default => 0
    t.string   "currency"
    t.integer  "total_cents"
    t.integer  "purchase_price_total_cents"
  end

  add_index "shipments", ["company_id"], :name => "index_shipments_on_company_id"
  add_index "shipments", ["hidden"], :name => "index_shipments_on_hidden"
  add_index "shipments", ["receiver_id"], :name => "index_shipments_on_receiver_id"
  add_index "shipments", ["shipper_id"], :name => "index_shipments_on_shipper_id"
  add_index "shipments", ["user_id"], :name => "index_shipments_on_user_id"
  add_index "shipments", ["vendor_id"], :name => "index_shipments_on_vendor_id"

  create_table "shippers", :force => true do |t|
    t.string   "name"
    t.string   "contact_person"
    t.string   "contact_phone"
    t.string   "contact_fax"
    t.string   "contact_email"
    t.integer  "user_id"
    t.text     "contact_address"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.boolean  "hidden"
    t.string   "reorder_type"
    t.string   "sku"
    t.integer  "vendor_id"
    t.integer  "hidden_by"
    t.datetime "hidden_at"
    t.integer  "company_id"
    t.string   "import_format"
    t.string   "csv_url"
  end

  add_index "shippers", ["user_id"], :name => "index_shippers_on_user_id"

  create_table "spree_activators", :force => true do |t|
    t.string   "description"
    t.datetime "expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "starts_at"
    t.string   "name"
    t.string   "event_name"
    t.string   "type"
    t.integer  "usage_limit"
    t.string   "match_policy", :default => "all"
    t.string   "code"
    t.boolean  "advertise",    :default => false
    t.string   "path"
  end

  create_table "spree_addresses", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "zipcode"
    t.string   "phone"
    t.string   "state_name"
    t.string   "alternative_phone"
    t.integer  "state_id"
    t.integer  "country_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "company"
  end

  add_index "spree_addresses", ["firstname"], :name => "index_addresses_on_firstname"
  add_index "spree_addresses", ["lastname"], :name => "index_addresses_on_lastname"

  create_table "spree_adjustments", :force => true do |t|
    t.integer  "source_id"
    t.decimal  "amount",          :precision => 8, :scale => 2
    t.string   "label"
    t.string   "source_type"
    t.integer  "adjustable_id"
    t.datetime "created_at",                                                      :null => false
    t.datetime "updated_at",                                                      :null => false
    t.boolean  "mandatory"
    t.boolean  "locked"
    t.integer  "originator_id"
    t.string   "originator_type"
    t.boolean  "eligible",                                      :default => true
    t.string   "adjustable_type"
  end

  add_index "spree_adjustments", ["adjustable_id"], :name => "index_adjustments_on_order_id"

  create_table "spree_assets", :force => true do |t|
    t.integer  "viewable_id"
    t.integer  "attachment_width"
    t.integer  "attachment_height"
    t.integer  "attachment_file_size"
    t.integer  "position"
    t.string   "viewable_type",           :limit => 50
    t.string   "attachment_content_type"
    t.string   "attachment_file_name"
    t.string   "type",                    :limit => 75
    t.datetime "attachment_updated_at"
    t.text     "alt"
  end

  add_index "spree_assets", ["viewable_id"], :name => "index_assets_on_viewable_id"
  add_index "spree_assets", ["viewable_type", "type"], :name => "index_assets_on_viewable_type_and_type"

  create_table "spree_calculators", :force => true do |t|
    t.string   "type"
    t.integer  "calculable_id",   :null => false
    t.string   "calculable_type", :null => false
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "spree_configurations", :force => true do |t|
    t.string   "name"
    t.string   "type",       :limit => 50
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "spree_configurations", ["name", "type"], :name => "index_spree_configurations_on_name_and_type"

  create_table "spree_contents", :force => true do |t|
    t.integer  "page_id"
    t.string   "title"
    t.text     "body"
    t.string   "link"
    t.string   "link_text"
    t.string   "context"
    t.boolean  "hide_title",              :default => false
    t.integer  "position",                :default => 999
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "spree_countries", :force => true do |t|
    t.string  "iso_name"
    t.string  "iso"
    t.string  "iso3"
    t.string  "name"
    t.integer "numcode"
  end

  create_table "spree_credit_cards", :force => true do |t|
    t.string   "month"
    t.string   "year"
    t.string   "cc_type"
    t.string   "last_digits"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "start_month"
    t.string   "start_year"
    t.string   "issue_number"
    t.integer  "address_id"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.string   "gateway_customer_profile_id"
    t.string   "gateway_payment_profile_id"
  end

  create_table "spree_gateways", :force => true do |t|
    t.string   "type"
    t.string   "name"
    t.text     "description"
    t.boolean  "active",      :default => true
    t.string   "environment", :default => "development"
    t.string   "server",      :default => "test"
    t.boolean  "test_mode",   :default => true
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  create_table "spree_inventory_units", :force => true do |t|
    t.integer  "lock_version",            :default => 0
    t.string   "state"
    t.integer  "variant_id"
    t.integer  "order_id"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "shipment_id"
    t.integer  "return_authorization_id"
  end

  add_index "spree_inventory_units", ["order_id"], :name => "index_inventory_units_on_order_id"
  add_index "spree_inventory_units", ["shipment_id"], :name => "index_inventory_units_on_shipment_id"
  add_index "spree_inventory_units", ["variant_id"], :name => "index_inventory_units_on_variant_id"

  create_table "spree_line_items", :force => true do |t|
    t.integer  "order_id"
    t.integer  "variant_id"
    t.integer  "quantity",                                 :null => false
    t.decimal  "price",      :precision => 8, :scale => 2, :null => false
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  add_index "spree_line_items", ["order_id"], :name => "index_spree_line_items_on_order_id"
  add_index "spree_line_items", ["variant_id"], :name => "index_spree_line_items_on_variant_id"

  create_table "spree_log_entries", :force => true do |t|
    t.integer  "source_id"
    t.string   "source_type"
    t.text     "details"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "spree_mail_methods", :force => true do |t|
    t.string   "environment"
    t.boolean  "active",      :default => true
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "spree_option_types", :force => true do |t|
    t.string   "name",         :limit => 100
    t.string   "presentation", :limit => 100
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.integer  "position",                    :default => 0, :null => false
  end

  create_table "spree_option_types_prototypes", :id => false, :force => true do |t|
    t.integer "prototype_id"
    t.integer "option_type_id"
  end

  create_table "spree_option_values", :force => true do |t|
    t.integer  "position"
    t.string   "name"
    t.string   "presentation"
    t.integer  "option_type_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "spree_option_values_variants", :id => false, :force => true do |t|
    t.integer "variant_id"
    t.integer "option_value_id"
  end

  add_index "spree_option_values_variants", ["variant_id", "option_value_id"], :name => "index_option_values_variants_on_variant_id_and_option_value_id"
  add_index "spree_option_values_variants", ["variant_id"], :name => "index_spree_option_values_variants_on_variant_id"

  create_table "spree_orders", :force => true do |t|
    t.string   "number",               :limit => 15
    t.decimal  "item_total",                         :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.decimal  "total",                              :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.string   "state"
    t.decimal  "adjustment_total",                   :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.integer  "user_id"
    t.datetime "created_at",                                                                        :null => false
    t.datetime "updated_at",                                                                        :null => false
    t.datetime "completed_at"
    t.integer  "bill_address_id"
    t.integer  "ship_address_id"
    t.decimal  "payment_total",                      :precision => 8, :scale => 2, :default => 0.0
    t.integer  "shipping_method_id"
    t.string   "shipment_state"
    t.string   "payment_state"
    t.string   "email"
    t.text     "special_instructions"
  end

  add_index "spree_orders", ["number"], :name => "index_spree_orders_on_number"

  create_table "spree_pages", :force => true do |t|
    t.string   "title"
    t.string   "nav_title"
    t.string   "path"
    t.string   "meta_title"
    t.string   "meta_description"
    t.string   "meta_keywords"
    t.integer  "position",         :default => 999
    t.boolean  "accessible",       :default => true
    t.boolean  "visible",          :default => true
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  create_table "spree_payment_methods", :force => true do |t|
    t.string   "type"
    t.string   "name"
    t.text     "description"
    t.boolean  "active",      :default => true
    t.string   "environment", :default => "development"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.datetime "deleted_at"
    t.string   "display_on"
  end

  create_table "spree_payments", :force => true do |t|
    t.decimal  "amount",            :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.integer  "order_id"
    t.datetime "created_at",                                                       :null => false
    t.datetime "updated_at",                                                       :null => false
    t.integer  "source_id"
    t.string   "source_type"
    t.integer  "payment_method_id"
    t.string   "state"
    t.string   "response_code"
    t.string   "avs_response"
  end

  create_table "spree_paypal_accounts", :force => true do |t|
    t.string "email"
    t.string "payer_id"
    t.string "payer_country"
    t.string "payer_status"
  end

  create_table "spree_pending_promotions", :force => true do |t|
    t.integer "user_id"
    t.integer "promotion_id"
  end

  add_index "spree_pending_promotions", ["promotion_id"], :name => "index_spree_pending_promotions_on_promotion_id"
  add_index "spree_pending_promotions", ["user_id"], :name => "index_spree_pending_promotions_on_user_id"

  create_table "spree_preferences", :force => true do |t|
    t.string   "name"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.text     "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "key"
    t.string   "value_type"
  end

  add_index "spree_preferences", ["key"], :name => "index_spree_preferences_on_key", :unique => true

  create_table "spree_product_groups", :force => true do |t|
    t.string "name"
    t.string "permalink"
    t.string "order"
  end

  add_index "spree_product_groups", ["name"], :name => "index_product_groups_on_name"
  add_index "spree_product_groups", ["permalink"], :name => "index_product_groups_on_permalink"

  create_table "spree_product_groups_products", :id => false, :force => true do |t|
    t.integer "product_id"
    t.integer "product_group_id"
  end

  create_table "spree_product_option_types", :force => true do |t|
    t.integer  "position"
    t.integer  "product_id"
    t.integer  "option_type_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "spree_product_properties", :force => true do |t|
    t.string   "value"
    t.integer  "product_id"
    t.integer  "property_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "spree_product_properties", ["product_id"], :name => "index_product_properties_on_product_id"

  create_table "spree_product_scopes", :force => true do |t|
    t.string  "name"
    t.text    "arguments"
    t.integer "product_group_id"
  end

  add_index "spree_product_scopes", ["name"], :name => "index_product_scopes_on_name"
  add_index "spree_product_scopes", ["product_group_id"], :name => "index_product_scopes_on_product_group_id"

  create_table "spree_products", :force => true do |t|
    t.string   "name",                 :default => "",    :null => false
    t.text     "description"
    t.datetime "available_on"
    t.datetime "deleted_at"
    t.string   "permalink"
    t.string   "meta_description"
    t.string   "meta_keywords"
    t.integer  "tax_category_id"
    t.integer  "shipping_category_id"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.integer  "count_on_hand",        :default => 0
    t.string   "image_number"
    t.string   "ebay_id"
    t.integer  "is_on_ebay",           :default => 0
    t.string   "check_start"
    t.string   "check_end"
    t.string   "ebay_category"
    t.string   "ebay_store_category"
    t.integer  "bblist",               :default => 0
    t.boolean  "hide_quantity",        :default => false
    t.string   "check_code"
    t.integer  "send_to_ebay",         :default => 0
    t.integer  "ebay_revise",          :default => 0
    t.string   "delcampe_item_id"
  end

  add_index "spree_products", ["available_on"], :name => "index_spree_products_on_available_on"
  add_index "spree_products", ["check_end"], :name => "index_spree_products_on_check_end"
  add_index "spree_products", ["check_start"], :name => "index_spree_products_on_check_start"
  add_index "spree_products", ["deleted_at"], :name => "index_spree_products_on_deleted_at"
  add_index "spree_products", ["image_number"], :name => "index_spree_products_on_image_number"
  add_index "spree_products", ["name"], :name => "index_spree_products_on_name"
  add_index "spree_products", ["permalink"], :name => "index_spree_products_on_permalink"

  create_table "spree_products_promotion_rules", :id => false, :force => true do |t|
    t.integer "product_id"
    t.integer "promotion_rule_id"
  end

  add_index "spree_products_promotion_rules", ["product_id"], :name => "index_products_promotion_rules_on_product_id"
  add_index "spree_products_promotion_rules", ["promotion_rule_id"], :name => "index_products_promotion_rules_on_promotion_rule_id"

  create_table "spree_products_taxons", :id => false, :force => true do |t|
    t.integer "product_id"
    t.integer "taxon_id"
  end

  add_index "spree_products_taxons", ["product_id"], :name => "index_spree_products_taxons_on_product_id"
  add_index "spree_products_taxons", ["taxon_id"], :name => "index_spree_products_taxons_on_taxon_id"

  create_table "spree_promotion_action_line_items", :force => true do |t|
    t.integer "promotion_action_id"
    t.integer "variant_id"
    t.integer "quantity",            :default => 1
  end

  create_table "spree_promotion_actions", :force => true do |t|
    t.integer "activator_id"
    t.integer "position"
    t.string  "type"
  end

  create_table "spree_promotion_rules", :force => true do |t|
    t.integer  "activator_id"
    t.integer  "user_id"
    t.integer  "product_group_id"
    t.string   "type"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "spree_promotion_rules", ["product_group_id"], :name => "index_promotion_rules_on_product_group_id"
  add_index "spree_promotion_rules", ["user_id"], :name => "index_promotion_rules_on_user_id"

  create_table "spree_promotion_rules_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "promotion_rule_id"
  end

  add_index "spree_promotion_rules_users", ["promotion_rule_id"], :name => "index_promotion_rules_users_on_promotion_rule_id"
  add_index "spree_promotion_rules_users", ["user_id"], :name => "index_promotion_rules_users_on_user_id"

  create_table "spree_properties", :force => true do |t|
    t.string   "name"
    t.string   "presentation", :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "spree_properties_prototypes", :id => false, :force => true do |t|
    t.integer "prototype_id"
    t.integer "property_id"
  end

  create_table "spree_prototypes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "spree_return_authorizations", :force => true do |t|
    t.string   "number"
    t.string   "state"
    t.decimal  "amount",     :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.integer  "order_id"
    t.text     "reason"
    t.datetime "created_at",                                                :null => false
    t.datetime "updated_at",                                                :null => false
  end

  create_table "spree_roles", :force => true do |t|
    t.string "name"
  end

  create_table "spree_roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "spree_roles_users", ["role_id"], :name => "index_spree_roles_users_on_role_id"
  add_index "spree_roles_users", ["user_id"], :name => "index_spree_roles_users_on_user_id"

  create_table "spree_shipments", :force => true do |t|
    t.string   "tracking"
    t.string   "number"
    t.decimal  "cost",               :precision => 8, :scale => 2
    t.datetime "shipped_at"
    t.integer  "order_id"
    t.integer  "shipping_method_id"
    t.integer  "address_id"
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
    t.string   "state"
  end

  add_index "spree_shipments", ["number"], :name => "index_shipments_on_number"

  create_table "spree_shipping_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "spree_shipping_methods", :force => true do |t|
    t.string   "name"
    t.integer  "zone_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "display_on"
    t.integer  "shipping_category_id"
    t.boolean  "match_none"
    t.boolean  "match_all"
    t.boolean  "match_one"
    t.datetime "deleted_at"
  end

  create_table "spree_skrill_transactions", :force => true do |t|
    t.string   "email"
    t.float    "amount"
    t.string   "currency"
    t.integer  "transaction_id"
    t.integer  "customer_id"
    t.string   "payment_type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "spree_state_changes", :force => true do |t|
    t.string   "name"
    t.string   "previous_state"
    t.integer  "stateful_id"
    t.integer  "user_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "stateful_type"
    t.string   "next_state"
  end

  create_table "spree_states", :force => true do |t|
    t.string  "name"
    t.string  "abbr"
    t.integer "country_id"
  end

  create_table "spree_tax_categories", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.boolean  "is_default",  :default => false
    t.datetime "deleted_at"
  end

  create_table "spree_tax_rates", :force => true do |t|
    t.decimal  "amount",             :precision => 8, :scale => 5
    t.integer  "zone_id"
    t.integer  "tax_category_id"
    t.datetime "created_at",                                                          :null => false
    t.datetime "updated_at",                                                          :null => false
    t.boolean  "included_in_price",                                :default => false
    t.string   "name"
    t.boolean  "show_rate_in_label",                               :default => true
  end

  create_table "spree_taxonomies", :force => true do |t|
    t.string   "name",                      :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "position",   :default => 0
  end

  create_table "spree_taxons", :force => true do |t|
    t.integer  "parent_id"
    t.integer  "position",            :default => 0
    t.string   "name",                               :null => false
    t.string   "permalink"
    t.integer  "taxonomy_id"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.integer  "lft"
    t.integer  "rgt"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
    t.text     "description"
    t.string   "ebay_store_category"
    t.string   "ebay_category"
    t.string   "associated_with"
    t.integer  "old_id"
  end

  add_index "spree_taxons", ["parent_id"], :name => "index_taxons_on_parent_id"
  add_index "spree_taxons", ["permalink"], :name => "index_taxons_on_permalink"
  add_index "spree_taxons", ["taxonomy_id"], :name => "index_taxons_on_taxonomy_id"

  create_table "spree_tokenized_permissions", :force => true do |t|
    t.integer  "permissable_id"
    t.string   "permissable_type"
    t.string   "token"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "spree_tokenized_permissions", ["permissable_id", "permissable_type"], :name => "index_tokenized_name_and_type"

  create_table "spree_trackers", :force => true do |t|
    t.string   "environment"
    t.string   "analytics_id"
    t.boolean  "active",       :default => true
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "spree_users", :force => true do |t|
    t.string   "encrypted_password"
    t.string   "password_salt"
    t.string   "email"
    t.string   "remember_token"
    t.string   "persistence_token"
    t.string   "reset_password_token"
    t.string   "perishable_token"
    t.integer  "sign_in_count",                        :default => 0, :null => false
    t.integer  "failed_attempts",                      :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "login"
    t.integer  "ship_address_id"
    t.integer  "bill_address_id"
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
    t.string   "spree_api_key",          :limit => 48
    t.string   "authentication_token"
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
  end

  add_index "spree_users", ["email"], :name => "email_idx_unique", :unique => true
  add_index "spree_users", ["persistence_token"], :name => "index_users_on_persistence_token"

  create_table "spree_variants", :force => true do |t|
    t.string   "sku",                                         :default => "",    :null => false
    t.decimal  "price",         :precision => 8, :scale => 2,                    :null => false
    t.decimal  "weight",        :precision => 8, :scale => 2
    t.decimal  "height",        :precision => 8, :scale => 2
    t.decimal  "width",         :precision => 8, :scale => 2
    t.decimal  "depth",         :precision => 8, :scale => 2
    t.datetime "deleted_at"
    t.boolean  "is_master",                                   :default => false
    t.integer  "product_id"
    t.integer  "count_on_hand",                               :default => 0
    t.decimal  "cost_price",    :precision => 8, :scale => 2
    t.integer  "position"
    t.integer  "lock_version",                                :default => 0
  end

  add_index "spree_variants", ["product_id"], :name => "index_spree_variants_on_product_id"

  create_table "spree_zone_members", :force => true do |t|
    t.integer  "zoneable_id"
    t.string   "zoneable_type"
    t.integer  "zone_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "spree_zones", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.boolean  "default_tax",        :default => false
    t.integer  "zone_members_count", :default => 0
  end

  create_table "stamp_collections", :force => true do |t|
    t.string   "name"
    t.string   "subject"
    t.text     "emails"
    t.text     "codes"
    t.text     "message"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "stock_locations", :force => true do |t|
    t.string   "name"
    t.integer  "vendor_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "hidden"
    t.integer  "hidden_by"
    t.datetime "hidden_at"
    t.integer  "company_id"
    t.integer  "user_id"
  end

  add_index "stock_locations", ["vendor_id"], :name => "index_stock_locations_on_vendor_id"

  create_table "stock_transactions", :force => true do |t|
    t.integer  "company_id"
    t.integer  "vendor_id"
    t.integer  "user_id"
    t.integer  "cash_register_id"
    t.integer  "order_id"
    t.integer  "from_id"
    t.string   "from_type"
    t.integer  "to_id"
    t.string   "to_type"
    t.float    "from_quantity"
    t.float    "to_quantity"
    t.float    "quantity"
    t.boolean  "hidden"
    t.integer  "hidden_by"
    t.datetime "hidden_at"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "tax_profiles", :force => true do |t|
    t.string   "name"
    t.float    "value"
    t.integer  "default"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
    t.boolean  "hidden"
    t.string   "sku"
    t.integer  "vendor_id"
    t.string   "letter"
    t.integer  "hidden_by"
    t.datetime "hidden_at"
    t.integer  "company_id"
    t.string   "color"
  end

  add_index "tax_profiles", ["hidden"], :name => "index_tax_profiles_on_hidden"
  add_index "tax_profiles", ["user_id"], :name => "index_tax_profiles_on_user_id"

  create_table "transaction_tags", :force => true do |t|
    t.string   "name"
    t.integer  "vendor_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "hidden"
    t.integer  "hidden_by"
    t.datetime "hidden_at"
    t.integer  "company_id"
    t.integer  "user_id"
  end

  create_table "user_logins", :force => true do |t|
    t.datetime "login"
    t.datetime "logout"
    t.float    "hourly_rate"
    t.integer  "user_id"
    t.integer  "vendor_id"
    t.integer  "shift_seconds"
    t.float    "amount_due"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "company_id"
    t.boolean  "hidden"
    t.integer  "hidden_by"
    t.datetime "hidden_at"
  end

  add_index "user_logins", ["user_id"], :name => "index_employee_logins_on_employee_id"

  create_table "user_meta", :force => true do |t|
    t.integer  "user_id"
    t.string   "key"
    t.text     "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_meta", ["user_id"], :name => "index_user_meta_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
    t.string   "username"
    t.integer  "vendor_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "language"
    t.string   "theme"
    t.boolean  "js_keyboard"
    t.boolean  "hidden"
    t.string   "apitoken"
    t.integer  "uses_drawer_id"
    t.integer  "auth_code"
    t.string   "last_path"
    t.string   "role_cache"
    t.float    "hourly_rate"
    t.string   "telephone"
    t.string   "cellphone"
    t.text     "address"
    t.integer  "current_order_id"
    t.integer  "company_id"
    t.datetime "hidden_at"
    t.integer  "hidden_by"
    t.integer  "drawer_id"
    t.string   "id_hash"
  end

  create_table "users_vendors", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "vendor_id"
  end

  create_table "vendors", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.text     "description"
    t.datetime "created_at",                                                :null => false
    t.datetime "updated_at",                                                :null => false
    t.boolean  "hidden"
    t.binary   "receipt_logo_header"
    t.binary   "receipt_logo_footer"
    t.boolean  "multi_currency"
    t.string   "sku"
    t.string   "token"
    t.string   "email"
    t.boolean  "use_order_numbers",                 :default => true
    t.string   "unused_order_numbers",              :default => "--- []\n"
    t.integer  "largest_order_number",              :default => 0
    t.integer  "hidden_by"
    t.boolean  "use_quote_numbers",                 :default => true
    t.string   "unused_quote_numbers",              :default => "--- []\n"
    t.integer  "largest_quote_number",              :default => 0
    t.string   "time_zone"
    t.string   "hash_id"
    t.datetime "hidden_at"
    t.integer  "vendor_id"
    t.integer  "company_id"
    t.float    "lp_per_dollar"
    t.float    "dollar_per_lp"
    t.text     "address"
    t.string   "telephone"
    t.text     "receipt_blurb"
    t.integer  "pagination",                        :default => 10
    t.string   "stylesheets"
    t.string   "cash_drawer"
    t.boolean  "open_cash_drawer"
    t.datetime "last_wholesaler_check"
    t.text     "csv_imports"
    t.string   "csv_imports_url"
    t.boolean  "items_view_list"
    t.boolean  "salor_printer"
    t.text     "receipt_blurb_footer"
    t.boolean  "license_accepted"
    t.boolean  "csv_categories"
    t.boolean  "csv_buttons"
    t.boolean  "csv_discounts"
    t.boolean  "csv_customers"
    t.boolean  "csv_loyalty_cards"
    t.text     "invoice_blurb"
    t.text     "invoice_blurb_footer"
    t.string   "gs1_format",                        :default => "2,5,5"
    t.string   "country",                           :default => "us"
    t.integer  "largest_drawer_transaction_number", :default => 0
    t.boolean  "enable_technician_emails"
    t.string   "technician_email"
    t.string   "identifier"
    t.string   "full_subdomain"
    t.string   "full_url"
    t.string   "virtualhost_filter"
    t.integer  "auth_https_mode"
    t.boolean  "https"
    t.boolean  "auth"
    t.string   "domain"
    t.string   "subdomain"
    t.string   "currency",                          :default => "USD"
    t.integer  "pagination_invoice_one",            :default => 20
    t.integer  "pagination_invoice_other",          :default => 30
  end

  add_index "vendors", ["user_id"], :name => "index_vendors_on_user_id"

end
