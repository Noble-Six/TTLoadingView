
if $IsIntegrationTestingTask -eq "true" ; then
	echo "start Integration testing..."
	#- curl -XPOST --silent --show-error --user ${TiggerUser}:${TiggerToken} ${TiggerAddress}
fi

GREP_RETURN_CODE=0
sleep 30
for ((i=0; i<=20; i++)); do
	curl --silent ${QueryAddress} | grep result\":\"SUCCESS\" > /dev/null
	GREP_RETURN_CODE=$?
	
	if [ $GREP_RETURN_CODE -eq "0" ] ; then
		echo "Integration testing SUCCESS !"	
		exit 0
	fi
	curl --silent ${QueryAddress} | grep result\":\"FAILURE\" > /dev/null
	GREP_RETURN_CODE=$?
	if [ $GREP_RETURN_CODE -eq "0" ] ; then	
		echo "Integration testing FAILURE !"
		exit 1
	elif [ $i -eq "19" ] ; then
		echo "Integration testing : TIMEOUT"
		exit 1
	else
		echo "wait 60sec."
		sleep 60
	fi
done
