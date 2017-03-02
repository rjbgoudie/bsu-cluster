These are submission scripts for running ARRAY JOBS specifically for R. There is one for each queue/type of node. To run, for example, an R script called `myrfile.R` on `mrc-bsu-sand`, use

```sh
sbatch slurm_submit.mrc-bsu-sand myrfile.R
```

You may well need to edit the following:

1. Line 21, which sets how many array tasks to run, and the maximum number to run simultaneously. To run 1000 tasks, 50 at a time, change to:

```sh
#! How big do you want your array of tasks, and how many to run at a time
#SBATCH --array=1-1000%50
```

2. Line 23, which sets the maximum time your program takes to run. It will be shutdown ("killed") at this point, even if it isn't finished. To change to 12 hours, change to

```sh
#! How much wallclock time will be required? Use format HH:MM:SS
#SBATCH --time=12:00:00
```

You might want to edit the follow:

1. Line 13, which is the job name. This makes no difference, but changing it might make it easier to find your job when you run, for example, `squeue`. To change to `newjobtitle`

```sh
#! Name of the job: change this to anything you like
#SBATCH -J newjobtitle
```


If you don't want to have to type `myrfile.R` at the end of each `sbatch` command every time, change line 66 to:

```sh
#! Change this to the name of the R script you want to run
#! If left as $@, you specify the filename when you run sbatch, e.g.
#!
#! sbatch slurm_submit.mrc-bsu-sand myrfile.R
rscript="myrfile.R"
```
