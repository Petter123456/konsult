class AddUserIdToKonsulters < ActiveRecord::Migration[5.1]
  def change
    add_column :konsulters, :user_id, :integer
  end
end
