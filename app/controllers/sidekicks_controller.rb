class SidekicksController < ApplicationController

  def index

  end

  def create
    @sidekick = Sidekick.new(sidekick_params)

    if @sidekick.save
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
      flash.now[:errors] = @sidekick.errors.full_messages
      @section = "join"
      render :index
    end

  end

  def show

  end

  private
  def sidekick_params
    params.require(:sidekick).permit(:college, :year, :major, :first, :last, :email, :phone)
  end

end
