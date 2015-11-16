# Desktop Notifier
  Ubuntu Desktop Notifier is simple script written in Ruby to remind users about a task through desktop notifications.
  It internally uses the notify-send plugin and cron jobs.

# Installation
  1. Clone the repo do your desired repository. Say '/home/user1/my_list'
  2. Change the line(7) in notifier.sh from "ruby /home/sakthivel/apps/desktop_notifier/ruby_notifier.rb" to "ruby /home/user1/my_list/desktop_notifier/ruby_notifier.rb"
  3. Change the line(13) in ruby_notifier.rb from "csv_contents = CSV.read("/home/sakthivel/apps/desktop_notifier/tasks.csv")[1 ..
-1]" to "csv_contents = CSV.read("/home/user1/my_list/desktop_notifier/tasks.csv")[1 .. -1]"
  4. Add the following line to the crontab file 
      */1 * * * * /home/user1/my_list/desktop_notifier/notifier.sh
  5. Add your tasks to the file tasks.csv
