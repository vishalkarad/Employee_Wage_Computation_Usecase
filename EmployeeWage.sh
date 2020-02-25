#!/bin/bash -x

employee_Full_Time_Hours=8
employee_Part_Time_Hours=4
emp_Rate_per_Hours=20
num_Working_Days=20
mx_Hrs_In_month=100
employee_hours=0
employee_Full_Time_Work=1
Employee_Part_Time_Work=0
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

# Employee wage using case Statement

random=$(( RANDOM%2 ))
employeeType=$(( RANDOM%2 ))
case "$random" in
# case 0 is employee present else absent
0)
	 
	if [ $employeeType -eq $employee_Part_Time_Hours ]
	then
		echo "Employee is present and this is  Full time worker . "
		echo "Employee  daily wage is  : $(( $emp_Rate_per_Hours*$employee_Full_Time_Hours )) "
	else
		echo "Employee is present and this is part time worker . "
		echo "Employee  daily wage is : $(( $emp_Rate_per_Hours*$employee_Part_Time_Hours )) " 
	fi
   ;;
1)
	echo "Employee is absent :"
   ;;
esac


# Calculating Wage for a month

for (( day=1; day<=$num_Working_Days; day++ ))
do
   random=$(( RANDOM%3 ))
   case "$random" in
      1)
	      empHrs=8 
			;;
      2)
	      empHrs=4 
			;;
      0)
	      empHrs=0 
	      ;;
   esac               
    salary=$(($empHrs * $emp_Rate_per_Hours))
   totalSalary=$(($totalSalary+$salary))
 echo "normal salary  : $salary"
done

