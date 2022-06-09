class CreateInspectionReportActions < ActiveRecord::Migration[5.2]
    def change
      create_table :inspection_report_actions do |t|
        t.references :corporate_information, null: false, foreign_key: true
        t.references :user, null: false, foreign_key: true
        t.references :inspection_report, null: false, foreign_key: true
        t.integer :read_flg, limit: 1, :null => false, default: 0
  
        t.timestamps
      end
    end
end
