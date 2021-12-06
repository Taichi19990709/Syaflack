class AddStarttimeToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :start_time, :date
  end
end
