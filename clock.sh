chmod +x ~/configure-clock.rb
read -p "Enter IP Address: " ip_addy
y="y"
while [ $y != "N" ]
do
	~/configure-clock.rb $ip_addy
	read -p "Try again with the same IP? [Y/N] " y
done
