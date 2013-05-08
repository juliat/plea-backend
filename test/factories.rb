FactoryGirl.define do
	factory :behavior do
		association :student
		name "happy slap"
		code "HS"
	end
	factory :behavior_instance do
		association :behavior
		date 1.day.ago
		time "08:30"
	end
	factory :channel do
		is_input true
		name "see"
	end
	factory :chart do
		start_date 2.months.ago
		end_date 1.month.ago
		name "That one chart"
		association :student
		association :subtopic
		association :topic
	end
	factory :chart_channel do
		association :chart
		association :channel
	end
	factory :classroom do
		number 4
	end
	factory :classroom_assignment do
		association :classroom
		# by default, assignments are for students
		association :assignable, :factory => :student
		start_date 6.months.ago
		end_date nil
	end
	factory :day_record do
		date 2.weeks.ago
		association :chart
	end
	factory :metric do
		association :day_record
		name "corrects"
		symbol "filled-circle"
		value 42
	end
	factory :note do
		text "A note about something remarkable."
		# by default, notes are about metrics
		association :notable, :factory => :metric
	end
	factory :phase_line do
		association :day_record
		title "Spring Break"
	end
	factory :slice do
		name "A, Q, L, E"
		association :phase_line
	end
	factory :student do
		first_name "Mark"
		last_name "Johnson"
		date_of_birth 10.years.ago
	end
	factory :subtopic do
		name "letters"
	end
	factory :teacher do
		first_name "Laura"
		last_name "Wilson"
		title "Ms."
	end
	factory :topic do
		number 3
		name "language"
	end
	factory :topic_subtopic do
		association :topic
		association :subtopic
	end
end