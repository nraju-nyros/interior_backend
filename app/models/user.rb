class User < ApplicationRecord

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, presence: true

  validates :password, :presence => true,
                     :length => { minimum: 6 },allow_blank: true
                      has_secure_password :validations => false

 

  has_many :user_requirements
  accepts_nested_attributes_for :user_requirements, allow_destroy: true



	def generate_password_token!
	 self.reset_password_token = generate_token
	 self.reset_password_sent_at = Time.now.utc
	 save!
	end

	def password_token_valid?
	 (self.reset_password_sent_at + 4.hours) > Time.now.utc
	end

	def reset_password!(password)
	 self.reset_password_token = nil
	 self.password = password
	 save!
	end

	private
	def generate_token
	 SecureRandom.hex(10)
	end

end



