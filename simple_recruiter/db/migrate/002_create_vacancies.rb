class CreateVacancies < ActiveRecord::Migration[5.2]
  def change
    create_table :vacancies do |t|
      t.string :name
      t.integer :level, default: 0
      t.integer :status
      t.date :date_close
    end
  end
end
