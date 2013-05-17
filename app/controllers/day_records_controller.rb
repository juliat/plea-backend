class DayRecordsController < ApplicationController
	def destroy
      @day_record = DayRecord.find(params[:id])
      @day_record.destroy
    end

    def show
    	@day_record = DayRecord.find(params[:id])

		respond_to do |format|
      		format.json { render json: @day_record, :only => [:id, :date]}
      	end
	end
end