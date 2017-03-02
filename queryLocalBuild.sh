GREP_RETURN_CODE=0
for ((i=0; i<=20; i++)); do
	curl --silent ${TiggerAddress}/job/SDKTesterJenkins/lastBuild/api/json | grep result\":SUCCESS > /dev/null
	if [ $GREP_RETURN_CODE -eq "1" ] ; then	
		exit 0
	elif [ $i -eq "19" ] ; then
		# echo $GREP_RETURN_CODE
		exit 1
	else
		echo "sleep"
		sleep 60
	fi
done
