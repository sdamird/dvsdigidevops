#!/bin/bash
NUMBER=$1
#-gt,-lt,-rq,-ge,-le
if [ $NUMBER -gt 100 ]
then 
  echo " Given number is greater than 100"
 else 
  echo " Given number is less than 100"
fi
