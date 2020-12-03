class ResultsController < ApplicationController

  def show
    @result = Result.find(params[:id])
<<<<<<< HEAD
=======
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
    params.require(:result).permit(:metrics_id, :appointments_id, :value)
>>>>>>> 03d1078179c773fe2aa3b4178026fbc48d7ffaa9
  end
end
