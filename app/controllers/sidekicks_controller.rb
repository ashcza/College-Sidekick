class SidekicksController < ApplicationController

  def index

  end

  def create
    @sidekick = Sidekick.new(sidekick_params)

    if @sidekick.save
      mg_client = Mailgun::Client.new 'key-3ff187b49a46c6f9ba3abdabcc7e1e85'

      # Define your message parameters
      message_params =  { from: 'postmaster@sandbox2de06e30b747423fb5cfdce1c4366c48.mailgun.org',
                          to:   'contact@collegesidekick.com',
                          subject: "Sidekick Registration - #{sidekick_params["college"]}",
                          text:    "First: #{sidekick_params["first"]}\nLast: #{sidekick_params["last"]}\nCollege: #{sidekick_params["college"]}\nMajor: #{sidekick_params["major"]}\nYear: #{sidekick_params["year"]}\nEmail: #{sidekick_params["email"]}\nPhone: #{sidekick_params["phone"]}"
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
