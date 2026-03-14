### level 0
1. ssh bandit0@bandit.labs.overthewire.org -p 2220
2. ls
### level 0 - level 1
1. nano readme
- saved the password in a local file
2. exit
3. ssh bandit1@bandit.labs.overthewire.org -p 2220
4. Entered password from readme
5. exit
### level 1 - level 2
1. ls
2. cat ./-
3. exit
### level 2 - level 3
1. ssh bandit2@bandit.labs.overthewire.org -p 2220
2. cat -- "--spaces in this filename--"
3. exit
### level 3 - level 4
1. ssh bandit3@bandit.labs.overthewire.org -p 2220
2. ls
3. ls -a
4. file name was ...Hiding-From-You
5. cat ...Hiding-From-You
6. exit
### level 4 - level 5
1. ssh bandit4@bandit.labs.overthewire.org -p 2220
2. ls
3. cd inhere
4. ls
5. used find to see that only -file07 was human readable (ASCII text)
6. cat -- "-file07"
7. exit
### level 5 - level 6
1. ssh bandit5@bandit.labs.overthewire.org -p 2220
2. ls
3. cd inhere
4. find -size 1033c ! -executable
5. cd maybehere07
6. cat ".file2"
7. exit
### level 6 - level 7
1. ssh bandit6@bandit.labs.overthewire.org -p 2220
2. ls 
3. ls -a
4. find -user bandit7 -group bandit6 -size 33c
- did not work
5. find /  -user bandit7 -group bandit6 -size 33c
- /var/lib/dpkg/info/bandit7.password (got the path to the file)
6. cat /var/lib/dpkg/info/bandit7.password
7. exit
### level 7 - level 8
1. ssh bandit7@bandit.labs.overthewire.org -p 2220
2. grep "millionth" data.txt 
- highlighted the word millionth and next to it was the password
3. exit
### level 8 - level 9
1. ssh bandit8@bandit.labs.overthewire.org -p 2220
2. sort data.txt |uniq -u
- uniq only gives unique values when all the repeated values are listed together so that used sort for that
3. exit 
### level 9 - level 10
1. ssh bandit9@bandit.labs.overthewire.org -p 2220
2. ls
3. strings data.txt
4. searched for the password amongst the readable data extracted using strings
5. exit
### level 10 - level 11
1. ssh bandit10@bandit.labs.overthewire.org -p 2220
2. base64 data.txt 
- to get the encoded data
3. base 64 -d data.txt
- to decode the data
4. exit
### level 11 - level 12
1. ssh bandit11@bandit.labs.overthewire.org -p 2220
2. cat data.txt | tr 'A-Za-z' 'N-ZA-Mn-za-m'
- ROT13 
3. exit
### level 12 - level 13
1. ssh bandit12@bandit.labs.overthewire.org -p 2220
2. ls to check what files are in the directory 
3. mktemp -d
- got a path
4. cp data.txt <diretory-name>
- copied the file to the directory
5. cd to get into the directory 
6. changed the file name using mv
7. xxd -r file.txt f1
- reverse hex dump to binary file
8. file f1
- to check the type of file 
- gzip compressed data 
9. mv f1 f1.gz 
- so I can decompress it later
10. gzip -d f1.gz
11. ls to check name 
12. file f1 
- to check type 
- bzip2 compressed data
13. mv f1 f1.bz2 
14. bzip2 -d f1.bz2
14. ls 
- f1
15. file f1
-gzip
16. same steps from 9 to 12
- POSIX tar archive type was achieved 
17. mv f1 f1.tar
18. ls 
- found a data5.bin file
- was type POSIX tar archive
19. tar -xf data5.bin
- extraction
20. ls
- data6.bin was there
- bzip2 
21. steps 13 and 14 
- POSIX tar archive file type was achieved
22. tar -xf data6.bz2
23. ls
- data8.bin
- gzip compressed data type
24. mv data8.bin data8.gz
25. file data8
- ASCII text
26. cat data8
27. exit
### level 13 - 14
1. ssh bandit13@bandit.labs.overthewire.org -p 2220
2. ls 
3. cat HINT
- told me I can't use localhost and will have to logout 
4. sshkey.private
- has the private key
5. exit
6. scp -P 2220 bandit13@bandit.labs.overthewire.org: sshkeys.private .
- copying file from server to local computer
7. chmod 600 sshkey.private
- changing the permissions (i tried this level for a long time and in one attempt it showed an error that the file was too open. So this makes it secure as the user is the only one that has the permission)
8. ssh -i sshkey.private bandit14@bandit.labs.overthewire.org -p 2220
- entering the next level
9. cat /etc/bandit_pass/bandit14
### level 14 - 15
1. nc localhost 30000
- it waits for a response 
- pasted the password
- it uses the current level's password to verify and then gives the next level's password
- exit
### level 15 - 16
1. ssh bandit15@bandit.labs.overthewire.org -p 2220
2. nc localhost 30001
   openssl version
3. openssl s_client -connect localhost:30001
- enter that level password 
- get next level password
### level 16 - level 17
1. ssh bandit16@bandit.labs.overthewire.org -p 2220
2. nmap localhost -p 31000-32000
3. openssl s_client -connect localhost:port -quiet 
- since I was getting KEYUPDATE 
- 31790 was the server 
- copied and saved the RSA private key on local computer
4. exit
5. mktemp -d
- then went to the directory
6. nano key.private
- saved private key
7. chmod 600 key.private
8. ssh -i key.private bandit17@bandit.labs.overthewire.org -p 2220
9. cat /etc/bandit_pass/bandit17
- got the password
- bandit stores password in bandit_pass folder 
### level 17 - level 18
1. ls
2. pwd
- to get the path to this directory
3. mktemp -d
- so i can work without having permission access difficulties 
4. cd <location of the tmp directory> 
5. nano key.txt
6. cat passwords.new passwords.old > <path to the file in tmp directory>
7. I thought i will copy the content of both files and then will do sort and uniq to get the distinct line that has been changed
8. cat key.txt to check for the changes
9. sort key.txt | uniq -u
10. Got two lines
- checked one of them for the two files. The one is passwords.new is the required passkey.
11. cd /home/bandit17
12. grep "password" passwords.new
- found it in the file
- saved the password on local computer
### level 18 - level 19
1. exit
2. ssh bandit18@bandit.labs.overthewire.org -p 2220 "cat readme"
- since when we try to normally log in it will log us out due to chnages in .bashrc
- SSH allows us to use commands directly without going through the earlier method 
- so we can log in without going thorugh the shell
- since the password is in readme so we accessed the content of it
### level 19 - level 20
1. ssh bandit19@bandit.labs.overthewire.org -p 2220
2. ls
- saw a file "bandit20-do"
3. ls -l bandit20-do
- -rwsr-x--- 1
- SUID file 
4. whoami to check the user
- bandit19
5. ./bandit20-do
- Since it is a SUID file i can run commans as another user after this step
6. ./bandit20-do cd/etc/bandit_pass
- permission was denied
7. So i did ./bandit20-do whoami
- bandit20
- so i can straightaway access the bandit20 file in /etc/bandit_pass
8. ./bandit20-do cat /etc/bandit_pass/bandit20
- got the password
### level 20 - level 21
1. 