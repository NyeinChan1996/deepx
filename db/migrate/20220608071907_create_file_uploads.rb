class CreateFileUploads < ActiveRecord::Migration[5.2]
    def change
      create_table :file_uploads do |t|
        t.references :inspection_report, null: false, foreign_key: true
        t.integer :inspection_data_type, :null => false
        t.binary :file, :null => false
      end
    end
end
