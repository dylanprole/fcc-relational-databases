# Creating a git repo from a folder
git init

# See the current overview of the repo - IMPORTANT!!!
git status

# Create and checkout branches
git checkout -b main
-b # Stands for 'branch', use this when creating the new branch and checking out for the first time

# Adding files to staging area (getting ready to commit)
git add file_name

# Making our commit
git commit -m "Initial commit"
-m # Stands for 'message'

# See commit history
git log
--oneline # Add to make each commit only one line

# View changes you have made 
git diff

# Keep track of the type of change with the following:
fix: message_here # Used when fixing a bug
feat: message_here # Used when adding new features or cod

# View current branches in your repo
git branch

# Creating new branches
git branch branch_name

# Usually best practice to use fix/ or feat/
fix/branch_name
feat/branch_name

# Switching to new branch
git branch branch_name

# Merge changes from new branch into the main branch
git merge branch_name

# Delete branch
git branch -d branch_name

# Updating your branch to match any changes made by other people to main branch
git rebase main

# After resolving conflicts we an add the new commit with
git add resolved_file_name

# Continue with rebase
git rebase --continue

# Sometimes we make changes on the wrong branch, we can stash or "save" the changes before moving to the correct branch
git stash 

# View current stashes with
git stash list

# Bring back changes saved on the stash (this deletes the stash)
git stash pop

# View a condensed version of the changes in the latest stash with
git stash show
-p # shows full changes, it stands for 'patch'

# Apply stashed changes to current directory without losing the stash
git stash apply

# Sometimes we have multiple stashes, we can show a specific stash with
git stash show stash@{number}
# Note the newest stash will always be stash@{0}
-p # will show full patch notes

# Drop stashes with
git stash drop <stash_name>