require 'test_helper'

class ChartTest < ActiveSupport::TestCase

	# shoulda tests can go here

	# FactoryGirl Tests
	# ========================================================
	# setup a context for the test
	setup do
		# first chart
		@topic = FactoryGirl.create(:topic)
		@subtopic = FactoryGirl.create(:subtopic)
		@student1 = FactoryGirl.create(:student)
		@language_letters_chart = FactoryGirl.create(:chart, :name => "language letters", :student => @student1, :topic => @topic, :subtopic => @subtopic)
		
		# a second chart
		@topic2 = FactoryGirl.create(:topic, :name => "colors")
		@subtopic2 = FactoryGirl.create(:subtopic, :name => "primary colors")
		@colors_chart = FactoryGirl.create(:chart, :name => "colors", :student => @student1, :topic => @topic2, :subtopic => @subtopic2)

		# create associated channels
		@channel1 = FactoryGirl.create(:channel, :is_input => true, :name => "see")
		@channel2 = FactoryGirl.create(:channel, :is_input => false, :name => "touch")
		@chart_channel_1 = FactoryGirl.create(:chart_channel, :chart => @chart, :channel => @channel1)
		@chart_channel_2 = FactoryGirl.create(:chart_channel, :chart => @chart, :channel => @channel2)

		# create associated day records
		#@day1 = FactoryGirl.create(:day_record, :date => 26.days.ago, :chart => @chart)
		#@day2 = FactoryGirl.create(:day_record, :date => 25.days.ago, :chart => @chart)
		#@day3 = FactoryGirl.create(:day_record, :date => 24.days.ago, :chart => @chart)
	end
	
	# provide a teardown method
	teardown do
#		@topic.destroy
#		@topic2.destroy
#		@subtopic.destroy
#		@subtopic2.destroy
#		@student1.destroy
#		@language_letters_chart.destroy
#		@colors_chart.destroy
#		@channel1.destroy
#		@channel2.destroy
#		@chart_channel_1.destroy
#		@chart_channel_2.destroy
#		@day1.destroy
#		@day2.destroy
#		@day3.destroy
	end

	# tests
	should "show that the factory was set up correctly" do
		assert_equal "Mark", @student1.first_name
		# assert_equal [26.days.ago, 25.days.ago, 24.days.ago], DayRecord.where("chart_id = ?", @language_letters_chart.id).map{|day_record| day_record.date}
		assert_equal "see", @channel1.name
	end

	should "show that student 1 (mark) has two charts" do
		returned_charts = Chart.alphabetical.for_student(@student1.id).map{|c| c.name}
		test_chart_names = ['colors', 'language letters']
		assert_equal test_chart_names, returned_charts
	end
end
