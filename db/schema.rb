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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170113141546) do

  create_table "assignments", force: :cascade do |t|
    t.integer  "task_id",        limit: 4
    t.integer  "assigned_to_id", limit: 4
    t.string   "status",         limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "audits", force: :cascade do |t|
    t.integer  "auditable_id",    limit: 4
    t.string   "auditable_type",  limit: 255
    t.integer  "associated_id",   limit: 4
    t.string   "associated_type", limit: 255
    t.integer  "user_id",         limit: 4
    t.string   "user_type",       limit: 255
    t.string   "username",        limit: 255
    t.string   "action",          limit: 255
    t.text     "audited_changes", limit: 65535
    t.integer  "version",         limit: 4,     default: 0
    t.string   "comment",         limit: 255
    t.string   "remote_address",  limit: 255
    t.string   "request_uuid",    limit: 255
    t.datetime "created_at"
  end

  add_index "audits", ["associated_id", "associated_type"], name: "associated_index", using: :btree
  add_index "audits", ["auditable_id", "auditable_type"], name: "auditable_index", using: :btree
  add_index "audits", ["created_at"], name: "index_audits_on_created_at", using: :btree
  add_index "audits", ["request_uuid"], name: "index_audits_on_request_uuid", using: :btree
  add_index "audits", ["user_id", "user_type"], name: "user_index", using: :btree

  create_table "contact_infos", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "type",       limit: 255
    t.string   "name",       limit: 255
    t.text     "value",      limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "less_active_members", force: :cascade do |t|
    t.string   "surname",         limit: 255
    t.string   "given_name",      limit: 255
    t.text     "current_address", limit: 65535
    t.text     "new_address",     limit: 65535
    t.string   "new_phone",       limit: 255
    t.text     "reference",       limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.text     "resources",       limit: 65535
  end

  add_index "less_active_members", ["surname", "given_name"], name: "index_less_active_members_on_surname_and_given_name", using: :btree

  create_table "notes", force: :cascade do |t|
    t.integer  "notable_id",   limit: 4
    t.string   "notable_type", limit: 255
    t.integer  "author_id",    limit: 4
    t.string   "title",        limit: 255
    t.text     "body",         limit: 65535
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "personal_history_stories", force: :cascade do |t|
    t.string   "subject",       limit: 255
    t.text     "body",          limit: 65535
    t.datetime "took_place_at"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.text     "instructions", limit: 65535
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id",        limit: 4
    t.integer  "taggable_id",   limit: 4
    t.string   "taggable_type", limit: 255
    t.integer  "tagger_id",     limit: 4
    t.string   "tagger_type",   limit: 255
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["context"], name: "index_taggings_on_context", using: :btree
  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy", using: :btree
  add_index "taggings", ["taggable_id"], name: "index_taggings_on_taggable_id", using: :btree
  add_index "taggings", ["taggable_type"], name: "index_taggings_on_taggable_type", using: :btree
  add_index "taggings", ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type", using: :btree
  add_index "taggings", ["tagger_id"], name: "index_taggings_on_tagger_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name",           limit: 255
    t.integer "taggings_count", limit: 4,   default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "tasks", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.text     "description",    limit: 65535
    t.string   "status",         limit: 255
    t.integer  "assigned_by_id", limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "text_messages", force: :cascade do |t|
    t.string   "subject",    limit: 255
    t.string   "body",       limit: 255
    t.datetime "send_at"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",         limit: 255
    t.string   "uid",              limit: 255
    t.string   "name",             limit: 255
    t.string   "oauth_token",      limit: 255
    t.datetime "oauth_expires_at"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "email",            limit: 255
    t.integer  "roles_mask",       limit: 4
    t.string   "phone",            limit: 255
  end

end
