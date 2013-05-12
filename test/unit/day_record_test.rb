require 'test_helper'

class DayRecordTest < ActiveSupport::TestCase
	setup do 
		@chart = FactoryGirl.create(:chart, :name => "language_letters")
		# by default chart starts 1 month ago
		@day_record = FactoryGirl.create(:day_record, :date => 26.days.ago.to_date, :chart => @chart)
	end

	teardown do
		# not even trying this time, rails
	end

	should "show that a day record is properly created" do
		assert_equal 26.days.ago.to_date, @day_record.date
		assert_equal "language_letters", @day_record.chart.name
	end
end
