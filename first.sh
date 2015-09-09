# This will install ruby, greenletters, then run clock.sh

PKG_OK=$(dpkg-query -W --showformat='${Status}\n' ruby|grep "installed")
#echo "Checking for ruby."
if [ "$PKG_OK" != "install ok installed" ] ; then
	echo "No ruby. Setting up ruby."
	apt-get --force-yes --yes install ruby
	gem install greenletters
	echo ""
fi
#echo "Ruby installed."

#dogs will print a number of blank lines less than cats

#dogs=0
#cats=2
#while [ $dogs -lt $cats ]
#do
#	echo ""
#	dogs=$(( dogs+1 ))
#done

## this is the clock code.

chmod +x ~/configure-clock.rb
read -p "Enter IP Address: " ip_addy
y="y"
while [ $y != "N" ]
do
	echo ""
	~/configure-clock.rb $ip_addy
	echo ""
	read -p "Try again with the same IP? [Y/N] " y
done
