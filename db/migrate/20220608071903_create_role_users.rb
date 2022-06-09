class CreateRoleUsers < ActiveRecord::Migration[5.2]
    def change
      create_table :role_users do |t|
        t.references :user, null: false, foreign_key: true
        t.integer :role,limit: 1, :null => false
  
        t.timestamps
      end
    end
end

