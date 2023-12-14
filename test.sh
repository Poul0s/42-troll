echo -e "Connecting to 10.124.82.24..."
echo -e "Connected to 10.124.82.24 succesfully"
echo -e "Collecting local browsing data for profile.intra..42.fr"
echo -e "Attempting to login into \e[31m$LOGNAME\e[0m's intra"
sleep 0.1
echo -e "\e[32mSUCCESS\e[0m"
sleep 0.2
echo -n "found api key :"
echo $RANDOM | md5sum | head -c 20; echo
sleep 0.4
echo "requesting new item from shop"
sleep 0.1
echo "" 
