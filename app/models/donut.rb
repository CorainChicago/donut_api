class Donut < ApplicationRecord

  def self.find_requested_donuts(set_current_user_from_token, current_user_params)
    if current_user_params
      user_id = set_current_user_from_token.id && User.find_by(email: current_user_params).id
      @donuts = Donut.find_by(user_id: user_id)
    else
      @donuts = Donut.all
    end
  end
end
