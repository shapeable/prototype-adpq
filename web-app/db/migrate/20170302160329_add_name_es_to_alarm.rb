class AddNameEsToAlarm < ActiveRecord::Migration[5.0]
  def up
  	add_column :alarms, :name_es, :string
  end

  def down
  	remove_column :alarms, :name_es, :string
  end
end
