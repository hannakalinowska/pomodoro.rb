#! /usr/bin/ruby

require 'ostruct'

pomodoro = OpenStruct.new(:time => 4, :message => 'Pomodoro Time is up!')
pause = OpenStruct.new(:time => 2, :message => 'Pomodoro Break is up!')
notifier = 'growlnotify -s -m '

def say_start
  puts "started: #{Time.now.strftime('%H:%M')}"
end

loop do
  puts 'Pomodoro!'
  say_start
  sleep pomodoro.time
  `#{notifier} #{pomodoro.message}`

  puts 'Break!'
  say_start
  sleep pause.time
  `#{notifier} #{pause.message}`
end
