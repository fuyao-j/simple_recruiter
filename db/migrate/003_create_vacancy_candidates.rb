class CreateVacancyCandidates < ActiveRecord::Migration[5.2]
  def change
    create_table :vacancy_candidates do |t|
      t.integer :vacancy_id
      t.integer :candidate_id
    end
  end
end
