class UsersController < ApplicationController
  def show
    # These credentials were created on the Shacip user model
    credentials = { email: 'fabes@localhost.com', password: 'pass1234' }
    endorsement = Shacip::Client::Endorsement.create(credentials)

    if endorsement.recognized
      @user = User.find_by_email credentials[:email]

      # sign the user in if there is a record on CPS and the endorsement is
      # recognized 
      sign_in @user
    end

    render json: current_user
  end
end
