#!/bin/bash
USERID=$(id -u)
VALIDATE(){
     if [ $1 -ne 0 ];then 
    echo " $2 ...FAILURE"
    exit 1
    else 
    echo " $2  Success"
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
       
   echo " mysql already installed "
   fi

   #Installing the git
   dnf list installed git 
   if [ $? -ne 0 ] ;then
   dnf install git 
   VALIDATE $? "Installing Git"
    else 
     echo " Git already installed "
     fi

