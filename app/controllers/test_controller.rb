class TestController < ApplicationController

  def show
    @test = Test.find(params[:id])
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    @test.save
    #rajouter conditions si ça ne réussit pas
    redirect_to test_path(@test)
  end

  def index
    tests = Test.all
  end

  private

  def result_params
    params.require(:test).permit(:name, :description, :value)
  end
end
