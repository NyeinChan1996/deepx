class CreateSurfaceTreatments < ActiveRecord::Migration[5.2]
    def change
      create_table :surface_treatments do |t|
        t.references :inspection_report, null: false, foreign_key: true
        t.integer :oil_removal_flg, limit: 1
        t.integer :polishing_finish_flg, limit: 1
        t.integer :cutting_flg, limit: 1
        t.integer :heat_treatment_flg, limit: 1
        t.integer :shot_peening_flg, limit: 1
        t.integer :molded_and_casting_flg, limit: 1
        t.integer :other_treatments_flg, limit: 1
        t.string :other_treatments
        t.datetime :deleted_at
  
        t.timestamps
      end
    end
end

