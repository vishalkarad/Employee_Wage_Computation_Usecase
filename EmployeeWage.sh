#!/bin/bash -x

#Constant variables
employee_Full_Time_Hours=8
employee_Part_Time_Hours=4
emp_Rate_per_Hours=20
num_Working_Days=20
mx_Hrs_In_month=100
employee_hours=0
employee_Full_Time_Work=1
Employee_Part_Time_Work=0

#variables
totalWorkHours=0
totalWorkingDays=0
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

# Wages Working Hours and days

loop=1
# Runing while loop until complet hourse or days
while [ $loop -ne 0 ]
do
	hoursDays=$(( RANDOM%2 ))

# Random function generate 100 then run if block And calculate oprations
case "$hoursDays" in 
0)
   employeeType=$(( RANDOM%2 ))
	echo "Employee worked 100 hour"
	if [ $employeeType -eq 0 ]
	then
	   echo "Employee is full time worker ."
		echo "Employee wages is $(( $mx_Hrs_In_month*$emp_Rate_per_Hours )) "
		loop=0
	else
		echo "Employee is part  time worker ."
      echo "Employee wages is $(( $mx_Hrs_In_month*$emp_Rate_per_Hours )) "
		loop=0
	fi
	;;

# Random function generate 100 then run if block And calculate oprations 
1)
   employeeType=$(( RANDOM%2 ))
   echo "Employee worked 20 days"
   if [ $employeeType -eq 0 ]
   then
      echo "Employee is full time worker ."
      echo "Employee wages is $(( $(( $num_Working_Days*$employee_Full_Time_Hours )) * $emp_Rate_per_Hours )) "
	   loop=0
   else
      echo "Employee is part  time worker ."
      echo "Employee wages is $(( $(( $num_Working_Days*$employee_Part_Time_Hours )) * $emp_Rate_per_Hours ))"
	   loop=0
   fi
	;;
esac

done

# Work hours using Function 

function getworkHourse(){

	if [ $1 -eq 0 ]
	then
		echo "$employee_Part_Time_Hours"

	elif [ $1 -eq 1 ]
	then
		echo "$employee_Full_Time_Hours"

	elif [ $1 -eq 2 ]
   then
		echo "employee_hours"
	fi
}
  
random=$(( RANDOM%3 ))
employeeType="$( getworkHourse $random )"
echo "$employeeType"


# find working days
function getworkHourse(){

	if [ $1 -eq 0 ]
	then
		echo "$employee_Part_Time_Hours"

	elif [ $1 -eq 1 ]
	then
		echo "$employee_Full_Time_Hours"

	elif [ $1 -eq 2 ]
   then
		echo "$employee_hours"
	fi
}

# find wage 
function dailyWage(){

	wage=$(( $1*$emp_Rate_per_Hours ))
	echo "$wage"
}
while [[ $totalWorkHours -lt $mx_Hrs_In_month && $totalWorkingDays -lt $num_Working_Days ]]
do
	((totalWorkingDays++))
	hour="$( getworkHourse $(( RANDOM%3 )) )"
	totalWorkHours=$(($totalWorkHours+$hour))
	empDailyWage[$totalWorkingDays]="$( dailyWage $hour )"
done

	totalSalary="$( dailyWage $totalWorkHours )"
	echo "Daily Wage " ${empDailyWage[@]}
# find working days
function getworkHourse(){

   if [ $1 -eq 0 ]
   then
      echo "$employee_Part_Time_Hours"

   elif [ $1 -eq 1 ]
   then
      echo "$employee_Full_Time_Hours"

   elif [ $1 -eq 2 ]
   then
      echo "$employee_hours"
   fi
}

# find wage 
function dailyWage(){

   wage=$(( $1*$emp_Rate_per_Hours ))
   echo "$wage"
}
while [[ $totalWorkHours -lt $mx_Hrs_In_month && $totalWorkingDays -lt $num_Working_Days ]]
do
   ((totalWorkingDays++))
   hour="$( getworkHourse $(( RANDOM%3 )) )"
   totalWorkHours=$(($totalWorkHours+$hour))
   empDailyWage[$totalWorkingDays]="$( dailyWage $hour )"
done

   totalSalary="$( dailyWage $totalWorkHours )"
   echo "Daily Wage " ${empDailyWage[@]}
	echo "All keys " ${!empDailyWage[@]}
