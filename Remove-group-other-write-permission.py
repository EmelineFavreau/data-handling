import stat
import os

def change_file_permission(file_to_fix):
    current = stat.S_IMODE(os.stat(file_to_fix).st_mode)
    new = current & ~stat.S_IWGRP & ~stat.S_IWOTH 
    return os.chmod(file_to_fix, new)
    
# After this step group/other write permission is removed
if __name__ == '__main__':
    from sys import argv
    change_file_permission(argv[1])
    print('group/other have no more write permission for', argv[1])

# https://bowrna.hashnode.dev/how-to-change-the-permission-of-files-using-python