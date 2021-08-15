class Public::RecordsController < ApplicationController
  before_action :authenticate_user!

  def new
    @record = Record.new
    @training_record = @record.training_records.build
    @set_event = @training_record.set_events.build
  end

  def create
    @record = Record.new(record_params)
    if @record.save
      redirect_to record_path(record)
      flash[:notice] = "記録に成功しました"
    else
      render :new
      flash[:danger] = "記録に失敗しました"
    end
  end

  def index
    @all_records = Record.includes(:user)
    @user = User.find(current_user.id)
    @records = Record.where(user_id: current_user.id)
  end

  def show
    @record = Record.find(params[:id])
  end

  private

  def record_params
    params.require(:record).permit(
      :comment, :start_time, :rate,
      training_records_attributes: [
        :id, :name, :_destroy,
        set_events_attributes: [
          :id, :weight, :rep, :_destroy
        ]
      ]
    ).merge(user_id: current_user.id)
  end
end
