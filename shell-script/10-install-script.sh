#!/bin/bash
USERID=$(id -u)
if [ "$USERID" -ne 0 ];then 
  echo "Error: you must have sudo privilge to install the package"
  exit 1 #other than 0
  fi
  dnf list installed mysql
 if [ $? -ne 0 ] ;then
   dnf install mysql -y 
   if [ $? -ne 0 ];then 
    echo " Installing ...FAILURE"
    exit 1
    else 
    echo " Insfalling MySql Success"
    fi
    else 
      
   echo " mysql already installed "
   fi

   #Installing the git
   dnf list installed git 
   if [ $? -ne 0 ]
   then 
    dnf install git -y 
    if [ $? -ne 0 ]
    then 
      echo " Installing Git ..Failure"
      exit 1
    else 
      echo " Installling git success "
    fi
    else 
     echo " Git already installed "
     fi

