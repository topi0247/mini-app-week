class ChangeColumnToPosts < ActiveRecord::Migration[7.1]
  def change
    rename_column(:posts, :public, :is_public)
  end
end
