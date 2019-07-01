class Officer < ApplicationRecord
    belongs_to :user
    belongs_to :office

    def display_name
        return name
    end
end
