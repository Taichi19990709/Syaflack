class RemoveImportancefromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :Posts, :importance, :integer
  end
end
