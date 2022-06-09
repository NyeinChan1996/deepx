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

ActiveRecord::Schema.define(version: 2022_06_31_033219) do

  create_table "corporate_informations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "corporate_code", limit: 45, null: false
    t.string "company_name", null: false
    t.string "corporate_url", null: false
    t.integer "zip_code", null: false
    t.string "address", null: false
    t.integer "employee_number"
    t.integer "project_employee_number"
    t.integer "production_number"
    t.string "encrypted_password", null: false
    t.string "authentication_token"
    t.integer "corporate_type", limit: 1, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deepx_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "corporate_information_id", null: false
    t.string "user_code", limit: 45, null: false
    t.string "name", null: false
    t.string "department_name", null: false
    t.string "position", null: false
    t.string "mail_address", null: false
    t.string "phone_number", limit: 20, null: false
    t.string "encrypted_password", null: false
    t.string "authentication_token"
    t.integer "sign_in_count"
    t.string "reset_password_token"
    t.integer "created_user_id", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["corporate_information_id"], name: "index_deepx_users_on_corporate_information_id"
  end

  create_table "defect_detections", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "inspection_report_id", null: false
    t.integer "defect_detection_type", null: false
    t.decimal "length", precision: 64, scale: 12, null: false
    t.decimal "width", precision: 64, scale: 12, null: false
    t.decimal "depth", precision: 64, scale: 12, null: false
    t.integer "unit", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inspection_report_id"], name: "index_defect_detections_on_inspection_report_id"
  end

  create_table "file_uploads", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "inspection_report_id", null: false
    t.integer "inspection_data_type", null: false
    t.binary "file", null: false
    t.index ["inspection_report_id"], name: "index_file_uploads_on_inspection_report_id"
  end

  create_table "friends", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.string "twitter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inspection_report_actions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "corporate_information_id", null: false
    t.bigint "user_id", null: false
    t.bigint "inspection_report_id", null: false
    t.integer "read_flg", limit: 1, default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["corporate_information_id"], name: "index_inspection_report_actions_on_corporate_information_id"
    t.index ["inspection_report_id"], name: "index_inspection_report_actions_on_inspection_report_id"
    t.index ["user_id"], name: "index_inspection_report_actions_on_user_id"
  end

  create_table "inspection_reports", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "company_name", null: false
    t.string "project_name", null: false
    t.integer "material", null: false
    t.string "material_no", null: false
    t.integer "painting", null: false
    t.integer "processing_time"
    t.integer "budget"
    t.string "delivery_site_environment", null: false
    t.integer "status"
    t.string "constraints"
    t.integer "current_inspection"
    t.integer "current_automation"
    t.integer "rate_and_time"
    t.integer "frequency_flow"
    t.integer "misjudgment_rate"
    t.integer "color", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_inspection_reports_on_user_id"
  end

  create_table "photo_uploads", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "defect_detection_id", null: false
    t.binary "photo", null: false
    t.index ["defect_detection_id"], name: "index_photo_uploads_on_defect_detection_id"
  end

  create_table "reports", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "inspection_report_id", null: false
    t.string "file_path", null: false
    t.integer "report_status", null: false
    t.integer "report_type", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inspection_report_id"], name: "index_reports_on_inspection_report_id"
  end

  create_table "role_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "role", limit: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_role_users_on_user_id"
  end

  create_table "surface_treatments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "inspection_report_id", null: false
    t.integer "oil_removal_flg", limit: 1
    t.integer "polishing_finish_flg", limit: 1
    t.integer "cutting_flg", limit: 1
    t.integer "heat_treatment_flg", limit: 1
    t.integer "shot_peening_flg", limit: 1
    t.integer "molded_and_casting_flg", limit: 1
    t.integer "other_treatments_flg", limit: 1
    t.string "other_treatments"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inspection_report_id"], name: "index_surface_treatments_on_inspection_report_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "superadmin_role", default: false
    t.boolean "supervisor_role", default: false
    t.boolean "user_role", default: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "deepx_users", "corporate_informations"
  add_foreign_key "defect_detections", "inspection_reports"
  add_foreign_key "file_uploads", "inspection_reports"
  add_foreign_key "inspection_report_actions", "corporate_informations"
  add_foreign_key "inspection_report_actions", "inspection_reports"
  add_foreign_key "inspection_report_actions", "users"
  add_foreign_key "inspection_reports", "users"
  add_foreign_key "photo_uploads", "defect_detections"
  add_foreign_key "reports", "inspection_reports"
  add_foreign_key "role_users", "users"
  add_foreign_key "surface_treatments", "inspection_reports"
end
