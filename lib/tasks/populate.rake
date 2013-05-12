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
    [Behavior, BehaviorInstance, Chart, ChartChannel, ClassroomAssignment, DayRecord, Metric, Note, PhaseLine, Slice, Student, Subtopic, Teacher, Topic, TopicSubtopic].each(&:delete_all)
    
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


  end # end task
end # close namespace