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
    [Behavior, BehaviorInstance, Chart, ChartChannel, ClassroomAssignment, DayRecord, Metric, Note, PhaseLine, Slice, Student, Suptopic, Teacher, Topic, TopicSubtopic].each(&:delete_all)
    
    # Create a few teachers
    30.times do |i|
      @teacher = Teacher.new
      @teacher.first_name = Faker::Name.first_name
      @teacher.last_name = Faker::Name.last_name
      @teacher.title = Faker::Name.prefix
      @teacher.save!
    end

    # Assign the teachers to classrooms


  end # end task
end # close namespace