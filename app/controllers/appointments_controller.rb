class AppointmentsController < ApplicationController

  def new
    @appointment = Appointment.new
    @appointment.test = Test.find_by_name("Test sanguin")
    @appointment.test.metrics.each do |metric|
      @appointment.results << Result.new(metric: metric)
    end
  end

  def create
    @appointment = Appointment.new(result_params)
    @appointment.save
    #rajouter conditions si ça ne réussit pas
    redirect_to result_path(@appointment)
  end

  def index
    @appointments = Appointment.all
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  private

  def result_params
    params.require(:appointment).permit(:user_id, :test_id, :datetime, result_attributes: [:metric_id, :value])
  end
end
