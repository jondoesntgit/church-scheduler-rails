class Event < ApplicationRecord
    belongs_to :event_template
    belongs_to :event_type
    has_many :assignments
end
