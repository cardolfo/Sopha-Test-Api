module Services
  class UserService
    def self.signin(user, password)
      raise Errors::UserUnauthenticated unless user
      raise Errors::UserUnauthenticated unless user.authenticate(password)

      JwtService.encode(user_id: user.id)
    end

    def self.signup(user)      
      raise Errors::SignupFailed, user.errors.messages unless user.save

      JwtService.encode(user_id: user.id)
    end
  end
end
