# this is the index of the task in the task array
task_id_string <- Sys.getenv("SLURM_ARRAY_TASK_ID")
task_id <- as.numeric(task_id_string)

seed <- c(425, 3453, 223, 232)[task_id]
set.seed(seed)
samples <- rnorm(100)

filename <- paste0("samples_", task_id, ".rds")
saveRDS(samples, file = filename)
