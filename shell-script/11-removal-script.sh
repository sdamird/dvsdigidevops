#!/bin/bash
RPM=$1
dnf list installed $RPM
if [ $? -eq 0 ]
then 
 dnf remove $RPM -y
 if [ $? -eq 0 ]  
 then 
   echo "$RPM is successfully removed"
 else 
  echo " $RPM is unable to romve "
  exit 1
  fi
  fi