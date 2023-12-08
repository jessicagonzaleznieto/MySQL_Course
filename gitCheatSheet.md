# Git Cheatsheet

### Setup
- Initialize a repository: `git init`
- Clone a repository: `git clone <repository_url>`

### Basic Flow
- Make my changes...
- Add changes to staging: `git add <file_name>` or `git add .` (to add all changes)
    - Like packing the envelope
- Commit changes: `git commit -m "Commit message"`
    - Sealing the envelope
- Push changes to remote: `git push origin <branch_name>`
    - Sending the envelope
- Pull latest changes from remote: `git pull origin <branch_name>`
- Create a new branch: `git branch <branch_name>`
- Switch to a branch: `git checkout <branch_name>`




# Rest is less common

### Basic Commands
- Check status: `git status`
- Add changes to staging: `git add <file_name>` or `git add .` (to add all changes)
- Commit changes: `git commit -m "Commit message"`
- Push changes to remote: `git push origin <branch_name>`
- Pull latest changes from remote: `git pull origin <branch_name>`
- Create a new branch: `git branch <branch_name>`
- Switch to a branch: `git checkout <branch_name>`
- Merge branches: `git merge <branch_name>`

### Working with Branches
- List all branches: `git branch -a`
- Delete a local branch: `git branch -d <branch_name>`
- Delete a remote branch: `git push origin --delete <branch_name>`

### Undoing Changes
- Discard changes in working directory: `git checkout -- <file_name>`
- Unstage changes: `git reset HEAD <file_name>`
- Amend the last commit: `git commit --amend`
- Revert a commit: `git revert <commit_id>`

### History and Information
- Show commit history: `git log`
- Show changes made in a commit: `git show <commit_id>`
- Show differences between branches: `git diff <branch_1> <branch_2>`
- Show changes in staged files: `git diff --staged`

### Collaboration
- Add a remote repository: `git remote add <remote_name> <repository_url>`
- Fetch changes from a remote: `git fetch <remote_name>`
- Create a pull request: Fork a repository and submit a pull request via GitHub/GitLab/Bitbucket interface

