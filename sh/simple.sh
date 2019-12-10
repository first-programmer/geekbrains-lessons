fileName=$1;
upper=$2;
deleteBlankLines=$3;

if [[ $deleteBlankLines = "true" ]]
    then
	sed -ri "/^\s*$/d" $fileName;
fi

if [[ $upper = "true" ]]
    then
	sed -ri "s/(.+)/\U&/g" $fileName;
fi
