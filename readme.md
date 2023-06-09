## File permission

### Example 1:

Use Python to remove write permission for group and other, for a given file: [Remove-group-other-write-permission.py](https://github.com/EmelineFavreau/data-handling/blob/master/Remove-group-other-write-permission.py)


Set write permission for group `chmod g+w nowrite.test`

Remove write permission for group/other:
`python Remove-group-other-write-permission.py nowrite.test
nowrite.test no write permission for group`

Sanity check:
`ls -l                 
total 16
-rwxr-xr-x@ 1 emelinefavreau  staff  455 23 May 10:52 Remove-group-other-write-permission.py
-r--r--r--  1 emelinefavreau  staff    0 23 May 10:27 nowrite.test
-rwxr-xr-x@ 1 emelinefavreau  staff  664 23 May 10:24 print-write-permission.py
-rw-r--r--  1 emelinefavreau  staff    0 23 May 10:04 test.txt`


### Example 2:

Use Python to print permission of a file: [print-write-permission.py](https://github.com/EmelineFavreau/data-handling/blob/master/print-write-permission.py)

Print write permission is present (True) or not (False) for a given file
`python print-write-permission.py test.txt 
test.txt => True`

`python print-write-permission.py nowrite.test
nowrite.test => False`

Sanity check:
`ls -l
total 8
-r--r--r--  1 emelinefavreau  staff    0 23 May 10:27 nowrite.test
-rwxr-xr-x@ 1 emelinefavreau  staff  664 23 May 10:24 print-write-permission.py
-rw-r--r--  1 emelinefavreau  staff    0 23 May 10:04 test.txt`


### Example 3: 

Use cron to automate small useful recurrent jobs: [cron-tips.md](https://github.com/EmelineFavreau/data-handling/blob/master/cron-tips.md)


## Scheduling jobs

### Submit a simple script on HPC

[gzip-my-file.sh](https://github.com/EmelineFavreau/data-handling/blob/master/gzip-my-file.sh)
