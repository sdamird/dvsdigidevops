#!/bin/bash
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
VALIDATE(){
     if [ $1 -ne 0 ];then 
    echo -e " $2 ...$R FAILURE"
    exit 1
    else 
    echo -e " $2  $G Success"
    fi
     
}
if [ "$USERID" -ne 0 ];then 
  echo "Error: you must have sudo privilge to install the package"
  exit 1 #other than 0
  fi
  dnf list installed mysql
 if [ $? -ne 0 ] ;then
   dnf install mysql -y 
   VALIDATE $? "Installing MySql"
       
   echo -e " mysql already $Y INSTALLED"
   fi

   #Installing the git
   dnf list installed git 
   if [ $? -ne 0 ] ;then
   dnf install git 
   VALIDATE $? "Installing Git"
    else 
     echo " Git already $Y installed "
     fi

