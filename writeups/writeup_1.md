## Gitexercises
### Master
1.	git start master
2.	git verify
### Commit-one-file
1.	git start commit-one-file
2.	I added only one file A.txt using 
- git add A.txt
3.	git commit -m “Commited A file”
4.	git verify
### Commit-one-file-staged
1.	Added both file A.txt and b. txt to the staging area and then using reset unstaged file B.txt
- git add A.txt
- git add B.txt
- git reset HEAD -- B.txt 
- (can ignore HEAD -- I suppose)
- git commit -m “Adding file A.txt”
- git verify
### Ignore-them
1. create and edit .gitignore file
- touch .gitignore
- nano .gitignore
2. add the files to be ignored inside the gitignore file
- *.exe
- *.o
- *.jar
- libraries/
3. add git to the stage area then commit and verify
- git add .gitignore
- git commit -m ".gitignore file"
- git verify
### chase-branch
1. git merge escaped 
2. From the branch chase-branch, merge escaped branch. 
### merge-conflict
1. First I tried to merge the branch another-piece-of-work with our branch merge-conflict
- git merge another-piece-of work
2. It showed the message
- CONFLICT (content): Merge conflict in equation.txt
3. Went to the file and made changes by hand
- nano eqation.txt
- 2+3=5
4. git add equation.txt
5. git commit -m "Fixing merge conflict"
6. git verify
### save-your-work
1. I first stashed my on going work using git stash
2. Then I went to bug.txt and fixed the bug 
- nano bug.txt
3. Then I did git add bug.txt and git commit -m "bug fixed"
4. I, then, did git stash pop and added the given line in the bug.txt file 
4. I added both my bug.txt file and program.txt file and commited them
### change-branch-history
1. Check what files are in the branch change-branch-history
- ls
2. Opened buggy.txt 
- nano buggy.txt
- fixed the bug
- added and commited buggy.txt
3. Switched to branch hot-bugfix
- git switch hot-bugfix
- looked into the files in this branch 
- nano buggy.txt
4. Switched back to change-branch-history as we have to rebase this branch with hot-bugfix
5. git rebase hot-bugfix
- showed merge conflict in the file buggy.txt
- removed the conflict
- git add buggy.txt
- git commit -m "commit 2"
6. Rebase happened successfully 
### remove-ignored
1. ls
- to see the files in the branch
2. git rm ignored.txt
- rm is used to delete files
3. ls to check for deletion
4. git commit -m "removed"
### case-sensitive-filename
1. used mv
- renames a file
- git mv File.txt file.txt
2. ls to check changes
3. git add file.txt
4. Commited the material
### fix-typo
1. Fix the typo in file.txt 
- nano file.txt
2. git add file.txt
3. git commit --amend
- It opened the commit message
- Changed "Add Hello wordl" to "Add Hello World"
- esc then :wq
### forge-data
1. git commit --amend --date="1987-03-12 23:43:55"
### fix-old-typo
1. Start a rebase in interactive mode
- git rebase -i HEAD~2
2. changed pick to edit in both commits
3. for the first one
- nano file.txt
- fixed the typo
- git add file.txt
- git rebase --continue
4. Merge conflict occured
- nano file.txt
- kept the second file content
- git add file.txt
- git rebase --continue
- git verify