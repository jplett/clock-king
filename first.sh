apt-get install ruby
gem install greenletters

read -p "Enter IP Address: " ip_addy
chmod +x ~/configure-clock.rb
~/configure-clock.rb $ip_addy

read -p "Press enter to quit."
