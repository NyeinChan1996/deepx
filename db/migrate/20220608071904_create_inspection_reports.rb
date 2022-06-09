class CreateInspectionReports < ActiveRecord::Migration[5.2]
    def change
      create_table :inspection_reports do |t|
        t.references :user, null: false, foreign_key: true
        t.string :company_name, :null => false
        t.string :project_name, :null => false
        t.integer :material, :null => false
        t.string :material_no, :null => false
        t.integer :painting, :null => false
        t.integer :processing_time
        t.integer :budget
        t.string :delivery_site_environment, :null => false
        t.integer :status
        t.string :constraints
        t.integer :current_inspection
        t.integer :current_automation
        t.integer :rate_and_time
        t.integer :frequency_flow
        t.integer :misjudgment_rate
        t.integer :color, :null => false
        t.datetime :deleted_at
  
        t.timestamps
      end
    end
end

