class ChartsController < ApplicationController
	before_action :set_chart, only:[:show, :edit, :update, :destroy]
	
	def index
		@charts = Chart.all
	end

	def show
	end

	def new
	end

	def create
	end

	def edit
	end

	def update
	end

	def destroy
	end
	
	private
	def set_chart
		@chart = chart.find(params[:id])
	end
end