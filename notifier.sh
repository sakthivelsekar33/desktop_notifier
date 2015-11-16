#!/bin/bash
username=$(/usr/bin/whoami)
pid=$(pgrep -u $username nautilus)
dbus=$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$pid/environ | sed 's/DBUS_SESSION_BUS_ADDRESS=//' )
export DBUS_SESSION_BUS_ADDRESS=$dbus
ruby /home/sakthivel/apps/desktop_notifier/ruby_notifier.rb
