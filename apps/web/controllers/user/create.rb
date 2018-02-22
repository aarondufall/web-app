module Web::Controllers::User
  class Create
    include Web::Action

    params do
      required(:signup).schema do
        required(:username).filled(:str?)
        required(:email).filled(:str?, format?: /@/)
        required(:password).filled(:str?).confirmation
      end
    end

    def call(params)
      # Todo Validation object
      # Create user 
      if params.valid?
        # TODO check if email is already taken
        # TODO check if username is already taken
        repository = UserRepository.new
        user = repository.create(
          email: params[:signup][:email],
          password_digest: hashed_password(params[:signup][:password])
        )

        profile_id = user.id
        name = params[:signup][:usernamename]
        # TODO add email uniqueness validation
        email = params[:signup][:email]

        ProfileComponent::Commands::Initiate.(profile_id: profile_id, name: name, email: email)
        # Multi tenancy option Start organization with user uuid
        # Create user session
        warden.set_user user
        # TODO redirect to Question index
        redirect_to routes.home_path
      else
        self.status = 422
      end
    end

    def hashed_password(password)
      BCrypt::Password.create(password)
    end
  end
end
