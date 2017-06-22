if $IsIntegrationTestingTask -eq "true" ; then
	echo "start Integration testing..."
	sendemail -f "$Email" -t "$Email" -u "Jenkins build $TRAVIS_BRANCH" -m "pull request:$TRAVIS_PULL_REQUEST" -s smtp.gmail.com -o tls=yes -xu "$Email" -xp "$EmailPWD"
fi



