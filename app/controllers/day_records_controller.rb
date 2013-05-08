class DayRecordsController < ApplicationController
	def destroy
      @day_record = DayRecord.find(params[:id])
      @day_record.destroy
    end
end