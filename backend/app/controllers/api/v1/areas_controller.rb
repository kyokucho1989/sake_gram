class Api::V1::AreasController < ApplicationController
  before_action :set_area, only: %i[show]

  def index
    render json: Area.all
  end

  def show
    render json: @area.name
  end

  private

  def set_area
    @area = Area.find(params[:id])
  end
end
  