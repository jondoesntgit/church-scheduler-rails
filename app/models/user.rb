class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
         # :validatable

  # TODO: Only enforce uniqueness if null

  has_and_belongs_to_many :groups
  has_and_belongs_to_many :offices, :through => :officers

  def full_name
    "#{first_name} #{last_name}"
  end

  def display_name
    full_name
  end

  # Don't require passwords
  def email_required?
    false
  end
  
  def email_changed?
    false
  end
end
