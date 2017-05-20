class Users::SessionsController < Devise::SessionsController
  protect_from_forgery with: :null_session
  
  def create
    super do |resource|
      resource.token = SecureRandom.hex(32)
      resource.save
    end
  end
end

