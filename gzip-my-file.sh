#!/bin/bash
#SBATCH --job-name test
#SBATCH --account ACCOUNT
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --time 01:30:00
#SBATCH --mail-type FAIL
#SBATCH --partition skylake # Request a specific partition for the resource allocation; For 6GB per CPU: "-p skylake"; for 12GB per CPU; "-p skylake-himem"
#SBATCH -o %x_%j.out # x job name, x job id
#SBATCH -e %x_%j.err
shopt -s nullglob # enable Bash allows filename patterns which match no files to expand to a null string
. /etc/profile.d/modules.sh # Leave this line (enables the module command)
module purge                # Removes all modules still loaded
module load rhel7/default-peta4            # REQUIRED - loads the basic environment
JOBID=$SLURM_JOB_ID
echo -e "JobID: $JOBID"

# simple task
gzip /rds/project/taci.fna

## Run using sbatch gzip-my-file.sh
