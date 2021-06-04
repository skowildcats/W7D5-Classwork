class User < ApplicationRecord

  attr_reader :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    tmp = BCrypt::Password.new(self.password_digest)
    tmp.is_password?(password)
  end

  def generate_session_token
    SecureRandom.urlbase64
  end
end