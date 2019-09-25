class Assignment < ApplicationRecord
  belongs_to :responsibility, polymorphic: true
  belongs_to :party, polymorphic: true

  belongs_to :event
end
