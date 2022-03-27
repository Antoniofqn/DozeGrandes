class AddReferencesToMatches < ActiveRecord::Migration[6.1]
  def change
    add_reference :matches, :home, foreign_key: { to_table: 'clubs' }
    add_reference :matches, :away, foreign_key: { to_table: 'clubs' }
  end
end
