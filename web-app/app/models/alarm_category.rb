class AlarmCategory < ApplicationRecord

    belongs_to :alarm, optional: true
end
