class AddDatetimeToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :datetime, :datetime
  end
end
