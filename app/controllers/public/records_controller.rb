class Public::RecordsController < ApplicationController
  before_action :authenticate_user!

  def new
      @set_events = current_user.set_events
      @record = Record.new
  end

  def create
      @record = current_user.records.build(record_params)
      @record.user_id = current_user.id

      if @record.save
          flash[:success] = "記録に成功しました"
          current_user.set_events.each do |set_event|
              @training_records = TrainingRecord.new
              @training_records.record_id = @record.id
              @training_records.user_id = current_user.id
              @training_records.event_id = set_event.event_id
              @training_records.weight = set_event.weight
              @training_records.rep = set_event.rep
              @training_records.set = set_event.set
              @training_records.save
          end
          current_user.set_events.destroy_all
          redirect_to records_path
      else
          render :index
      end
  end

  def index
      @records = current_user.records.all
  end

  def show
      @record = Record.find(params[:id])
      @training_records = @record.training_records
  end

  def destroy
      record = Record.find(params[:id])
      record.destroy
      redirect_to records_path
  end

  private
  def record_params
      params.require(:record).permit(:user_id)
  end

end
