class UserRepository < Hanami::Repository
  def self.auth(email, password)
    instance = new
    user = instance.users.where(email: email).first
    if user
      return user if user.password == password  
    end
  end
end
