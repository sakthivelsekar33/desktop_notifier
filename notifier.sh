#!/bin/bash
username=$(/usr/bin/whoami)
pid=$(pgrep -u $username nautilus)
dbus=$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$pid/environ | sed 's/DBUS_SESSION_BUS_ADDRESS=//' )
export DBUS_SESSION_BUS_ADDRESS=$dbus
ruby ./ruby_notifier.rb
