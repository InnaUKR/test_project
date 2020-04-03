class TicketsController < ApplicationController
  def index
    @tickets = Ticket.all.includes(:excavator)
  end

  def show
    @ticket = Ticket.find(params[:id])
    @excavator = @ticket.excavator
    @coordinates = @ticket.well_known_text.delete('POLYGON()').split(',').map(&:split)
  end
end
