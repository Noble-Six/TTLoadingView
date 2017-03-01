GREP_RETURN_CODE=0
for ((i=0; i<=10; i++)); do
	curl --silent ${TiggerAddress}/job/SDKTesterJenkins/lastBuild/api/json | grep result\":SUCCESS > /dev/null
	if [ $GREP_RETURN_CODE -eq "1" ] ; then	
		exit 0
	elif [ $i -eq "9" ] ; then
		exit 1
	else
		sleep 180
	fi
done
