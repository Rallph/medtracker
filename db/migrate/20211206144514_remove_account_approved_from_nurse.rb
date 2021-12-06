class RemoveAccountApprovedFromNurse < ActiveRecord::Migration
  def change
    remove_column :nurses, :account_approved, :boolean
  end
end
