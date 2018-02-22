module Web::Controllers::Session
  class Create
    include Web::Action


    def call(params)
      user = UserRepository.auth(params[:signin][:email], params[:signin][:password])
      if user
        warden.set_user user
        redirect_to "/"
      end
      flash[:failed_notice] = "Sign in failed"
    end
  end
end
