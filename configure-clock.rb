#! /usr/bin/ruby

require 'greenletters'

unless ARGV.length == 1
  puts "incorrect usage. utility requires and only accepts IP of clock as an argument"
  exit
end

ip = ARGV.first
telnet = Greenletters::Process.new("telnet #{ip}", :transcript => $stdout)

puts "starting telnet connection to clock at #{ip}"
telnet.start!

telnet.wait_for(:output, /ZEM560 login:/)
telnet << "root\n"
telnet.wait_for(:output, /Password:/)
telnet << "key4zkusa\n"

exec = Proc.new do |cmd|
  telnet.wait_for(:output, /#/)
  telnet << cmd + "\n"
end

exec.call "mkdir -p /var/spool/cron/crontabs"
exec.call "echo \"0 3 * * * /sbin/reboot > /dev/null 2>&1\" > /var/spool/cron/crontabs/root"
exec.call "sed -i -e \"2icrond\" /etc/init.d/rcS"
exec.call "/sbin/reboot"
exec.call ""

telnet.kill!
puts "\ndone. clock should now be configured!"
