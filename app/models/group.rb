class Group < ApplicationRecord
    has_and_belongs_to_many :users

    def displaly_name
        return name
    end
end
