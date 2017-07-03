if $IsIntegrationTestingTask -eq "true" ; then
	echo "start Integration testing..."
	echo "BuildNumber=$TRAVIS_JOB_ID"
	#sendemail -f "$Email" -t "$Email" -u "Jenkins build by Travis" -m "BranchName=$TRAVIS_BRANCH\nBuildNumber=$TRAVIS_JOB_ID\nPullRequestNumber=$TRAVIS_PULL_REQUEST" -s smtp.gmail.com -o tls=yes -xu "$Email" -xp "$EmailPWD"
fi

sleep 120

for ((i=0; i<=10; i++)); do
buildEmailTitle=`curl -u $Email:$EmailPWD --silent "https://mail.google.com/mail/feed/atom/important" | awk -F '<title>' '{for (i=3; i<=NF; i++) {print $i"\n"}}' | awk -F '</title>' '{for (i=1; i<=NF; i=i+2) {print $i"\n"}}' | awk -F: '/^BuildNumber:'"$TRAVIS_JOB_ID"'/'`
echo "$buildEmailTitle"
if [ "$buildEmailTitle" == "" ]; then
	#wait
	echo "wait 60 sec"
	sleep 30
elif [ $i -eq "24" ] ; then
	echo "Integration testing : TIMEOUT!"
	exit 1
else
	buildResult=`echo | awk '{print test}' test="$buildEmailTitle" | awk -F: '/Fixed/||/Successful/'`
	#echo "$buildResult"
	if [ "$buildResult" == "" ]; then
		#build failed
		echo "$buildEmailTitle"
		exit 1
	else
		echo "Jenkins build Successful!"
		exit 0
	fi
fi
done


