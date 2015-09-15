PKG_OK=$(dpkg-query -W --showformat='${Status}\n' ruby|grep "installed")
if [ "$PKG_OK" != "install ok installed" ] ; then
	echo "No ruby. Setting up ruby."
	apt-get --force-yes --yes install ruby
	gem install greenletters
	echo ""
fi

## this is the clock code.

chmod +x ~/configure-clock.rb
echo ""
a="y"
while [ $a != "n" ] ##this while loop lets the user set the "base" IP and the last octet. This will be used in next loop
do
	y="y"
	read -p 'Set first 3 octets of IP (eg "192.168.1"): ' base_ip
	read -p 'Set last octet (eg "4"): ' ip_addy
	ip_addy=$base_ip"."$ip_addy	
	while [ $y != "q" ] ## this loop runs the configure-clock.rb, and lets the user retry with a new last-octet or drop to the last loop
	do
		echo "Now trying $ip_addy"
		echo ""
		~/configure-clock.rb $ip_addy
		echo ""
		read -p "Enter new IP (beginning $base_ip) or q to restart: " y
		ip_addy=$base_ip"."$y
		echo ""
	done
	read -p "Restart [y/n]? " y
done
