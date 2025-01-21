#!/bin/bash
USERID=(id -u)
if [ "$USERID" -ne 0 ];then 
  echo "Error: you must have sudo privilge to install the package"
  exit 1 #other than 0
  fi