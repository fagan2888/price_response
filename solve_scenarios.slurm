#!/bin/sh

## reporting
#SBATCH --error=logs/%A_%a.err
#SBATCH --output=logs/%A_%a.out
# change the following lines to have one pound sign instead of two
# if you want to receive notices about jobs
##SBATCH --mail-type=BEGIN,END,FAIL,REQUEUE,TIME_LIMIT_80
##SBATCH --mail-user=8083489586@vtext.com

#SBATCH --mem-per-cpu=6400

#SBATCH --job-name=demand_scenarios
#SBATCH --partition=kill-shared
#SBATCH --time=3-00:00:00
# specify the number of parallel tasks to run in the commmand below
#SBATCH --array=1-40

module load lang/Anaconda3
source activate switch
srun --unbuffered switch solve-scenarios --scenario-queue sq/$SLURM_ARRAY_JOB_ID "$@"

