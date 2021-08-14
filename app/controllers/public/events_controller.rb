class Public::EventsController < ApplicationController
  def index
    @event1 = Event.where(genre_id: 1).page(params[:page])
    @event2 = Event.where(genre_id: 2).page(params[:page])
    @event3 = Event.where(genre_id: 3).page(params[:page])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to events_path
    else
      render :new
    end
  end

  def show
    @genre = Genre.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:name, :genre_id)
  end
end
