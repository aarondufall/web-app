class User < Hanami::Entity
  include BCrypt

  def password
    Password.new(password_digest)
  end
end
