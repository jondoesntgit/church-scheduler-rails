class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
         # validatable

  has_and_belongs_to_many :groups

  def full_name
    "#{first_name} #{last_name}"
  end

  # Don't require passwords
  def email_required?
    false
  end
  
  def email_changed?
    false
  end
end
