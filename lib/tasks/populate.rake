namespace :db do
  desc "Erase and fill database"
  # creating a rake task within db namespace called 'populate'
  # executing 'rake db:populate' will cause this script to run
  task :populate => :environment do
    # Invoke rake db:migrate just in case...
    Rake::Task['db:migrate'].invoke
    
    # Need two gems to make this work: faker & populator
    # Docs at: http://populator.rubyforge.org/
    require 'populator'
    # Docs at: http://faker.rubyforge.org/rdoc/
    require 'faker'
    
    # Step 0: clear any old data in the db
    [Behavior, BehaviorInstance, Chart, ChartChannel, ClassroomAssignment, DayRecord, Metric, Note, PhaseLine, Slice, Student, StudentBehavior, Subtopic, Teacher, Topic, TopicSubtopic].each(&:delete_all)
    
    # Create a few teachers
    30.times do |i|
      @teacher = Teacher.new
      @teacher.first_name = Faker::Name.first_name
      @teacher.last_name = Faker::Name.last_name
      @teacher.title = Faker::Name.prefix
      @teacher.save!
    end

    # Assign the teachers to classrooms and create a user account for each of them
    Teacher.all.each do |teacher|
      @classroom_assignment = ClassroomAssignment.new
      @classroom_assignment.person_type = "Teacher"
      @classroom_assignment.person_id = teacher.id
      @classroom_assignment.classroom_id = Classroom.all.sample.id
      @classroom_assignment.start_date = 6.months.ago.to_date
      @classroom_assignment.save!

      @user = User.new
      @user.email = Faker::Internet.email
      @user.password = "testtest"
      @user.password_confirmation = "testtest"
      @user.save!
      teacher.user_id = @user.id
      teacher.save!
    end

    # Add Students - between 3 and 6 per class
    Classroom.all.each do |classroom|
      num_students = rand(3..6).to_i
      num_students.times do |i|
        @student = Student.new
        @student.first_name = Faker::Name.first_name
        @student.last_name = Faker::Name.last_name
        age = rand(4..17)
        @student.date_of_birth = age.years.ago.to_date
        @student.save!

        @classroom_assignment = ClassroomAssignment.new
        @classroom_assignment.person_type = "Student"
        @classroom_assignment.person_id = @student.id
        @classroom_assignment.classroom_id = classroom.id
        @classroom_assignment.start_date = 6.months.ago.to_date
        @classroom_assignment.save!
      end
    end

    # Create topics and subtopics
    topics = [
      {'name' => 'imitation',
       'subtopics' => ['hand motions', 'facial expressions']
      },
      {'name' => 'language',
       'subtopics' => ['letters', 'phonemes', 'cv blends', '1-5 syllable words', 'safety words', 'categories', 'colors', 'verbs']
      },
      {'name' => 'reading',
       'subtopics' => ['sentences', 'sounding out words']
      }, 
      {'name' => 'math',
       'subtopics' => ['counting', 'addition', 'subtraction']
      },     
      {'name' => 'wellness',
       'subtopics' => ['coordination', 'balance', 'speed']
      },
      {'name' => 'writing',
       'subtopics' => ['drawing letters', 'writing phrases', 'writing sentences']
      }
    ]
    topics.each do |t|
      @topic = Topic.new
      @topic.name = t['name']
      @topic.save!

      t['subtopics'].each do |s|
        @subtopic = Subtopic.new
        @subtopic.name = s
        @subtopic.save!

        @topic_subtopic = TopicSubtopic.new
        @topic_subtopic.topic_id = @topic.id
        @topic_subtopic.subtopic_id = @subtopic.id
        @topic_subtopic.save!
      end
    end

    # Create a few charts with channels for each student
    Student.all.each do |s|
      num_charts = rand(2..5)
      num_charts.times do |i|
        @chart = Chart.new
        @chart.student_id = s.id
        @chart.start_date = 4.weeks.ago
        topic = Topic.all.sample
        @chart.topic_id = topic.id
        @chart.subtopic_id = Subtopic.for_topic(topic.id).sample.id
        @chart.save!

        in_channel = Channel.inputs.sample.id
        out_channel = Channel.outputs.sample.id

        @chartchannel_in = ChartChannel.new
        @chartchannel_in.channel_id = in_channel
        @chartchannel_in.chart_id = @chart.id
        @chartchannel_in.save!

        @chartchannel_out = ChartChannel.new
        @chartchannel_out.channel_id = out_channel
        @chartchannel_out.chart_id = @chart.id
        @chartchannel_out.save!
      end
    end

    # Create records and metrics for the charts

    # Create behaviors
    behaviors = [
      {'name' => 'biting', 'code' => 'B'},
      {'name' => 'slapping', 'code' => 'SL'},
      {'name' => 'shouting', 'code' => 'SH'},
      {'name' => 'hair pulling', 'code' => 'HP'},
      {'name' => 'throwing', 'code' => 'TH'}
    ]
    behaviors.each do |b|
      @behavior = Behavior.new
      @behavior.name = b['name']
      @behavior.code = b['code']
      @behavior.save!
    end

    # associate behaviors with students and create instances of those behaviors
    Student.all.each do |s|
      num_behaviors = rand(1..5)
      num_behaviors.times do |i|
        @student_behavior = StudentBehavior.new
        @student_behavior.behavior_id = Behavior.all.sample.id
        @student_behavior.student_id = s.id
        @student_behavior.save!

        num_instances = rand(2..25)
        num_instances.times do |i|
          @behavior_instance = BehaviorInstance.new
          days_ago = rand(1..30)
          @behavior_instance.date = days_ago.days.ago.to_date
          @behavior_instance.time = BehaviorInstance::TIMES.sample
          @behavior_instance.student_behavior_id = @student_behavior.id
          @behavior_instance.save!
        end
      end
    end

  end # end task
end # close namespace