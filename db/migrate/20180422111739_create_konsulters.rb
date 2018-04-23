class CreateKonsulters < ActiveRecord::Migration[5.1]
  def change
    create_table :konsulters do |t|
      t.string :name

      t.timestamps
    end
  end
end
