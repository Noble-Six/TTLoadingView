
if $IsIntegrationTestingTask -eq "true" ; then
	echo "start Integration testing..."
	curl -XPOST --silent --show-error --user ${TiggerUser}:${TiggerToken} ${TiggerAddress}
fi

echo "$TRAVIS_BRANCH"
