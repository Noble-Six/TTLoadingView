GREP_RETURN_CODE=0
echo ${QueryAddress}
for ((i=0; i<=20; i++)); do
	curl --silent ${QueryAddress} | grep result\":\"SUCCESS\" > /dev/null
	GREP_RETURN_CODE=$?
	echo "return code : $GREP_RETURN_CODE"
	if [ $GREP_RETURN_CODE -eq "0" ] ; then	
		exit 0
	elif [ $i -eq "19" ] ; then
		# echo $GREP_RETURN_CODE
		exit 1
	else
		echo "sleep"
		sleep 60
	fi
done
