#! /usr/bin/env bash

# When the program is first loaded, display a greeting to the user.
clear
echo -e "Welcome to Bash Calculator \n"

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

case $selection in
  '1' | "Add")
  echo "x+y"
  ;;

   '2' | "Subtract")
  echo "x-y"
  ;;

   '3' | "Multiply")
  echo "x*y"
  ;;

   '4' | "Divide")
  echo "x/y"
  ;;

   '0' | "Exit")
  echo "Good Bye"
  ;;
esac

# If the selection does not match a support operation, display an error message.
# When the operation is complete, redisplay the menu.
