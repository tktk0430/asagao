class ChangeSecToSexOnMembers < ActiveRecord::Migration[5.2]
  def change
    rename_column :members, :sec, :sex
  end
end
