GREP_RETURN_CODE=0
sleep 30
for ((i=0; i<=20; i++)); do
	curl --silent ${QueryAddress} | grep result\":\"SUCCESS\" > /dev/null
	GREP_RETURN_CODE=$?
	
	if [ $GREP_RETURN_CODE -eq "0" ] ; then
		echo "check local build result return : SUCCESS1"	
		exit 0
	fi
	curl --silent ${QueryAddress} | grep result\":\"FAILURE\" > /dev/null
	GREP_RETURN_CODE=$?
	if [ $GREP_RETURN_CODE -eq "0" ] ; then	
		echo "check local build result return : FAILURE111adfsadf1"
		exit 1
	elif [ $i -eq "19" ] ; then
		echo "check local build result return : TIMEOUT"
		exit 1
	else
		echo "sleep 120sec"
		sleep 120
	fi
done
