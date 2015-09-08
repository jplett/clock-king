echo "This will install ruby, greenletters, then run clock.sh"
echo "Press any key to continue."
read

apt-get install ruby
gem install greenletters

sh clock.sh
