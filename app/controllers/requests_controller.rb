
class RequestsController < ApplicationController

  def create
    @request = Request.new(request_params)
    if @request.save
      mg_client = Mailgun::Client.new 'key-3ff187b49a46c6f9ba3abdabcc7e1e85'
      # Define your message parameters
      message_params =  { from: 'postmaster@sandbox2de06e30b747423fb5cfdce1c4366c48.mailgun.org',
                          to:   'contact@collegesidekick.com',
                          subject: "Request - #{request_params["colleges"]}",
                          text:    "First: #{request_params["first"]}\nLast: #{request_params["last"]}\nEmail: #{request_params["email"]}\nPhone: #{request_params["phone"]}\nColleges: #{request_params["colleges"]}\n"
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
