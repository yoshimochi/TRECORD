class Public::TrainingRecordController < ApplicationController
  
  def destroy
    training_record = TrainingRecord.find(params[:id])
    training_record.destroy
    redirect_to root_path
  end
  
end
