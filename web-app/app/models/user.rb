class User < ApplicationRecord

  has_many :user_alarms
  has_many :alarms, through: :user_alarms
end
