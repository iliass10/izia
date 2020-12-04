class ResultsController < ApplicationController

  def index
    
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

  def index
    @results = Result.all
  end

  private

  def result_params
    params.require(:result).permit(:metrics_id, :appointments_id, :value)
  end
end
