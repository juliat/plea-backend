# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

input_channels = ['see', 'hear', 'free']
output_channels = ['point', 'say', 'mark']

input_channels.each do |channel_name|
	@channel = Channel.new
	@channel.is_input = true
	@channel.name = channel_name
	@channel.save!
end

output_channels.each do |channel_name|
	@channel = Channel.new
	@channel.is_input = false
	@channel.name = channel_name
	@channel.save!
end

6.times do |i|
	@classroom = Classroom.new
	@classroom.number = i.to_s
	@classroom.save!
end

default_metrics = [{'name' => 'corrects', 'symbol' => 'filled circle'},
				   {'name' => 'incorrects', 'symbol' => 'x'},
				   {'name' => 'floor', 'symbol' => 'horizontal line'},
				   {'name' => 'trials', 'symbol' => 'empty circle'}]

default_metrics.each do |metric|
	@metric = Metric.new
	@metric.name = metric['name']
	@metric.symbol = metric['symbol']
	@metric.save!
end