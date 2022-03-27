class CreateMatches < ActiveRecord::Migration[6.1]
  def change
    create_table :matches do |t|
      t.string :stadium
      t.string :competition
      t.integer :score_home
      t.integer :score_away
      t.string :result
      t.date :date

      t.timestamps
    end
  end
end
