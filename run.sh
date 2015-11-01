#!/bin/bash
export DISPLAY=:0
cd $(dirname $0)
java -jar selenium-server-standalone.jar &
/sbin/start-stop-daemon --start --quiet --pidfile /var/run/xvfb.pid --make-pidfile --background --exec /usr/bin/Xvfb -- $DISPLAY -ac -screen 0 1024x768x16 +extension RANDR
sleep 5
bundle exec ./reset.rb
kill $(pgrep java)
