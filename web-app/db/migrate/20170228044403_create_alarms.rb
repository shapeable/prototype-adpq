class CreateAlarms < ActiveRecord::Migration[5.0]
  def change
    create_table :alarms do |t|
      t.string :name
      t.text :description
      t.text :end_point
      t.integer :alarm_category_id

      t.timestamps
    end
  end
end
