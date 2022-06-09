class CreateDefectDetections < ActiveRecord::Migration[5.2]
    def change
      create_table :defect_detections do |t|
        t.references :inspection_report, null: false, foreign_key: true
        t.integer :defect_detection_type, :null => false
        t.decimal  :length,:precision=>64, :scale=>12, :null => false
        t.decimal  :width,:precision=>64, :scale=>12, :null => false
        t.decimal  :depth,:precision=>64, :scale=>12, :null => false
        t.integer :unit, :null => false
        t.datetime :deleted_at
  
        t.timestamps
      end
    end
end