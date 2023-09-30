# rails_training/rails7-api-sqlite-rspec-template02/app/controllers/samples_controller.rb
class SamplesController < ApplicationController

  # GET /samples
  def index
    @samples = Sample.all

    render json: @samples
  end


  # POST /samples
  def create
    @sample = Sample.new(sample_params)

    if @sample.save
      render json: @sample, status: :created
    else
      render json: @sample.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sample
      @sample = Sample.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sample_params
      params.require(:sample).permit(:title)
    end
end
