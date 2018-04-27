# bsu-cluster

A few example submission scripts.

Updated for CSD3 2018-04-28: (see diff of required changes)[https://github.com/rjbgoudie/bsu-cluster/compare/c41147ed6c33f59ddba03edf68c01d4bf31964c6...6f0162573445db5eb805ba0d3acb61b95cfb43ac]

The `-single-core` scripts by default use 1 core on 1 node, with 1 hour allowed for running:
* [submission-scripts/blank-single-core](submission-scripts/blank-single-core) - these are generic for any software
* [submission-scripts/r-single-core](submission-scripts/r-single-core) - these are specific for R

The `-array` scripts run a task array, by default 4 tasks, with rate limiting so only 2 run at once. 1 hour is allowed for each to run.
* [submission-scripts/r-single-core-array](submission-scripts/r-single-core-array) - these are specific for R

Please let me know if you spot errors, or have other example scripts that others might find useful.
