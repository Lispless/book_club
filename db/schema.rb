ActiveRecord::Schema.define(version: 20140703195652) do

  enable_extension "plpgsql"

  create_table "books", force: true do |t|
    t.string   "title",       null: false
    t.string   "author",      null: false
    t.integer  "year",        null: false
    t.text     "description"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", force: true do |t|
    t.integer  "rating",     null: false
    t.text     "body",       null: false
    t.integer  "book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
