class AddAccountApprovedToAdministrator < ActiveRecord::Migration
  def up
    add_column :administrators, :account_approved, :boolean, default: false
  end

  def down
    remove_column :administrators, :account_approved, :boolean
  end
end
