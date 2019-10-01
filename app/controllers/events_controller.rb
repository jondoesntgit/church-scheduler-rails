class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def edit
    @event = Event.find(params[:id])
  end

  def show
    @event = Event.find(params[:id])
  end

end
