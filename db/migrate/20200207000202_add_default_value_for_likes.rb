class AddDefaultValueForLikes < ActiveRecord::Migration[5.1]
  def change
    change_column_default :posts, :likes, 0
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
