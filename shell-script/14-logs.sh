#!/bin/bash
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
LOG_FOLDER="/var/log/shellscripts-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
LOG_FILE_NAME="$LOG_FOLDER/$LOG_FILE-$TIMESTAMP.log"
VALIDATE(){
     if [ $1 -ne 0 ];then 
    echo -e " $2 ...$R FAILURE"
    exit 1
    else 
    echo -e " $2  $G Success"
    fi
     
}
echo " Script started executing at $TIMESTAMP" &>>$OG_FILE_NAME
if [ "$USERID" -ne 0 ];then 
  echo "Error: you must have sudo privilge to install the package"
  exit 1 #other than 0
  fi
  dnf list installed mysql   &>>$OG_FILE_NAME
 if [ $? -ne 0 ] ;then
   dnf install mysql -y 
   VALIDATE $? "Installing MySql"
 else    
   echo -e " mysql already $Y INSTALLED" &>>$OG_FILE_NAME
   fi

   #Installing the git
   dnf list installed git &>>$OG_FILE_NAME
   if [ $? -ne 0 ] ;then
   dnf install git 
   VALIDATE $? "Installing Git"
    else 
     echo -e " Git already $Y installed "   
     fi

