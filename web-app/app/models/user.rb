class User < ApplicationRecord

  has_many :user_alarms
  has_many :alarms, through: :user_alarms

  has_many :messages
  has_many :alarms, through: :messages
end
