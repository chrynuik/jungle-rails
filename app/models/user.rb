class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews

  validates :first_name, :last_name, presence: true
  validates :email, uniqueness: true, presence: true

end
