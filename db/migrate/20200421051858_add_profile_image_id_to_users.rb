# プロフィール画像設定カラムの追加
class AddProfileImageIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profile_image_id, :string
  end
end
