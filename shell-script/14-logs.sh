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
if [ "$USERID" -ne 0 ];then 
  echo "Error: you must have sudo privilge to install the package"
  exit 1 #other than 0
  fi
  dnf list installed mysql   &>> "$LOG_FILE_NAME"
 if [ $? -ne 0 ] ;then
   dnf install mysql -y &>> "$LOG_FILE_NAME"
   VALIDATE $? "Installing MySql"
 else    
   echo -e " mysql already $Y INSTALLED" 
   fi

   #Installing the git
   dnf list installed git  &>> "$LOG_FILE_NAME"
   if [ $? -ne 0 ] ;then
   dnf install git -y &>> "$LOG_FILE_NAME" 
   VALIDATE $? "Installing Git"
   else 
     echo -e "$N Git already $Y INSTALLED"   
     fi

