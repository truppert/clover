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

ActiveRecord::Schema.define(version: 20180415133233) do

  create_table "metric_sources", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "host"
    t.integer "port"
    t.string "database"
  end

  create_table "metrics", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "metric_source_id"
    t.string "measurement_name"
    t.string "value_field"
    t.index ["metric_source_id"], name: "index_metrics_on_metric_source_id"
  end

  create_table "reports", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "timestamp"
  end

  create_table "thresholds", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "metric_id"
    t.decimal "low_value", precision: 10
    t.decimal "high_value", precision: 10
    t.integer "count"
    t.integer "interval"
    t.index ["metric_id"], name: "index_thresholds_on_metric_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
  end

  add_foreign_key "metrics", "metric_sources"
  add_foreign_key "thresholds", "metrics"
end
