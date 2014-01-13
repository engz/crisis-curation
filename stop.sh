#! /bin/bash

COLOR='\e[0;32m'
NC='\e[0m'

folder_mongo_root='/home/quicksilver/mongodb'
folder_crisisServer_root='/home/quicksilver/Documents/crisis-curation'


##### STARTING historicalTweets.py
echo -e "${COLOR}Checking for running instance of historicalTweets.py${NC}"
historicalTweets_running=`pgrep -f historicalTweets.py | wc -l`
if [[ $historicalTweets_running == 0 ]]
then  	echo -e "${COLOR}historicalTweets.py is not running${NC}"
	echo -e "${COLOR}Proceeding with execution...${NC}"
else	echo -e "${COLOR}Running instance of historicalTweets.py detected.${NC}"
	echo -e "${COLOR}Killing existing instance...${NC}"
	pgrep -f historicalTweets.py | xargs kill
fi
echo -e "${COLOR}Historical Tweets instance killed${NC}"


##### STOPPING crisisServer.py
echo -e "${COLOR}Checking for running instance of crisisSever${NC}"
crisisServer_running=`pgrep -f crisisServer.py | wc -l`
if [[ $crisisServer_running == 0 ]]
then  	echo -e "${COLOR}crisisServer is not running${NC}"
	echo -e "${COLOR}Proceeding with execution...${NC}"
else	echo -e "${COLOR}Running instance of crisisServer detected.${NC}"
	echo -e "${COLOR}Killing existing instance...${NC}"
	pgrep -f crisisServer.py | xargs kill
fi
echo -e "${COLOR}Crisis Server instance killed.${NC}"


###### STOP MONGOD
echo -e "${COLOR}Checking for running instance of Mongo DB server.${NC}"
mongod_running=`pgrep -f mongod | wc -l`
if [[ $mongod_running == 0 ]]
then  	echo -e "${COLOR}Mongo DB server is not running${NC}"
	echo -e "${COLOR}Proceeding with execution...${NC}"
else	echo -e "${COLOR}Running instance of Mongo DB server detected.${NC}"
	sudo ${folder_mongo_root}/bin/mongod --shutdown
	echo -e "${COLOR}Stopped Mongo DB server${NC}"
fi
