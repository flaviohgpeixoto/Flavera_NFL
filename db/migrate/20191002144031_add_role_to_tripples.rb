# frozen_string_literal: true

##
# Add a column to Tripples' table.
#
class AddRoleToTripples < ActiveRecord::Migration[5.2]
  def change
    add_column :tripples, :role, :integer, default: 0
  end
end
