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
    redirect_to appointments_path(@appointment)
  end

  def index
    @appointments = Appointment.all
  end

  def show
    @appointment = Appointment.find(params[:id])
    results = @appointment.results
    @glycemie_check = metrics_check(results[0])
    @cholesterol_check = metrics_check(results[1])
    @transaminases_check = metrics_check(results[2])
    @creatinine_check = metrics_check(results[3])
  end

  private

  def metrics_check(result)
    case result.metric.name
    when "Glycémie"
      result.value > 1.1 ? 'arrow-down' : 'check'
    when "Cholestérol"
      result.value > 2 ? 'arrow-up' : 'check'
    when "Transaminases"
      result.value > 50 ? 'arrow-down' : 'check'
    when "Créatinine sanguine"
      result.value > 110 ? 'arrow-up' : 'check'
    end
  end

  def result_params
    params.require(:appointment).permit(:user_id, :test_id, :datetime, result_attributes: [:metric_id, :value])
  end
end
