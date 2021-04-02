# frozen_string_literal: true

module Api
  module V1
    class BrandsController < ApplicationController
      before_action :set_brand, only: %i[show]

      def show
        render json: [@brand.name, @brand.breweryId]
      end

      private

      def set_brand
        @brand = Brand.find(params[:id])
      end
    end
  end
end
