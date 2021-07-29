class Public::SetEventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @set_events = current_user.set_events
  end

  def create
    @set_event = current_user.set_events.new(set_event_params)
    @update_set_event = SetEvent.find_by(event: @set_event.event)

    @set_event.save
    flash[:notice] = "種目を追加しました"
    redirect_to set_events_path
  end

  def update
    @set_event = SetEvent.find(params[:id])
    @set_event.update(weight: params[:weight].to_i)
    @set_event.update(rep: params[:rep].to_i)
    @set_event.update(set: params[:set].to_i)
    flash[:notice] = "変更できました"
    redirect_to set_events_path
  end

  def destroy
    @set_event = SetEvent.find(params[:id])
    @set_event.destroy
    flash[:notice] = "削除しました"
    redirect_to set_events_path
  end

  def destroy_all
    @set_events = current_user.set_events
    @set_events.destroy_all
    flash[:notice] = "記録を削除しました"
    redirect_to set_events_path
  end

  private
  def set_event_params
    params.require(:set_event).permit(:weight, :rep, :set, :event_id, :user_id)
  end
end
