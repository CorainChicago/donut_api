class SessionsController < Devise::SessionsController
  respond_to :json
   protect_from_forgery 
  # skip_before_action :verify_authenticity_token, if: :json_request?

  # acts_as_token_authentication_handler_for User
  # skip_before_action :authenticate_entity_from_token!
  # skip_before_action :authenticate_entity!
  # before_action :authenticate_entity_from_token!, :only => [:destroy]
  # before_action :authenticate_entity!, :only => [:destroy]

  def create
    warden.authenticate!(:scope => resource_name)
    @user = current_user
    @user.authentication_token = SecureRandom.hex(10)
    @user.save
    respond_to do |format|
      format.json {
        render json: {
          message: 'Logged in',
          auth_token: @user.authentication_token
        },
        status: HTTP_OK
      }
    end
  end

  def destroy
    if user_signed_in?
      @user = current_user
      @user.authentication_token = nil
      @user.save

      respond_to do |format|
        format.json {
          render json: {
            message: 'Logged out successfully.'
           } , 
           status: HTTP_OK
        }
      end
    else
      respond_to do |format|
        format.json {
          render json: {
            message: 'Failed to log out. User must be logged in.'
          },
          status: HTTP_UNAUTHORIZED
        }
      end
    end
  end

  private

  def json_request?
    request.format.json?
  end

  # def authenticate_user_from_token
  #   user_token = params[:user_token].presence
  #   user       = user_token && User.find_by_authentication_token(user_token.to_s)

  #   if user
  #     return current_user = user
  #   end
  # end

end