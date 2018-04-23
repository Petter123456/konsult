class AddCompetenceTokKonsulters < ActiveRecord::Migration[5.1]
  def change
    add_column :konsulters, :competence, :string
  end
end
