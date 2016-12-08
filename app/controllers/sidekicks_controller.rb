class SidekicksController < ApplicationController

  def index

  end

  def create
    @sidekick = Sidekick.new(sidekick_params)

    if @sidekick.save
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
