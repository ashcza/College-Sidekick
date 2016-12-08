class RequestsController < ApplicationController

  def create
    
  end

  private
  def request_params
    params.require(:request).permit(:first, :last, :email, :phone, :colleges)
  end

end
