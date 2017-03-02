# bsu-cluster

A few example submission scripts.

The -single-core scripts by default use 1 core on 1 node, with 1 hour allowed for running:
* submission-scripts/blank-single-core - these are generic for any software
* submission-scripts/r-single-core - these are specific for R

The -array scripts run a task array, by default 4 tasks, with rate limiting so only 2 run at once. 1 hours is allowed for each to run.
* submission-scripts/r-single-core-array - these are specific for R
