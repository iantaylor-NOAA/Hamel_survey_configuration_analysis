require(dichromat)
col <- c(1,colorschemes$Categorical.12[seq(2,12,2)])
col[-1] <- adjustcolor(col[-1], offset = c(-0.2, -0.2, -0.2, 0))
