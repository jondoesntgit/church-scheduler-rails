class Responsibility < ApplicationRecord
  belongs_to :department
  belongs_to :event_template
end
