class SidekicksController < ApplicationController

  def index
  end

  def create
    
  end

  private
  def sidekick_params
    params.require(:sidekick).permit(:college, :year, :major, :first, :last, :email, :phone)
  end

end
