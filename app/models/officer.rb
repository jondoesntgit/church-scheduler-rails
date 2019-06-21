class Officer < ApplicationRecord
    belongs_to :user
    belongs_to :office
end
