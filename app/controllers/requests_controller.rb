class RequestsController < ApplicationController

  def create
    @request = Request.new(request_params)
    
    if @request.save!
      render :show
    end

  end

  private
  def request_params
    params.require(:request).permit(:first, :last, :email, :phone, :colleges)
  end

end
