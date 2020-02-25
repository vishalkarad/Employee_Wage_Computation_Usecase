#!/bin/bash -x

echo "Welcome to Employee Wage Computation program "
 
# create random function and check employee is present or not using if else
random=$(( RANDOM%2 ))
if [ $random -eq 1 ]
then
	echo "Employee is present "
else
	echo "Employee is not present "
fi
