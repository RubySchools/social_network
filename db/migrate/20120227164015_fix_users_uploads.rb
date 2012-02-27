class FixUsersUploads < ActiveRecord::Migration
def change
	 rename_column :users_uploads, :upload_ip, :upload_id
	
end

  def down
  end
end
