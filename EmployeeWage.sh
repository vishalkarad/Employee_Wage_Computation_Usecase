#!/bin/bash -x

employee_Full_Time_Hours=8
employee_Part_Time_Hours=4
emp_Rate_per_Hours=20
num_Working_Days=20
mx_Hrs_In_month=100
employee_hours=0

echo "Welcome to Employee Wage Computation program "
 
# create random function and check employee is present or not using if else
random=$(( RANDOM%2 ))
if [ $random -eq 1 ]
then
	echo "Employee is present "
else
	echo "Employee is not present "
fi
wage=$(( 20*$employee_hours ))

if [ $employee_Part_Time_Hours -eq 4 ]
then
	partTimeEmployeeOneDayWage=$(( $employee_Part_Time_Hours*$emp_Rate_per_Hours ))
fi
