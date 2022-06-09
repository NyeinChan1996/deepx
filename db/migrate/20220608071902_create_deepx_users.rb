class CreateDeepxUsers < ActiveRecord::Migration[5.2]
    def change
      create_table :deepx_users do |t|
        t.references :corporate_information, null: false, foreign_key: true
        t.string :user_code, :limit => 45, :null => false
        t.string :name, :null => false
        t.string :department_name, :null => false
        t.string :position, :null => false
        t.string :mail_address, :null => false
        t.string :phone_number, :limit => 20, :null => false
        t.string :encrypted_password, :null => false
        t.string :authentication_token
        t.integer :sign_in_count
        t.string :reset_password_token
        t.integer :created_user_id, :null => false
        t.datetime :deleted_at
  
        t.timestamps
      end
    end
end
