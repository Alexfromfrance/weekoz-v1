class SlotsController < ApplicationController
  def create_api
    @trainer = User.find(params[:id])
    @slots = @trainer.slots
    render json: @slots
  end

  def update_time
    @slot = Slot.find(params[:id])
    @slot.start = params[:start].split('(')[0].gsub(' GMT ','+')
    @slot.end = params[:end].split('(')[0].gsub(' GMT ','+')
    @slot.save
  end
end
