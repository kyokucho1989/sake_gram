class Api::V1::BrandsController < ApplicationController
  before_action :set_brand, only: %i[show]

  def show
    render json: [@brand.name, @brand.breweryId]
  end

  private

  def set_brand
    @brand = Brand.find(params[:id])
  end
end
