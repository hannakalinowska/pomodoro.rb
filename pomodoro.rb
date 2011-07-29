#! /usr/bin/ruby

require 'ostruct'

pomodoro = OpenStruct.new(:time => 1500, :message => 'Pomodoro Time is up!')
pause = OpenStruct.new(:time => 300, :message => 'Pomodoro Break is up!')
notifier = 'growlnotify -s -m '

def say_start
  puts "started: #{Time.now.strftime('%H:%M')}"
end

def progress(time, number_of_chunks)
  chunk = 1.0 * time / number_of_chunks
  1.upto(number_of_chunks) do |i|
    print "|"
    print '=' * i
    print ' ' * (number_of_chunks - i)
    print "|\r"
    STDOUT.flush
    sleep chunk
  end
end

loop do
  puts "\nPomodoro!"
  say_start
  progress(pomodoro.time, 20)
  `#{notifier} #{pomodoro.message}`

  puts "\nBreak!"
  say_start
  progress(pomodoro.time, 20)
  `#{notifier} #{pause.message}`
end
