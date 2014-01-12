class PagesController < ApplicationController
  layout 'frontpage'
  
  def index
    if signed_in?
      @compliments = Compliment.all
      @compliment = Compliment.new
      render 'signed_in'
    end
  end

  def signed_in
  end

  def about
  end
end
