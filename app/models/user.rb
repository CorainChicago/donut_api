class User < ApplicationRecord
  # acts_as_token_authenticatable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def acts_as_token_authenticatable
    byebug
  end       

end
