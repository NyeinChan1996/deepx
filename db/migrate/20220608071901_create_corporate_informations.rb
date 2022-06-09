class CreateCorporateInformations < ActiveRecord::Migration[5.2]
  def change
    create_table :corporate_informations do |t|
      t.string :corporate_code, :limit => 45, :null => false
      t.string :company_name, :null => false
      t.string :corporate_url, :null => false
      t.integer :zip_code, :null => false
      t.string :address, :null => false
      t.integer :employee_number
      t.integer :project_employee_number
      t.integer :production_number
      t.string :encrypted_password, :null => false
      t.string :authentication_token
      t.integer :corporate_type, limit: 1, :null => false
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
