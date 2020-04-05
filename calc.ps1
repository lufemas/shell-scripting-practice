#! /usr/bin/env bash
head (){
  clear
  headText="Welcome to Bash Calculator v1.0"
  textLen=${#headText}
  # textLen=textLen

  for (( i=0; i < $textLen+6; ++i)); do
    echo -ne "-"
  done

  echo -ne "\n|"
  for (( i=0; i < $textLen+4; ++i)); do
    echo -ne " "
  done
  echo -ne "|"

  echo -ne "\n|  "
  tput setaf 2
  tput bold
  echo -ne  $headText
  tput sgr0
  echo -ne  "  |\n"

    echo -ne "|"
  for (( i=0; i < $textLen+4; ++i)); do
    echo -ne " "
  done
  echo -ne "|\n"

  for (( i=0; i < $textLen+6; ++i)); do
    echo -ne "-"
  done

  echo -ne "\n\n"
}

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
  if [[ $2 -eq 0 ]]; then
    head
    tput setaf 3
    tput bold
    echo -ne "\n This version of Bash Calculator does not support division by 0 or numbers greater then 255 \n"
    tput sgr0
    read
  else
    return $(expr $1 / $2)
  fi
}

# When the program is first loaded, display a greeting to the user.
head
# When the operation is complete, redisplay the menu.
while true; do
  # Then, display a menu that outlines the possible operations:
    # Add
    # Subtract
    # Exit

  echo -e " Please select an operation:\n"
  echo "   (1) Add"
  echo "   (2) Subtract"
  echo "   (3) Multiply"
  echo "   (4) Divide"
  tput setaf 1
  tput bold
  echo -e "   (0) Exit\n"
  tput sgr0
  # Then, capture the user selection.
  printf "Type your selection: "
  read selection
# If the selection matches a supported operation, execute the operation.

  operationSign="none"
  operation=""
  declare -i result=0

  case $selection in
    '1' | "Add" | "add")
    operationSign="+"
    operation="sum"
    ;;

    '2' | "Subtract" | "subtract")
    operationSign="-"
    operation="subtract" 
    ;;

    '3' | "Multiply" | "multiply")
    operationSign="*"
    operation="multiply"
    ;;

    '4' | "Divide" | "divide")
    operationSign="/"
    operation="divide"
    ;;

    '0' | "Exit" | "exit" | "q")
    echo -ne "\nGood Bye\n"
    exit 0
    ;;

# If the selection does not match a support operation, display an error message.
    *)
    head
    tput setaf 1
    echo -ne " '$selection' is not a valid option!\n\n"
    tput sgr0
    continue
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
  

  head

  tput bold
  tput setaf 4
  echo -ne "\n   ( $num1 ) $operationSign ( $num2 ) = "
  tput setaf 7
  echo -ne "$result\n\n"
  tput sgr0
  

done




