class CreateCandidates < ActiveRecord::Migration[5.2]
  def change
    create_table :candidates do |t|
      t.string :first_name
      t.string :last_name
      t.string :position
      t.integer :status, default: 0
    end
  end
end
