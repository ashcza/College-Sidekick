require 'mail'

class RequestsController < ApplicationController

  def create
    @request = Request.new(request_params)

    if @request.save
      mail = Mail.new do
        from     'ash@test.lindsaar.net'
        to       'ashcon.zand@gmail.com'
        subject  'Here is the image you wanted'
        body     'yeaaaaa it works'
      end
      mail.deliver!

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
