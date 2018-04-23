class AddStartAndEndDateToKonsulter < ActiveRecord::Migration[5.1]
  def change
    add_column :konsulters, :start_date, :date
    add_column :konsulters, :end_date, :date
  end
end
