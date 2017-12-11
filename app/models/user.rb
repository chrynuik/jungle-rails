class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, :uniqueness => {:case_sensitive => false}
  validates :password, length: { minimum: 8 }, allow_nil: true
  validates :password_confirmation, presence: true

end
