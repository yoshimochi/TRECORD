class Public::RecordsController < ApplicationController
  before_action :authenticate_user!

  def new
    @record = Record.new
    @training_record = @record.training_records.build
  end

  def create
    @record = Record.new(record_params)
    if @record.save
      redirect_to record_path(@record)
      flash[:notice] = "記録に成功しました"
    else
      render :new
      flash[:danger] = "記録に失敗しました"
    end
  end

  def show
    @record = Record.find(params[:id])
  end
  
  def destroy
    record = Record.find(params[:id])
    record.destroy
    redirect_to root_path
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