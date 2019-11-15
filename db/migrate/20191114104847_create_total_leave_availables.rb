class CreateTotalLeaveAvailables < ActiveRecord::Migration[5.2]
  def change
    create_table :total_leave_availables do |t|
      t.integer :leave_total_account

      t.timestamps
    end
  end
end
