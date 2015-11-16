#!/usr/bin/env ruby

require 'csv'

class Notify
  attr_accessor :ctime

  def initialize
    self.ctime = Time.now
  end

  def notify
    csv_contents = CSV.read("/home/sakthivel/apps/desktop_notifier/tasks.csv")[1 .. -1]
    csv_contents.each do |row|
      next if row.empty?
      if daily_notification?(row) && time_matches?(row)
        send_notification(row[3], row[4])
      elsif date_time_matches?(row)
        send_notification(row[3], row[4])
      end
    end
  end

  private

  def daily_notification?(row)
    ['yes','y'].include?(row[5].downcase)
  end

  def time_matches?(row)
    ctime.hour == row[1].to_i && ctime.min == row[2].to_i
  end

  def date_time_matches?(row)
    cdate = ctime.strftime('%m/%d/%Y')
    cdate == row[0] && time_matches?(row)
  end

  def send_notification(summary, body)
    %x(notify-send --urgency=critical #{summary} #{body})
  end

end

Notify.new.notify
