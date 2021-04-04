# frozen_string_literal: true

module Api
  module V1
    class SakedataController < ApplicationController
      before_action :set_sakedatum, only: %i[show update destroy]

      def index
        @sakedata = Sakedatum.all
        render json: @sakedata
      end

      def show
        render json: @sakedatum
      end

      def create
        @sakedatum = Sakedatum.new(sakedatum_params)
        @sakedata = @sakedatum.annoy # 近似最近傍探索sakedatum.rb
        if @sakedatum.save
          render json: @sakedata
        else
          render json: @sakedatum.errors, status: :bad_request
        end
      end

      private

      def set_sakedatum
        @sakedatum = sakedatum.find(params[:id])
      end

      def sakedatum_params
        params.require(:sakedatum).permit(:sakedata)
      end
    end
  end
end
