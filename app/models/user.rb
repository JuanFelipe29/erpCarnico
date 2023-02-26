class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true,
                    uniqueness: { case_sensitive: false }, 
                    format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { minimum: 8, maximum: 64 },
                       if: :password_required?


  before_validation :formatting_email

  private

  def password_required?
    password.present?
  end

  def formatting_email
    self.email = email&.downcase&.strip
  end
end