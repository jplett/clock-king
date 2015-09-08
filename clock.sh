chmod +x ~/configure-clock.rb
read -p "Enter IP Address: " ip_addy

~/configure-clock.rb $ip_addy

echo "Press any key to quit."
echo ""
read 
