class AppointmentController < ApplicationController

  def new
    @appoitment = Appointment.new
  end

  def create
    @appoitment = Appointment.new(result_params)
    @appointment.save
    #rajouter conditions si ça ne réussit pas
    redirect_to result_path(@appointment)
  end

  private

  def result_params
    params.require(:appointment).permit(:user_id, :test_id, :datetime)
  end

end
