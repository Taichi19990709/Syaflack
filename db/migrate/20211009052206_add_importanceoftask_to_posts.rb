class AddImportanceoftaskToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :importanceoftask, :string
  end
end
