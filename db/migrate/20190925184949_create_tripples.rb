class CreateTripples < ActiveRecord::Migration[5.2]
  def change
    create_table :tripples do |t|
      t.references :team, foreign_key: true
      t.references :user, foreign_key: true
      t.references :league, foreign_key: true

      t.timestamps
    end
  end
end
