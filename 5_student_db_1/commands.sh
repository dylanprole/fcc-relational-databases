# Print contents of file e.g CSV
cat courses.csv

# Piping output of cat into loops
cat courses.csv | while read MAJOR COURSE
do
  <STATEMENTS>
done
# Each new line will be read into the 
# variables, MAJOR and COURSE

# View IFS - internal field seperator
declare -p IFS

# Change IFS in loop
cat courses.csv | while IFS="," read MAJOR COURSE
do 
  echo $MAJOR
done

# Running postgresql commands in shell
PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"
# This will allow you to query your database
# from your script. The important parts are 
# the username, dbname, and the -c flag that
# is for running a single command and 
# exiting. The rest of the flags are for 
# formatting.

# We can then query psql using the following:
$($PSQL "<query_here>")
# The code in the parenthesis will run in a
# subshell, which is a separate bash process.

# Get major_id from psql
MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major = '$MAJOR';")

# Check if a variable is empty
[[ -s $VARIABLE_NAME]]
[[ -z $MAJOR_ID ]]