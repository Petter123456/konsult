class AddExperianceToKonsulters < ActiveRecord::Migration[5.1]
  def change
    add_column :konsulters, :experience, :string
  end
end
