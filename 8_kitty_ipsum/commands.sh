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
grep '<pattern>' <file_name.txt> # shows lines that contain pattern
# Flags
-o # Only the matching pattern is returned
-c # Get a count for number of lines it appears in
-i # Ignore case
-n / --line-number # Include the line number with output
-- color # Return the pattern in red (or another colour)

# We can pipe the above grep output into wc 
grep -o 'pattern' file_name.txt | wc -l # Gives us number of times word appears in text


# Replace text in a file with sed
sed 's/<pattern_to_replace>/<text_to_replace_it_with>/' <filename>
# we can add regular expression flags after the last forward slash
sed 's/freecodecamp/f233C0d3C@mp/i' name.txt # i = case insensitive
# We can also pipe the input
cat name.txt | sed 's/freecodecamp/f233C0d3C@mp/i'
-E # use extended regular expressions in the script 

# Using grep with sed
grep -n 'meow[a-z]*' kitty_ipsum_1.txt | sed -E 's/[0-9]+/1/'

# Searching multiple patterns
grep -E '<dog_words>|<woof_words>' # must include extended reg exp flag

# We can capture the desired regular expressions with themselves with
\
's/([0-9]+)/\1/'
grep -n 'meow[a-z]*' kitty_ipsum_1.txt | sed -E 's/([0-9]+)/\1/'

# Replacing multiple patterns:
sed 's/<pattern_1>/<replacement_1>/; s/<pattern_2>/<replacement_2>/'

# Use global flag to replace all patterns on the same line
sed 's/catnip/dogchow/g; s/cat/dog/g; s/meow/woof/g'

# View the differences between 2 files
diff <file_1> <file_2>
--side-by-side # output in two columns