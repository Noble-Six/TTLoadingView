GREP_RETURN_CODE=0
for ((i=0; i<=20; i++)); do
	curl --silent ${QueryAddress} | grep result\":\"SUCCESS\" > /dev/null
	GREP_RETURN_CODE=$?
	echo "check success return code : $GREP_RETURN_CODE"
	if [ $GREP_RETURN_CODE -eq "0" ] ; then	
		exit 0
	fi
	curl --silent ${QueryAddress} | grep result\":\"FAILURE\" > /dev/null
	GREP_RETURN_CODE=$?
	echo "check failure return code : $GREP_RETURN_CODE"
	if [ $GREP_RETURN_CODE -eq "0" ] ; then	
		exit 1
	elif [ $i -eq "19" ] ; then
		# echo $GREP_RETURN_CODE
		exit 1
	else
		echo "sleep"
		sleep 60
	fi
done
