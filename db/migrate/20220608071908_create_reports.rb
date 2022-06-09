class CreateReports < ActiveRecord::Migration[5.2]
    def change
      create_table :reports do |t|
        t.references :inspection_report, null: false, foreign_key: true
        t.string :file_path, :null => false
        t.integer :report_status, :null => false
        t.integer :report_type, :null => false
        t.datetime :deleted_at
  
        t.timestamps
      end
    end
end
