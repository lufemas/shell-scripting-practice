#! /usr/bin/env bash
sum (){
  return $(expr $1 + $2)
}

subtract(){
  return $(expr $1 - $2)
}

multiply(){
  return $(expr $1 \* $2)
}

divide(){
  return $(expr $1 / $2)
}

# When the program is first loaded, display a greeting to the user.
clear
echo -e "Welcome to Bash Calculator \n"

while true; do
  # Then, display a menu that outlines the possible operations:
    # Add
    # Subtract
    # Exit

  echo -e "Please select an operation:\n"
  echo "(1) Add"
  echo "(2) Subtract"
  echo "(3) Multiply"
  echo "(4) Divide"
  echo -e "(0) Exit\n"
  # Then, capture the user selection.
  printf "Type your selection: "
  read selection
# If the selection matches a supported operation, execute the operation.

  operationSign="none"
  operation=""
  result="Something went wrong here."

  case $selection in
    '1' | "Add")
    operationSign="+"
    operation="sum"
    ;;

    '2' | "Subtract")
    operationSign="-"
    operation="subtract" 
    ;;

    '3' | "Multiply")
    operationSign="*"
    operation="multiply"
    ;;

    '4' | "Divide")
    operationSign="/"
    operation="divide"
    ;;

    '0' | "Exit")
    echo "Good Bye"
    exit 0
    ;;

    *)
    clear
    echo " '$selection' is not a valid option\n\n"
    ;;
  esac

  echo -e "\nProvide two numbers to proceed with the operation:"
  echo -ne "First number:  "
  read num1
  echo "$operationSign"
   echo -ne "Second number:  "
  read num2

  $operation $num1 $num2
  result=$?

  clear

  echo -e "\n   ( $num1 ) $operationSign ( $num2 ) = $result\n\n"

  

done


# If the selection does not match a support operation, display an error message.
# When the operation is complete, redisplay the menu.
