if $IsIntegrationTestingTask -eq "true" ; then
	echo "start Integration testing..."
	sendemail -f "$Email" -t "$Email" -u "Jenkins build by Travis" -m "BranchName=$TRAVIS_BRANCH\nBuildNumber=$TRAVIS_JOB_ID\nPullRequestNumber=$TRAVIS_PULL_REQUEST" -s smtp.gmail.com -o tls=yes -xu "$Email" -xp "$EmailPWD"
fi



