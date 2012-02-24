class Add < ActiveRecord::Migration
  def change
    add_column :uploads, :user_id, :integer

  end

  def down
  end
end
