## Automating small useful recurrent jobs

Aim: obtain a weekly sanity check that all data files are not editable on the HPC

Tool: `cron`, [a 48-year-old command-line utility](https://en.wikipedia.org/wiki/Cron).

Check how `cron` works:

    cat /etc/crontab

    SHELL=/bin/bash
    PATH=/sbin:/bin:/usr/sbin:/usr/bin
    MAILTO=root

    # For details see man 4 crontabs

    # Example of job definition:
    # .---------------- minute (0 - 59)
    # |  .------------- hour (0 - 23)
    # |  |  .---------- day of month (1 - 31)
    # |  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ...
    # |  |  |  |  .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
    # |  |  |  |  |
    # *  *  *  *  * user-name  command to be executed`

Check which `cron` jobs I have:
    crontab -l
    7 2 * * * chmod -R 555 my-backup/data

Here, there is one cronjob listed. The action is performed each day at 02:07 (`7 2 * * *`, [click here for an explanation for humans](https://cron.help/)). The job removes write permission for anyone (`chmod 555`) to the directory (`my-backup/data`) and the files within (`-R`).


Want to set another job? Typing this will open a text editor to insert the new command:
`crontab -e`



Side note    
It is important to include the directory when setting the permissions, if not `rm dir/file.txt` is still possible. 




