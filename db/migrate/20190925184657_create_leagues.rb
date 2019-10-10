# frozen_string_literal: true

##
# Table for Leagues.
#
class CreateLeagues < ActiveRecord::Migration[5.2]
  def change
    create_table :leagues do |t|
      t.string :name

      t.timestamps
    end
  end
end
