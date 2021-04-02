# frozen_string_literal: true

module Api
  module V1
    class FlavorsController < ApplicationController
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
  end
end
