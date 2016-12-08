class RequestsController < ApplicationController

  def create
    @request = Request.new(request_params)

    if @request.save
      render :show
    else
      flash.now[:errors] = @request.errors.full_messages
      @section = "tour"
      render :index
    end

  end

  private
  def request_params
    params.require(:request).permit(:first, :last, :email, :phone, :colleges)
  end

end
