class Admin::EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.save
    redirect_to admin_event_path(@event)
  end

  def index
    @events = Event.all.order(genre_id: "ASC")
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(update_event_params)
    redirect_to admin_event_path(@event)
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    redirect_to admin_events_path
  end

  private
  def event_params
    params.require(:event).permit(:genre_id, :name)
  end

  def update_event_params
    params.require(:event).permit(:genre_id, :name)
  end

end
