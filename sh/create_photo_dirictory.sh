#! /bin/bash
#set -x;

photoDirectory=${1:-"./temp/photos"};
numberFiles=${2:-10};
fileExtension=${3:-"txt"};

function createDirectories() {
    if [ ! -d $1 ]
        then
    	    mkdir $1;
    fi

    cd $1;
    
    echo "Enter interval of years, for example 1991..2017 to create folders: ";
    read yearsInterval;
    
    mkdir -p $(eval echo {$yearsInterval}/{01..12});
}

function createFiles(){
    regExp="./([0-9]{4})/([0-9]{2})";
    
    for folderName in `ls -R`; do
        if [[ $folderName =~ $regExp ]]
            then
                for (( fileNumber=1; fileNumber <= $1; fileNumber++ )); do
                    path=${BASH_REMATCH[0]};
	                fileName="$fileNumber-${BASH_REMATCH[1]}${BASH_REMATCH[2]}.$2";
	                
                    if  [ ! -f $path/$fileName ]
                        then
                        touch $path/$fileName;
                        echo "$path/$fileName" > $path/$fileName;
                    fi
                done
	    fi
    done
}

createDirectories $photoDirectory;
createFiles $numberFiles $fileExtension;
