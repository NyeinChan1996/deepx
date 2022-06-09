class CreatePhotoUploads < ActiveRecord::Migration[5.2]
    def change
      create_table :photo_uploads do |t|
        t.references :defect_detection, null: false, foreign_key: true
        t.binary :photo, :null => false
      end
    end
end
