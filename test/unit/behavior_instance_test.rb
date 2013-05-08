require 'test_helper'

class BehaviorInstanceTest < ActiveSupport::TestCase
	# shoulda tests can go here

	# FactoryGirl Tests
	# ========================================================
	# setup a context for the test
	setup do
		@behavior_instance = FactoryGirl.create(:behavior_instance)
	end

	teardown do
		@behavior_instance.destroy!
	end


	should "show that the BehaviorInstance factory was set up correctly" do
		assert_equal 1.day.ago.to_date, @behavior_instance.date
	end
end
