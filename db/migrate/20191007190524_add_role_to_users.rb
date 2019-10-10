# frozen_string_literal: true

##
# Add a column to Users' table.
#
class AddRoleToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :role, :integer, default: 0
  end
end
