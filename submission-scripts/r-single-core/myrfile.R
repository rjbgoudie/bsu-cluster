set.seed(425)
samples <- rnorm(100)

filename <- paste0("samples.rds")
saveRDS(samples, file = filename)
