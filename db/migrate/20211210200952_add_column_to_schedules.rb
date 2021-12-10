class AddColumnToSchedules < ActiveRecord::Migration[6.1]
  def change
    add_column :schedules, :user_uid, :string
  end
end
