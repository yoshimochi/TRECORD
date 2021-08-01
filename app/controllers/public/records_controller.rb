class Public::RecordsController < ApplicationController
  before_action :authenticate_user!

  def new
    @record = Record.new
    @event = @record.events.build
    @set_event = @event.set_events.build
  end

  def create
    @record = Record.new
    if @record.update(record_params)
      redirect_to records_path
    else
      render :new
    end
  end

  def index
    @records = Record.all
  end

  def show
    @record = Record.find(params[:id])
  end

  private
  def record_params
      params.require(:record).permit(:comment, events_attributes: [:id, :name, :_destroy, set_events_attributes: [:id, :weight, :rep, :_destroy]]).merge(user_id: current_user.id)
  end

end
