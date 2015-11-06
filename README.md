# clock_king

first.sh checks for Ruby and greenletters gem. If it doesn't find them, it installs them.
It then asks for the IP address of a ZK US10C unit, and runs a script to telnet into the device and apply a rule to reset the clock at a certain time (eg 3:00 AM).

configure-clock.rb is a script to telnet into a clock as above.

clocks.sh is a stand-alone script that doesn't check for Ruby and assumes its there. It can be ignored.

dartigula is jplett.
