class ResultsController < ApplicationController

  def index
    @results = Result.all
  end


  def show
    @result = Result.find(params[:id])
  end

  def new
    @result = Result.new
  end

  def create
    @result = Result.new(result_params)
    @result.save
    #rajouter conditions si ça ne réussit pas
    redirect_to result_path(@result)
  end

  private

  def result_params
    params.require(:result).permit(:metric_id, :appointment_id, :value)
  end
end
