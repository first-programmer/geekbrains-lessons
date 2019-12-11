fileName=${1:-"./files/file.txt"};
deleteBlankLines=${2:-"true"};

echo "This is text before editing: ";
cat $fileName;

if [[ $deleteBlankLines = "true" ]]
    then
	    sed -Ei "/^\s*$/d" $fileName;
fi

echo "If you want change file text case to UPPER write yes otherwise write no: "
read upper;

if [[ $upper = "yes" ]]
    then
	    sed -Ei "s/(.+)/\U&/g" $fileName;
	else
	    sed -Ei "s/(.+)/\L&/g" $fileName;
fi

echo "This is text after editing: ";
cat $fileName;