class CreateUsersUploads < ActiveRecord::Migration
  def change
    create_table :users_uploads do |t|
      t.integer :user_id
      t.integer :upload_ip

      t.timestamps
    end
  end
end
