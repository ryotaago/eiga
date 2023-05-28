class ChangeColumnOfUsers < ActiveRecord::Migration[6.1]
  def change
    change_column_null :users, :is_active, false
  end
end
