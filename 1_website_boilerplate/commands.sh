######################################### DISPLAYING #########################################
echo <text> # Prints text
pwd # Print current working directory
ls # List files in current directory
ls -l # List files in list view
ls -a # Lists all content of current directory (including hidden)
find # Displays tree view of all folders and files in current directory
find -name <file_name> # Shows location of specified file name
command --help # Shows all the flags and arguments for the specified command e.g. "ls --help"
sudo # Super user do - precedes commands
more <file_name> # Display contents of file
clear # Clean up the current terminal

######################################### WRITING #########################################
echo text >> filename # Writes text to a specified file

######################################### NAVIGATING #########################################
cd <directory> # Change directory to folder specified
cd .. # Go to previous superceding folder

######################################### CREATING #########################################
mkdir <directory/folder_name> # Create folder
touch <directory/file_name> # Create file

######################################### MOVING #########################################
mv <file_name> <directory/file_name> # Moves the file to the specified directory

######################################### RENAMING #########################################
mv <file_name> <new_file_name> # Renames the file in the current directory

######################################### COPYING #########################################
cp <file_name> <directory> # Copies the file to the specified directory

######################################### DELETING #########################################
rm <file_name> # Deletes the file specified
rm -r <folder_name> # Deletes the folder specified