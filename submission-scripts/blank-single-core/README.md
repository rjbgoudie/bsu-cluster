These are blank submission scripts. There is one for each queue/type of node.

You will need to edit the following:

1. Line 56, you may need to add `module` command to load whatever program you want to run. For example, to load `python`:

```sh
#! Insert additional module load commands after this line if needed:
module add python
```

2. Line 59, which should be program you want to run. You might need the full path. For example to run `python`

```sh
#! Full path to application executable:
application="python"
```

3. Line 62, any options your program needs. For example to use the `-3` option in `python`, change to

```sh
#! Run options for the application:
options="-3"
```

You may well need to edit the following:

1. Line 21, which sets the maximum time your program takes to run. It will be shutdown ("killed") at this point, even if it isn't finished. To change to 12 hours, change to

```sh
#! How much wallclock time will be required? Use format HH:MM:SS
#SBATCH --time=12:00:00
```

You might want to edit the following:

1. Line 13, which is the job name. This makes no difference, but changing it might make it easier to find your job when you run, for example, `squeue`. To change to `newjobtitle`

```sh
#! Name of the job: change this to anything you like
#SBATCH -J newjobtitle
```
