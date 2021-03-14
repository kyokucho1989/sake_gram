class Api::V1::FlavorsController < ApplicationController
  before_action :set_fravor, only: %i[show]

  def index
    @flavor = Flavor.all
    render json: @flavor
  end

  def show
    render json: @flavor
  end

  private
  def set_fravor
    @flavor = Flavor.find(params[:id])
  end
end
