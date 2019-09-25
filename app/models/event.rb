class Event < ApplicationRecord
    belongs_to :event_template
    belongs_to :event_type
    has_many :assignments

    def display_name
        if name
            return name
        end
        return event_template.name
        # TODO: Should make a test to catch this
    end
end
