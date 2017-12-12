class User < ActiveRecord::Base

  has_secure_password

  has_many :reviews

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, :uniqueness => {:case_sensitive => false}
  validates :password, length: { minimum: 8 }, allow_nil: true
  validates :password_confirmation, presence: true
  before_save :downcase_email

  def downcase_email
    self.email.downcase
  end

  def self.authenticate_with_credentials (email, password)
    user = User.find_by_email(email.strip.downcase)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

end
