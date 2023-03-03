
#!/bin/bash
### Script performs floating point operations 
##      Input:Full operation consists of "1st operand" "Operator" "2nd operand" 
##      ErrorCodes:
#               0:Success
#               1:Insufficient Parameters
#               2:Not floating point numbers
#               3:INvalued operator
#               4:Division by zero
#
#### Checking for number of passed parameters
[ ${#} -lt 3 ] && echo "Insufficient parameters" && exit 1
#### Taking Input from user
NUM1=${1}
NUM2=${3}
OP=${2}
#### Checking for floating point numbers
CH1=$(echo ${NUM1} | grep "^\-\{0,1\}[0-9]*.[0-9]*$" | wc -l)
CH2=$(echo ${NUM2} | grep "^\-\{0,1\}[0-9]*.[0-9]*$" | wc -l)
[ ${CH1} -eq 0 ] || [ ${CH2} -eq 0 ] && echo "Non-floating point numbers" && exit 2
#### Checking for operator validation
CH3=$(echo "\\${OP}" | grep [-,+,*,/] | wc -l)
[ ${CH3} -eq 0 ] && echo "Invalued Operator" && exit 3
#### Performing the operation
case ${OP} in
        "+")
                echo -n "The Result is "; echo "scale = 2; $NUM1+$NUM2" | bc
                ;;
        "-")
                echo -n "The Result is "; echo "scale = 2; $NUM1-$NUM2" | bc
                ;;
        "*")
                echo -n "The Result is "; echo "scale = 2; $NUM1*$NUM2" | bc
                ;;
        "/")
                if [ $NUM2 -ne 0 ]
                then
                        echo -n "The Result is "; echo "scale = 2; $NUM1/$NUM2" | bc
                else
                        echo "invalued operand, division by zero !!!" && exit 4
                fi
                ;;
esac
exit 0
