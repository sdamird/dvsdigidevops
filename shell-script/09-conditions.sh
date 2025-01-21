#!/bin/bash
NUMBER=$1
#-gt,-lt,-rq,-ge,-le
if [ $NUMBER -gt 0 ]
then 
  print " Given number is greater than 100"
 else 
  print " Given number is less than 100"
fi