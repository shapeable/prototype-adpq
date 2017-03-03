class ChangeNameAlertIi < ActiveRecord::Migration[5.0]
  def up
  	rename_column :messages, :alert_id, :alarm_id
  end

  def down
  	rename_column :messages, :alarm_id, :alert_id
  end
end
