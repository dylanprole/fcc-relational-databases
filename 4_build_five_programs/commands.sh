# create file
touch <filename.sh>

# Run file with shell
sh <filename.sh>

# Run file with bash (born-again shell)
bash <filename.sh>

# Set interpreter in file with 
#!<path_to_interpreter>

# Check path of interpreter
which bash

# Add "shebang" to start of file so it always runs with bash
#!/bin/bash

# Run program without interpreter suffix
./questionnaire.sh

# Give everyone executable permissions.
chmod +x questionnaire.sh 

# You can add any commands to a shell file such as:
ls -l

# Add variables to bash files with:
# There cannot be any spaces around the equal (=) sign. 
# If a variable has any spaces in it, place double quotes around it.  
VARIABLE_NAME=VALUE

# Accept input from user
read VARIABLE_NAME

# To use a variable place a $ sign infront of it eg.g:
echo $VARIABLE_NAME

# View manual for the command specified
man <command> 

# View help for command
help if

# Print with new lines
echo -e "\n"~~ Questionnaire ~~"\n"

# Print all arguments passed into programs
echo $*

# e.g. when executing program with arguments
./file_name.sh arg1 arg2 arg3

# Echo the Nth argument
$N # e.g $1 will print the first argument

# Create if statement
if [[ CONDITION ]] # There must be spaces around the condition, and the == sign e.g. [[ $1 == arg1 ]]
then
  STATEMENTS
fi

# Adding else
if [[ $1 == arg1 ]]
then
  echo true
else
  echo false
fi

# Comparison operators
-eq == # EquaL
-ne != # NOT EQUAL
-lt # LESS THAN
-le # Less than or EQUAL to
-gt # GREATER THAN
-ge # GREATER than or EQUAL to
&& # and
|| # or

# We can run expressions in the terminal e.g.
[[ 4 -le 5 ]]

# We can view the output or "exist status" of LAST COMMAND with:
echo $? # 0 means true, 1 means false (think of exit status as number of errors; 1 = no errors so good! (true))

# We can execute an expression and view the ouput wiht:
[[ 4 -ge 5 ]]; echo $?

# We can use the echo$? with any command
bad_command; echo $? # 127 errors
ls; echo$? # 0 errors

# Check if a file exists
[[ -a <filename> ]]; echo $?
# or
test -a <filename>; echo $? # True if file exists.

# Check if a file is executable by you
[[ -x <filename> ]]; echo $?
# or
test -x <filename>; echo $?

# For loops
for (( i = 10; i > 0; i-- ))
do
  echo $i
done
# The above creates a variable (i = 10), then
# prints it, subtracts one, and repeats 
# until i is not greater than 0. So it prints 10 through 1. 

# Check binary folder
ls /bin # THIS PRINTS LOOOOOOOOTS OF NON BUILT-IN COMMANDS

# Multi-line comment
: '
  comment here
  more comment here
'

# While loop
while [[ expression ]]
do
  thing
done

# Decrement/increment variable
(( VARIABLE_NAME-- )) # Decrement
(( VARIABLE_NAME++ )) # Increment

# Print environment variables
printenv

# Echo environment variable to terminal
echo $ENV_VARIABLE


# View all variables in the shell with 
declare -p #-p stands for print

# Making calculations to variables - check operators with help let
(( VARIALE NAME += 1 ))

# Print the calculation
echo $(( VARIABLE_NAME + 4 )) # when VARIABLE = 10; prints 14

# display the attributes and value of each VARIABLE_NAME
declare -p VARIABLE_NAME

# Create variable with calculations attached
NUMBER=$(( RANDOM % 75 + 1 ))

# We can also use double parenthesis for if statements
if (( CONDITION ))
then
  STATEMENTS
elif (( CONDITION ))
then
  STATEMENTS
else 
  STATEMENTS
fi

# Creating arrays
ARR=("a" "b" "c")

# Accessing elements of array
echo ${ARR[1]}

# Print all elements in array
echo ${ARR[*]}

# Create function
FUNCTION_NAME() {
  STATEMENTS
}

# We can use the function by writing
FUNCTION_NAME

# Until loop
until [[ CONDITION ]]
do
  STATEMENTS
done

# String pattern matching 
[[ hello ~= el ]]; echo $? # See if hello contains el
[[ "hello world" =~ "lo wor" ]]; echo $? # Make sure to use quotes if there are spaces

# Using regular expressions for pattern matching
[ "hello world" =~ ^h ]]; echo $? # ^h = starts with h
[[ "hello world" =~ ^h.+d$ ]]; echo $? # .+ = one more more char, d$ = ends with d

# Display information about command type
type <command>
type echo 