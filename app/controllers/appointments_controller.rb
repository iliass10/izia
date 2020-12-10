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
    @appointment.user = current_user
    @appointment.test = Test.find_by_name("Test sanguin")
    if @appointment.save
      result_glycemie = params[:appointment][:results_attributes]["0"]
      Result.create!(appointment: @appointment, metric_id: result_glycemie[:metric_id], value: result_glycemie[:value].to_f)
      result_cholesterol = params[:appointment][:results_attributes]["1"]
      Result.create!(appointment: @appointment, metric_id: result_cholesterol[:metric_id], value: result_cholesterol[:value].to_f)
      result_transaminases = params[:appointment][:results_attributes]["2"]
      Result.create!(appointment: @appointment, metric_id: result_transaminases[:metric_id], value: result_transaminases[:value].to_f)
      result_creatinine_sanguine = params[:appointment][:results_attributes]["3"]
      Result.create!(appointment: @appointment, metric_id: result_creatinine_sanguine[:metric_id], value: result_creatinine_sanguine[:value].to_f)
      redirect_to appointment_path(@appointment)
    else
      render "new"
    end
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
    params.require(:appointment).permit(:datetime)
    #result_attributes: [:metric_id, :value]
  end
end
