PKG_OK=$(dpkg-query -W --showformat='${Status}\n' ruby|grep "installed")
if [ "$PKG_OK" != "install ok installed" ] ; then
	echo "No ruby. Setting up ruby."
	apt-get --force-yes --yes install ruby
	gem install greenletters
	echo ""
fi

## this is the clock code.

chmod +x ~/configure-clock.rb
read -p "Enter IP Address: " ip_addy
y="y"
while [ $y != "N" ]
do
	echo ""
	~/configure-clock.rb $ip_addy
	echo ""
	read -p "Try again with $ip_addy? [Y/N] " y
	echo ""
done
