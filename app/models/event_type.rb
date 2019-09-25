class EventType < ApplicationRecord
    has_many :event_templates
    has_many :events
    belongs_to :event_category
end
