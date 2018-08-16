#!/bin/bash
#!
#! Example SLURM job script for Wilkes2 (Broadwell, ConnectX-4, P100)
#! Last updated: Mon 13 Nov 12:06:57 GMT 2017
#!

#!#############################################################
#!#### Modify the options in this section as appropriate ######
#!#############################################################

#! sbatch directives begin here ###############################
#! Name of the job: change this to anything you like
#SBATCH -J mrc-bsu-gpu-rjob
#! Which project should be charged (NB Wilkes2 projects end in '-GPU'):
#SBATCH -A mrc-bsu-sl2-gpu
#! How many whole nodes should be allocated?
#SBATCH --nodes=1
#! How many cores (out of 12) do you need on each node?
#SBATCH --ntasks=1
#! How much wallclock time will be required? Use format HH:MM:SS
#SBATCH --time=01:00:00
#! What types of email messages do you wish to receive?
#SBATCH --mail-type=FAIL
#! Uncomment this to prevent the job from being requeued (e.g. if
#! interrupted by node failure or system downtime):
##SBATCH --no-requeue

#! Do not change:
#SBATCH -p bsu-gpu

#! sbatch directives end here (put any additional directives above this line)

#! Notes:
#! Charging is determined by GPU number*walltime.

#! Number of nodes and tasks per node allocated by SLURM (do not change):
numnodes=$SLURM_JOB_NUM_NODES
numtasks=$SLURM_NTASKS
mpi_tasks_per_node=$(echo "$SLURM_TASKS_PER_NODE" | sed -e  's/^\([0-9][0-9]*\).*$/\1/')
#! ############################################################
#! Modify the settings below to specify the application's environment, location
#! and launch method:

#! Optionally modify the environment seen by the application
#! (note that SLURM reproduces the environment at submission irrespective of ~/.bashrc):
. /etc/profile.d/modules.sh                # Leave this line (enables the module command)
module purge                               # Removes all modules still loaded
module load rhel7/default-gpu              # REQUIRED - loads the basic environment

#! Insert additional module load commands after this line if needed:

# If you want, say, R version 3.3.0 rather than the current default R version
# First run:
#
# module avail r
#
# and then choose a different version of R from the linux-rhel7-x86_64 section.
# There are multiple versions of each R version, corresponding to different
# ways in which R can be compiled (e.g. which BLAS library). To see what each
# corresponds to, run:
#
# spack find -lv r
#
# 2018-05-03
# DO NOT USE r-3.4.1-* MODULES ON bsu-* nodes because BLAS is utterly broken,
# so basic linear algebra will NOT work. ie, do not use
#
# module add r-3.4.1-gcc-5.4.0-jubrpyn
#
# or
# module add r-3.4.1-gcc-5.4.0-uj5r3tk
#
# The r-3.4.0-* modules seem to be OK
module add r-3.4.0-gcc-5.4.0-j3fc64x

#! Change this to the name of the R script you want to run
#! If left as $@, you specify the filename when you run sbatch, e.g.
#!
#! sbatch slurm_submit.bsu-gpu myrfile.R
rscript="$@"

#! Full path to application executable:
application="R"

#! Run options for the application:
options="CMD BATCH --no-save --no-restore"

#! Work directory (i.e. where the job will run):
workdir="$SLURM_SUBMIT_DIR"  # The value of SLURM_SUBMIT_DIR sets workdir to the directory
                             # in which sbatch is run.

#! Are you using OpenMP (NB this is unrelated to OpenMPI)? If so increase this
#! safe value to no more than 12:
export OMP_NUM_THREADS=1

#! Number of MPI tasks to be started by the application per node and in total (do not change):
np=$[${numnodes}*${mpi_tasks_per_node}]

#! Choose this for a pure shared-memory OpenMP parallel program on a single node:
#! (OMP_NUM_THREADS threads will be created):
CMD="$application $options $rscript"

#! Choose this for a MPI code using OpenMPI:
#CMD="mpirun -npernode $mpi_tasks_per_node -np $np $application $options"


###############################################################
### You should not have to change anything below this line ####
###############################################################

cd $workdir
echo -e "Changed directory to `pwd`.\n"

JOBID=$SLURM_JOB_ID

echo -e "JobID: $JOBID\n======"
echo "Time: `date`"
echo "Running on master node: `hostname`"
echo "Current directory: `pwd`"

if [ "$SLURM_JOB_NODELIST" ]; then
    #! Create a machine file:
    export NODEFILE=`generate_pbs_nodefile`
    cat $NODEFILE | uniq > machine.file.$JOBID
    echo -e "\nNodes allocated:\n================"
    echo `cat machine.file.$JOBID | sed -e 's/\..*$//g'`
fi

echo -e "\nnumtasks=$numtasks, numnodes=$numnodes, mpi_tasks_per_node=$mpi_tasks_per_node (OMP_NUM_THREADS=$OMP_NUM_THREADS)"

echo -e "\nExecuting command:\n==================\n$CMD\n"

eval $CMD
