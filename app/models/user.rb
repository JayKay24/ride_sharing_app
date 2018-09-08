class User < ApplicationRecord
  before_save :encrypt_password
  after_save :clear_password

  attr_accessor :password, :password_confirmation

  has_many :vehicles, dependent: :destroy
  has_many :subscriptions
  has_many :rides, through: :subscriptions

  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  PASSWORD_REGEX = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[\W]).{8,}$/

  validates :first_name, :last_name,
            presence: true

  validates :username,
            presence: true,
            uniqueness: true,
            length: { in: 3..20 }

  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: EMAIL_REGEX,
                      multiline: true,
                      message: 'is not a valid email address' }

  validates :password,
            confirmation: true, # password_confirmation attr
            format: { with: PASSWORD_REGEX,
                      multiline: true,
                      message: %(Password must contain at least a
                                lowercase letter, an uppercase, a digit,
                                a special char and 8+ chars) },
            on: create

  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.encrypted_password = BCrypt::Engine.hash_secret password, salt
    end
  end

  def clear_password
    self.password = nil
  end

  def self.authenticate(username_or_email = '', login_password = '')
    if EMAIL_REGEX.match(username_or_email)
      user = User.find_by(email: username_or_email)
    else
      user = User.find_by(username: username_or_email)
    end

    if user&.match_password(login_password)
      return user
    else
      return false
    end
  end

  def match_password(login_password = '')
    encrypted_password == BCrypt::Engine.hash_secret(login_password, salt)
  end
end
