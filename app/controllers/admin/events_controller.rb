class Admin::EventsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.save
    redirect_to admin_events_path
  end

  def index
    @event1 = Event.where(genre_id: 1).page(params[:page])
    @event2 = Event.where(genre_id: 2).page(params[:page])
    @event3 = Event.where(genre_id: 3).page(params[:page])
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
    redirect_to admin_events_path
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
