class RegistrationController < ApplicationController
  def create

    user = User.create(email:params[:email],password:params[:password],password_confirmation:params[:password])

    if user
      render json: user.as_json(only: [:id, :email]), status: :created
    else
      head(:unauthorized)
    end

  end

  def destroy

  end
end