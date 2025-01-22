#!/bin/bash
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOG_FOLDER="/var/log/shellscripts-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date '+%Y-%m-%d_%H-%M-%S')
LOG_FILE_NAME="$LOG_FOLDER/$LOG_FILE-$TIMESTAMP.log"
mkdir -p "$LOG_FOLDER"
VALIDATE(){
     if [ $1 -ne 0 ];then 
    echo -e " $2 ...$R FAILURE"
    exit 1
    else 
    echo -e " $2  $G Success"
    fi
     
}
echo " Script started executing at $TIMESTAMP" &>> "$LOG_FILE_NAME"
CHECK_ROOT(){
if [ "$USERID" -ne 0 ];then 
  echo "Error: you must have sudo privilge to install the package"
  exit 1 #other than 0
  fi
}
 CHECK_ROOT
     
     for package in $@
     do 
       dnf list installed  $package &>> "$LOG_FILE_NAME"
       if [ $? -eq 0 ]; then
	  echo -e "$package is alreay $Y iNSTALLED"
       else 	  
         dnf install $package -y  &>> "$LOG_FILE_NAME"
	if [ $? -ne 0 ];then 
		echo -e "$package is $R Not available  $N to install"
        fi
       fi
        done    

