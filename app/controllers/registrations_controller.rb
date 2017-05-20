class RegistrationsController < Devise::RegistrationsController
  respond_to :json
  skip_before_action :verify_authenticity_token, if: :json_request?

  # acts_as_token_authentication_handler_for User
  # skip_before_action :authenticate_entity_from_token!, only: [:create]
  # skip_before_action :authenticate_entity!, only: [:create]

  # skip_before_action :authenticate_scope!
  # append_before_action :authenticate_scope!, only: [:destroy]

  def create
    build_resource(sign_up_params)
    if resource.save!
      status = HTTP_OK
      message = "Successfully created new account for email #{sign_up_params[:email]}."
    else
      clean_up_passwords resource
      status = HTTP_INTERNAL_SERVER_ERROR
      message = "Failed to create new account for email #{sign_up_params[:email]}."
    end

    respond_to do |format|
      format.json {
        render json: {
          message: message
        }, status: status
      }
    end
  end

  def destroy
    resource.destroy
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)

    respond_to do |format|
      format.json {
        render json: {
          message: 'Successfully deleted the account.'
         }, 
         status: HTTP_OK
      }
    end
  end

  private

  def sign_up_params
    devise_parameter_sanitizer.sanitize(:sign_up)
  end

  def json_request?
    request.format.json?
  end

  def authenticate_user_from_token!
    user_token = params[:user_token].presence
    user       = user_token && User.find_by_authentication_token(user_token.to_s)
  
    if user
      # Notice we are passing store false, so the user is not
      # actually stored in the session and a token is needed
      # for every request. If you want the token to work as a
      # sign in token, you can simply remove store: false.
      sign_in user, store: false
    end
  end
end