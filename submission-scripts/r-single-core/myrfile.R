# set random seed
set.seed(425)

# draw 100 standard normals
samples <- rnorm(100)

# save the standard normals to a file
filename <- paste0("samples.rds")
saveRDS(samples, file = filename)
