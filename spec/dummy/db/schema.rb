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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170127155636) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree
  end

  create_table "dorsale_addresses", force: :cascade do |t|
    t.string   "street"
    t.string   "street_bis"
    t.string   "city"
    t.string   "zip"
    t.string   "country"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.index ["addressable_id"], name: "index_dorsale_addresses_on_addressable_id", using: :btree
    t.index ["addressable_type"], name: "index_dorsale_addresses_on_addressable_type", using: :btree
  end

  create_table "dorsale_alexandrie_attachment_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dorsale_alexandrie_attachments", force: :cascade do |t|
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.string   "file"
    t.integer  "sender_id"
    t.string   "sender_type"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "attachment_type_id"
    t.index ["attachable_id"], name: "index_dorsale_alexandrie_attachments_on_attachable_id", using: :btree
    t.index ["attachable_type"], name: "index_dorsale_alexandrie_attachments_on_attachable_type", using: :btree
    t.index ["attachment_type_id"], name: "index_dorsale_alexandrie_attachments_on_attachment_type_id", using: :btree
    t.index ["sender_id"], name: "index_dorsale_alexandrie_attachments_on_sender_id", using: :btree
    t.index ["sender_type"], name: "index_dorsale_alexandrie_attachments_on_sender_type", using: :btree
  end

  create_table "dorsale_comments", force: :cascade do |t|
    t.integer  "author_id"
    t.string   "user_type"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.text     "text"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "author_type"
    t.index ["author_id"], name: "index_dorsale_comments_on_author_id", using: :btree
    t.index ["author_type"], name: "index_dorsale_comments_on_author_type", using: :btree
    t.index ["commentable_id"], name: "index_dorsale_comments_on_commentable_id", using: :btree
    t.index ["commentable_type"], name: "index_dorsale_comments_on_commentable_type", using: :btree
    t.index ["user_type"], name: "index_dorsale_comments_on_user_type", using: :btree
  end

  create_table "dorsale_customer_vault_corporations_bak", force: :cascade do |t|
    t.string   "name"
    t.string   "short_name"
    t.text     "email"
    t.string   "phone"
    t.string   "fax"
    t.text     "www"
    t.string   "legal_form"
    t.integer  "capital"
    t.string   "immatriculation_number_1"
    t.string   "immatriculation_number_2"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "european_union_vat_number"
  end

  create_table "dorsale_customer_vault_individuals_bak", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "short_name"
    t.text     "email"
    t.string   "title"
    t.string   "twitter"
    t.text     "www"
    t.text     "context"
    t.string   "phone"
    t.string   "fax"
    t.string   "mobile"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "skype"
  end

  create_table "dorsale_customer_vault_links", force: :cascade do |t|
    t.string   "title"
    t.integer  "alice_id"
    t.string   "alice_type_bak"
    t.integer  "bob_id"
    t.string   "bob_type_bak"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["alice_id"], name: "index_dorsale_customer_vault_links_on_alice_id", using: :btree
    t.index ["bob_id"], name: "index_dorsale_customer_vault_links_on_bob_id", using: :btree
  end

  create_table "dorsale_customer_vault_people", force: :cascade do |t|
    t.string   "type"
    t.integer  "old_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "corporation_name"
    t.string   "short_name"
    t.string   "avatar"
    t.string   "email"
    t.string   "phone"
    t.string   "mobile"
    t.string   "fax"
    t.string   "skype"
    t.text     "www"
    t.text     "twitter"
    t.text     "facebook"
    t.text     "linkedin"
    t.text     "viadeo"
    t.text     "data"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["old_id"], name: "index_dorsale_customer_vault_people_on_old_id", using: :btree
  end

  create_table "dorsale_expense_gun_categories", force: :cascade do |t|
    t.string  "name"
    t.string  "code"
    t.boolean "vat_deductible"
  end

  create_table "dorsale_expense_gun_expense_lines", force: :cascade do |t|
    t.integer  "expense_id"
    t.integer  "category_id"
    t.string   "name"
    t.date     "date"
    t.float    "total_all_taxes"
    t.float    "vat"
    t.float    "company_part"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["category_id"], name: "index_dorsale_expense_gun_expense_lines_on_category_id", using: :btree
    t.index ["expense_id"], name: "index_dorsale_expense_gun_expense_lines_on_expense_id", using: :btree
  end

  create_table "dorsale_expense_gun_expenses", force: :cascade do |t|
    t.string   "name"
    t.string   "state"
    t.date     "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_dorsale_expense_gun_expenses_on_user_id", using: :btree
  end

  create_table "dorsale_flyboy_task_comments", force: :cascade do |t|
    t.integer  "task_id"
    t.datetime "date"
    t.text     "description"
    t.integer  "progress"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.index ["author_id"], name: "index_dorsale_flyboy_task_comments_on_author_id", using: :btree
    t.index ["author_type"], name: "index_dorsale_flyboy_task_comments_on_author_type", using: :btree
    t.index ["task_id"], name: "index_dorsale_flyboy_task_comments_on_task_id", using: :btree
  end

  create_table "dorsale_flyboy_tasks", force: :cascade do |t|
    t.integer  "taskable_id"
    t.string   "taskable_type"
    t.string   "name"
    t.text     "description"
    t.integer  "progress"
    t.boolean  "done"
    t.date     "term"
    t.date     "reminder"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "owner_type"
    t.integer  "owner_id"
    t.index ["owner_id"], name: "index_dorsale_flyboy_tasks_on_owner_id", using: :btree
    t.index ["owner_type"], name: "index_dorsale_flyboy_tasks_on_owner_type", using: :btree
    t.index ["taskable_id"], name: "index_dorsale_flyboy_tasks_on_taskable_id", using: :btree
    t.index ["taskable_type"], name: "index_dorsale_flyboy_tasks_on_taskable_type", using: :btree
  end

  create_table "dummy_models", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "string_field"
    t.text     "text_field"
    t.integer  "integer_field"
    t.decimal  "decimal_field"
    t.date     "date_field"
    t.datetime "datetime_field"
    t.boolean  "boolean_field"
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context", using: :btree
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
    t.index ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy", using: :btree
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id", using: :btree
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type", using: :btree
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type", using: :btree
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true, using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "is_active"
    t.string   "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
