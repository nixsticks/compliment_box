class ComplimentsController < ApplicationController
  before_action :signed_in_user

  def new
    @compliment = Compliment.new
  end

  def create
    @compliment = Compliment.new(compliment_params)
    if @compliment.save
      flash[:success] = "You sweetheart, you!"
      ComplimentMailer.compliment_email(@compliment).deliver
      redirect_to root_path
    else
      flash[:danger] = "Content cannot be empty or longer than 100 characters."
      redirect_to root_path
    end
  end

  def destroy
    session[:return_to] = request.referer
    Compliment.find(params[:id]).destroy
    redirect_to session.delete(:return_to)
  end

  private
    def compliment_params
      params.require(:compliment).permit(:title, :content, :recipient_id, :sender_id)
    end
end