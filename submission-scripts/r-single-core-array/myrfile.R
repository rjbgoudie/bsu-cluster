# this is the index of the task in the task array
task_id_string <- Sys.getenv("SLURM_ARRAY_TASK_ID")
task_id <- as.numeric(task_id_string)

# set a different random seed for each task in the array
# task 1 will use random seed 425, task 2 will use 3453 etc
seed <- c(425, 3453, 223, 232)[task_id]
set.seed(seed)

# draw 100 standard normals
samples <- rnorm(100)

# save the standard normals in a file
# remember to give each task array item a diffent filename, otherwise they will
# obviously all overwrite each other
filename <- paste0("samples_", task_id, ".rds")
saveRDS(samples, file = filename)
