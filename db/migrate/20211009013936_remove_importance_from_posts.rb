class RemoveImportanceFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :importance, :integer
  end
end
