require 'test_helper'

class ChartTest < ActiveSupport::TestCase

	# shoulda tests can go here

	# FactoryGirl Tests
	# ========================================================
	# setup a context for the test
	setup do
		@topic = FactoryGirl.create(:topic)
		@subtopic = FactoryGirl.create(:subtopic)
		@student = FactoryGirl.create(:student)
		@chart = FactoryGirl.create(:chart, :student => @student, :topic => @topic, :subtopic => @subtopic)
		# create associated channels
		@channel1 = FactoryGirl.create(:channel, :is_input => true, :name => "see")
		@channel2 = FactoryGirl.create(:channel, :is_input => false, :name => "touch")
		@chart_channel_1 = FactoryGirl.create(:chart_channel, :chart => @chart, :channel => @channel1)
		@chart_channel_2 = FactoryGirl.create(:chart_channel, :chart => @chart, :channel => @channel2)
		# create associated day records
		@day1 = FactoryGirl.create(:day_record, :date => 26.days.ago, :chart => @chart)
		@day2 = FactoryGirl.create(:day_record, :date => 25.days.ago, :chart => @chart)
		@day3 = FactoryGirl.create(:day_record, :date => 24.days.ago, :chart => @chart)
	end
	# provide a teardown method
	teardown do
		@topic.destroy
		@subtopic.destroy
		@student.destroy
		@chart.destroy
		@channel1.destroy
		@channel2.destroy
		@chart_channel_1.destroy
		@chart_channel_2.destroy
		@day1.destroy
		@day2.destroy
		@day3.destroy
	end

	# tests
	should "show that the factory was set up correctly" do
		assert_equal "Mark", @student.first_name
		assert_equal [26.days.ago, 25.days.ago, 24.days.ago], DayRecord.where("chart_id = ?", @chart.id).map{|day_record| day_record.date}
		assert_equal "see", @channel1.name
	end
end
