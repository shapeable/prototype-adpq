class AddNameEsToAlarmCategories < ActiveRecord::Migration[5.0]
  def up
  	add_column :alarm_categories, :name_es, :string
  end

  def down
  	remove_column :alarm_categories, :name_es, :string
  end
end
