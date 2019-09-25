class Office < ApplicationRecord
  belongs_to :department
  has_many :officers
end
