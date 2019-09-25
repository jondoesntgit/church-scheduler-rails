class EventTemplate < ApplicationRecord
    #belongs_to :event_category
    belongs_to :event_type
    has_many :events
end
