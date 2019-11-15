class CreateLeaves < ActiveRecord::Migration[5.2]
  def change
    create_table :leaves do |t|
      t.string :name
      t.datetime :apply_date
      t.datetime :date_from
      t.datetime :to_date
      t.text :reason_for_leave
      t.string :reporting_head_name
      t.string :leave_status
      t.references :user

      t.timestamps
    end
  end
end
