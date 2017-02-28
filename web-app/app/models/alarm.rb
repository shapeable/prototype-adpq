class Alarm < ApplicationRecord
  has_many :user_alarms
  has_many :users, through: :user_alarms

  has_many :alarm_categories
end
