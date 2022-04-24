class AddColorToClubs < ActiveRecord::Migration[6.1]
  def change
    add_column :clubs, :color, :string
  end
end
