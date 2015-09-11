PKG_OK=$(dpkg-query -W --showformat='${Status}\n' ruby|grep "installed")
if [ "$PKG_OK" != "install ok installed" ] ; then
	echo "No ruby. Setting up ruby."
	apt-get --force-yes --yes install ruby
	gem install greenletters
	echo ""
fi

## this is the clock code.

chmod +x ~/configure-clock.rb
read -p "Set base IP (eg 192.168.1): " base_ip
read -p "Add other stuff (eg 4): " ip_addy
ip_addy=$base_ip"."$ip_addy

y="y"
while [ $y != "q" ]
do
	echo "Running $ip_addy"
	~/configure-clock.rb $ip_addy
	echo ""
	read -p "Enter new IP (beginning $base_ip) or q to quit " y
	ip_addy=$base_ip"."$y
	echo ""
done
