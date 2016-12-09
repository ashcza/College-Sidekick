
class RequestsController < ApplicationController

  def create
    @request = Request.new(request_params)
    if @request.save
      mg_client = Mailgun::Client.new 'key-3ff187b49a46c6f9ba3abdabcc7e1e85'

      # Define your message parameters
      message_params =  { from: 'postmaster@sandbox2de06e30b747423fb5cfdce1c4366c48.mailgun.org',
                          to:   'ashcon.zand@gmail.com',
                          subject: 'The Ruby SDK is awesome!',
                          text:    'It is really easy to send a message!'
                        }

      # Send your message through the client
      mg_client.send_message 'sandbox2de06e30b747423fb5cfdce1c4366c48.mailgun.org', message_params


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
