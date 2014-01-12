class ComplimentsController < ApplicationController
  before_action :signed_in_user

  def new
    @compliment = Compliment.new
  end

  def create
    @compliment = Compliment.new(compliment_params)
    if @compliment.save
      flash[:success] = "You sweetheart, you!"
      redirect_to root_path
    else
      flash[:danger] = "Content cannot be empty or longer than 100 characters."
      redirect_to root_path
    end
  end

  def destroy
    Compliment.find(params[:id]).destroy
    redirect_to user_path(current_user)
  end

  private
    def compliment_params
      params.require(:compliment).permit(:title, :content, :recipient_id, :sender_id)
    end
end