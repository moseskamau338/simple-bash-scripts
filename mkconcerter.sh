#! /bin/bash
tput clear
echo "No Cross No Crown"
echo "www.facebook.com/moses"
echo "www.youtube.com/notyet"
tput cup 5 30
echo -e "\033[1m \033[31m Created By Moses Kamau \033[0m"


echo -e " \033[1m \033[35mNote:\033[0m This tool is used to convert videos to mp3"


read -p "Is it a single file or multiple? [single:1, multiple:2]" quantity

if [[ "${quantity}" = 1 ]]; 
then
	read -p "Enter path to file" file
	# checking if file exists or not
	if [ ! -f "$file" ];
	then
	    echo -e "\033[1m \033[31mfile doesn't exist, please check your path and try again\033[0m"
	    exit
	else
		echo "$file"

		read -p "Enter path to destination: " dest
		read -p "What do you want to call it?: " name

		ffmpeg -i $file -vn -ar 44100 -ac 2 -ab 192k -f mp3 "${dest}/${name}".mp3
	fi

elif [[ "${quantity}" = 2 ]]; 

	then
		read -p "Enter path to folder" folder

		# checking if folder exists or not
		if [ ! -d "$folder" ];
		then
		    echo -e "\033[1m \033[31mdirectory doesn't exists, please check your path and try again\033[0m"
		    exit

		else
			echo "$folder"
			read -p "Enter path to destination: " dest

			for i in $(ls $folder);   
			do 
				name=`echo $i | cut -d'.' -f1`;   
				echo $name;   
				ffmpeg -i "$i" "${name}.mp3";
			done

		fi

else
	echo -e "\033[1m \033[31mPlease chose a valid option next time.\033[0m"
    	exit
fi

