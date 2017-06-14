
if $IsIntegrationTestingTask -eq "true" ; then
	echo "start Integration testing..."
	curl -XPOST --silent --show-error --user panzh:fb7c5baed9140e057133a557d2af4674 https://d35f8f14.ngrok.io/job/SDKTesterJenkins/buildWithParameters
fi

echo "$TRAVIS_BRANCH"
