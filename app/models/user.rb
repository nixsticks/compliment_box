class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true, length: {maximum: 30}
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, length: {minimum: 5}

  before_create :create_remember_token
  before_save {self.email = email.downcase}

  has_secure_password

  has_many :sent_compliments,
   :class_name => 'Compliment',
   :foreign_key => 'sender_id'
   # :conditions => {:order => "compliments.created_at DESC"}

  has_many :received_compliments,
   :class_name => 'Compliment',
   :foreign_key => 'recipient_id'
   # :conditions => {:order => "compliments.created_at DESC"}

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private
    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end