#! /bin/bash

# each Pomodoro lasts this long:
pomodoro_time=1500
pomodoro_message="Pomodoro Time is up!"

# each break lasts this long:
break_time=300
break_message="Pomodoro Break is up!"

function say_start {
  echo "started: `date "+%H:%M"`"
}

while [ true ]
do
  # pomodoro
  echo "\nPomodoro!"
  notify_command="growlnotify -s -m $pomodoro_message"
  say_start && sleep $pomodoro_time && $notify_command

  # break
  echo "\nBreak!"
  notify_command="growlnotify -s -m $break_message"
  say_start && sleep $break_time && $notify_command
done
