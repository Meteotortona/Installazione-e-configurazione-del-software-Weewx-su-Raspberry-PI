#/bin/bash

directory="/home/pi/meteo/output_data/"
realtime_in_file_name="realtime.txt"
parsed_file_path="dati_meteo.txt"
host=""
username=""
password=""
path=""

if [ -f $directory$realtime_in_file_name ]
then
    cd $directory
    /usr/bin/python /home/pi/meteo/parse.py $directory$realtime_in_file_name $directory$parsed_file_path
    if [ $? -eq 0 ]
    then
    	cd $directory
    	ftp -p -n $host << END_FTP
			quote USER $username
			quote PASS $password
			cd $path
			binary
			put $parsed_file_path
			bye
END_FTP
		cd
    fi
fi

exit 0
