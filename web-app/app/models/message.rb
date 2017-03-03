class Message < ApplicationRecord
 belongs_to :user, optional: true
 belongs_to :alarm, optional: true

end
