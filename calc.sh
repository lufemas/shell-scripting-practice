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
  if [[$2 -eq 0]]; then
    return $("INFINITE")
  fi

  return $(expr $1 / $2)
}

# When the program is first loaded, display a greeting to the user.
head

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

  # head

  echo -e "\n   ( $num1 ) $operationSign ( $num2 ) = $result\n\n"

  

done


# If the selection does not match a support operation, display an error message.
# When the operation is complete, redisplay the menu.
