class AddAccountApprovedToNurse < ActiveRecord::Migration
  def up
    add_column :nurses, :account_approved, :boolean, default: false
  end

  def down
    remove_column :nurses, :account_approved, :boolean
  end
end
