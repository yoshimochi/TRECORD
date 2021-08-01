class Public::RecordsController < ApplicationController
  before_action :authenticate_user!

  def new
    @record = Record.new
    @event_data = @record.event_datum.build
    @set_event = @event_data.set_events.build
  end

  def create
    @record = Record.new(record_params)
    if @record.save
      redirect_to records_path
      flash[:notice] = "記録完了"
    else
      render :new
      flash[:danger] = "失敗"
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
      params.require(:record).permit(:comment, :user_id, events_attributes: [:name, :_destroy, set_events_attributes: [:weight, :rep, :_destroy]]).merge(user_id: current_user.id)
  end

end
