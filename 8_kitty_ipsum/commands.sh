# Write command to file
<command> > stdout.txt
echo hello > stdout.txt

# Write error to file
<bad_command> > stderr.txt

# 2 Types of outputs:
stdout # standard out - used when a command was successful
stderr # standard error - used when there is an error

# Redirect stderr
<bad_command> 2> <file_name.txt>

# Redirect stdout
<command> 1> <file_name.txt>

# 1 Type of input:
stdin # standard in - used when a command takes an input

# Redirect stdin
<command> < <file_name.txt>
# Redirect to variable
<command> VARIABLE_NAME < <file_name.txt>
read NAME < name.txt

# Piping output from a command to input of another
<command_1> | <command_2>
# This will take the stdout from command_1 and use it as the stdin for command_2
echo Dylan | read NAME

# Using cat for input
cat name.txt
cat < name.txt

# Using pipe operator with cat
echo Dylan | cat # prints 'Dylan'

# We can pipe stdout into a script
echo Dylan | ./script.sh

# We can also redirect stderr while we're at it
echo Dylan | ./script.sh 2> stderr.txt

# and redirect both stdout and stderr!
echo Dylan | ./script.sh 1> stdout.txt 2> stderr.txt
/script.sh < name.txt 2> stderr.txt 1> stdout.txt

# word count for file
# Print newline, word, and byte counts for each FILE
wc <file_name.txt>

# print lines
wc -l <file_name.txt>
# print words
wc -w <file_name.txt>
# print characters
wc -m <file_name.txt>


# Pipe output of cat command to wc
cat < kitty_ipsum_1.txt | wc

# Search for patterns in text files
grep '<pattern>' <file_name> # shows lines that contain pattern
# Flags
-o # Only the matching pattern is returned
-c # Get a count for the pattern
-i # Ignore case