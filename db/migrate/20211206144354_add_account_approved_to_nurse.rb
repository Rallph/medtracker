class AddAccountApprovedToNurse < ActiveRecord::Migration
  def change
    add_column :nurses, :account_approved, :boolean, default: false
  end
end
