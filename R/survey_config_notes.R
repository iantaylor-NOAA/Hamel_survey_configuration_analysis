########################################################
# loading data
########################################################

# tasks
# 1. make table of stock info (stock_info.csv)
# 2. make plot of relative spawning output
# 3. make plot of recruitment timeseries
# 4. make plot of SPR timeseries
# 5. make plot of spawning output timeseries
# 6. make tables of 2013 OFLs and ACLs (OFL_table.csv)
# 7. make table of SPB_2013 (B2013_table.csv)
# 8. make table of Pstar_sigma
# 9. make table of relative spawning biomass

#tasks <- c(2,3,5)

dir <- file.path('C:/Users/Ian.Taylor/Documents/manuscripts/',
                 'Hamel et al 2018 SurveyConfigurationPaper/Finished Runs Renamed')

require(r4ss)
if(FALSE){
  ### read all info from Rdata file
  # master directory
  #load(file.path(dir, '../Nov2b.Rdata'))
  load(file.path(dir, '../R/Apr23_2018.Rdata'))
  legend.order <- c(1, 2, 5, 6, 3, 4, 7)
}
if(FALSE){
  ### alternatively, read lots of model files (slower)
  # master directory
  dir <- file.path('C:/Users/Ian.Taylor/Documents/manuscripts/',
                   'Hamel et al 2018 SurveyConfigurationPaper/Finished Runs Renamed')
  # sub-directories for each species
  species <- dir(dir)
  species.name <- species
  species.legend <- species
  species.legend[c(1:4,11:12)] <- paste(species[c(1:4,11:12)], "rockfish")
  species.legend[c(5:7,9)] <- paste(species[c(5:7,9)], "sole")
  species.legend[8] <- paste("Pacific ocean perch")
  species.legend[species %in% c("Rex", "Sharpchin", "Yellowtail")] <-
    paste(species.legend[species %in% c("Rex", "Sharpchin", "Yellowtail")], "(DM)")
  
  runs <- c("full", "half", "even", "odd", "pass1", "pass2", "none")
  # legend labels differ to avoid confusion between full survey and full assessment
  run.labels <- runs
  run.labels[1] <- "status-quo"
  run.labels[7] <- "no-WCGBTS"
  # group full assessments alphabetically ahead of DM assessments
  order <- c(1:5, 7:8, 10, 6, 9, 11:12)

  require(dichromat)
  col <- c(1,colorschemes$Categorical.12[seq(2,12,2)])
  # re-ordering colors to match new ordering of legend
  col <- col[c(1,2,5,6,3,4,7)]
  legend.order <- c(1, 2, 5, 6, 3, 4, 7)
  
  # colors inspired by colorbrewer2.org
  ## greens <- c("#74c476", "#31a354", "#006d2c")
  ## blues <- c("#6baed6", "#2171b5")
  ## orange <- "#d95f02"
  ## black <- "#000000"
  ## col <- c(black, greens[3], blues[1:2], greens[1:2], orange)
  ## legend.order <- c(1, 2, 5, 6, 3, 4, 7)
  #col <- c('black',rich.colors.short(7)[-1])
  #col <- rich.colors.short(8)[-1]
  #col <- rich.colors.short(7)

  # get output for each species
  mod.specs <- list()
  for(ispec in 1:length(species)){
    spec <- species[ispec]
    cat("##########\n", spec, "\n\n")
    mod.specs[[spec]] <- SSgetoutput(dirvec=file.path(dir, spec, runs),
                                     getcovar=FALSE, getcomp=FALSE,
                                     forecast=(spec!="Yellowtail"))
  }

  # summarize output for each species
  mod.sums <- list()
  for(ispec in 1:length(species)){
    spec <- species[ispec]
    cat("##########\n", spec, "\n\n")
    mod.sums[[spec]] <- SSsummarize(mod.specs[[ispec]][!is.na(mod.specs[[ispec]])])
  }
  #save.image(file.path(dir, '../R/Apr13_2018.Rdata'))

  # re-read petrale
  mod.specs[["Petrale"]][[1]] <- SS_output(file.path(dir,'Petrale/full'))
  save.image(file.path(dir, '../R/Apr23_2018.Rdata'))
}
########################################################
# details on each stock
########################################################

if(1 %in% tasks){
stock.info <- data.frame(name = species,
                         N_indices = NA,
                         N_index_obs = NA,
                         N_mortality_params = NA,
                         N_growth_params = NA,
                         N_stock_recruit_params = NA,
                         N_recdev_params = NA,
                         N_forecast_params = NA,
                         N_select_params = NA,
                         N_retention_params = NA,
                         N_extra_SD = NA,
                         N_Q_params = NA,
                         N_other_params = NA,
                         N_params_total = NA)
for(spec in sort(species.name)){
  cat(spec, "\n")
  rep <- mod.specs[[spec]][[1]]
  summary <- mod.sums[[spec]]
  irow <- which(stock.info$name==spec)
  partab <- data.frame(Label=rep$parameters$Label[!is.na(rep$parameters$Active_Cnt)],
                       type=NA)
  # define parameter type
  partab$type[grep("NatM", partab$Label)] <- "M"
  partab$type[grep("L_at_A", partab$Label)] <- "growth"
  partab$type[grep("VonBert", partab$Label)] <- "growth"
  partab$type[grep("CV_", partab$Label)] <- "growth"
  partab$type[grep("SR_", partab$Label)] <- "SR"
  partab$type[grep("InitAge", partab$Label)] <- "recdev"
  partab$type[grep("RecrDev", partab$Label)] <- "recdev"
  partab$type[grep("ForeRecr_", partab$Label)] <- "forecast"
  partab$type[grep("Sel_", partab$Label)] <- "sel"
  partab$type[grep("Spline_", partab$Label)] <- "sel"
  partab$type[grep("Retain_", partab$Label)] <- "retain"
  partab$type[grep("Q_extraSD_", partab$Label)] <- "extraSD"
  partab$type[grep("Q_base", partab$Label)] <- "Q"
  partab$type[grep("Q_walk", partab$Label)] <- "Q"
  partab$type[grep("Q_power", partab$Label)] <- "Q"

  # tally counts by type
  stock.info$N_indices[irow] <- length(unique(rep$cpue$Fleet[!is.na(rep$cpue$Like)]))
  stock.info$N_index_obs[irow] <- sum(!is.na(rep$cpue$Like))
  stock.info$N_mortality_params[irow] <- sum(partab$type=="M", na.rm=TRUE)
  stock.info$N_growth_params[irow] <- sum(partab$type=="growth", na.rm=TRUE)
  stock.info$N_stock_recruit_params[irow] <- sum(partab$type=="SR", na.rm=TRUE)
  stock.info$N_recdev_params[irow] <- sum(partab$type=="recdev", na.rm=TRUE)
  stock.info$N_forecast_params[irow] <- sum(partab$type=="forecast", na.rm=TRUE)
  stock.info$N_select_params[irow] <- sum(partab$type=="sel", na.rm=TRUE)
  stock.info$N_retention_params[irow] <- sum(partab$type=="retain", na.rm=TRUE)
  stock.info$N_extra_SD[irow] <- sum(partab$type=="extraSD", na.rm=TRUE)
  stock.info$N_Q_params[irow] <- sum(partab$type=="Q", na.rm=TRUE)
  stock.info$N_params_total[irow] <- nrow(partab)
}

stock.info$N_other_params <- stock.info$N_params_total - apply(stock.info[,4:12], 1, sum)
write.csv(file=file.path(dir, "../stock_info.csv"), stock.info, row.names=FALSE)
}

########################################################
# make plot of relative spawning biomass timeseries
########################################################
if(2 %in% tasks){

endyr <- 2013
png(file=file.path(dir, paste0("../figs/survey_config_relative_SSB_end",endyr,".png")),
    width=8, height=10, res=300,units='in')
# setup multi-panel figure
par(mfrow=c(4,3), mar=c(.3,.3,.3,.3), oma=c(4,4.3,.1,.1))
# loop over species
for(spec in sort(species.name)[order]){
  cat(spec, "\n")
  #spec <- species.name[ispec]
  n <- mod.sums[[spec]]$n

  # calculate sigma
  SPB.EST.2013 <- mod.sums[[spec]]$SpawnBio[mod.sums[[spec]]$SpawnBio$Yr==2013,1:7]
  SPB.SD.2013 <- mod.sums[[spec]]$SpawnBioSD[mod.sums[[spec]]$SpawnBio$Yr==2013,1:7]
  sigma <- sqrt(log((SPB.SD.2013/SPB.EST.2013)^2+1))

  # empty plot
  plot(0, xlim=c(1945, endyr+12), ylim=c(0,1.3), xaxs='i', yaxs='i', type='n',
       xlab="", ylab="", axes=FALSE)

  # add legend in place of English model (excluded from results)
  if(spec == "English"){
    legend('center', lty=1, col=col[legend.order], legend=run.labels[legend.order],
           lwd=3, bty='n', title="Survey configuration")
  }else{
    print(endyr)
    # make plot of depletion
    SSplotComparisons(mod.sums[[spec]], subplot=4, new=FALSE, add=TRUE,
                      spacepoints=2050, type='l',
                      legend=FALSE,
                      #legend=(spec=="Aurora"),
                      endyrvec=endyr,
                      btarg = -1,
                      minbthresh = -1,
                      uncertainty=c(TRUE,rep(FALSE,6)),
                      legendloc='bottomleft', legendncol=1,
                      #lty=c(1,2,3,1,2,3,1),
                      lty=1,
                      #lty=c(1,2,1,2,1,2,1), 
                      #col=rich.colors.short(5)[c(1,2,3,3,4,4,5)],
                      #col=gray(level=seq(0,.7,length=n)),
                      col=col,
                      lwd=c(4, rep(2, n-1)),
                      #legendlabels=paste0(run.labels[1:n], " sigma=", round(sigma,2)))
                      legendlabels=run.labels[1:n])

    
    #rect(2014, 0, 2030, 2, col=grey(.9), border=FALSE)
    abline(v=2014.5, lty=3, col='grey')
    row2013 <- which(mod.sums[[spec]]$Bratio$Yr==2013)
    for(imodel in 1:7){
      lines(x=rep(endyr + seq(4,10,length=7)[imodel],2),
            y=c(mod.sums[[spec]]$BratioLower[row2013, imodel],
                mod.sums[[spec]]$BratioUpper[row2013, imodel]),
            col=col[imodel], lend=3, lwd=2.1)
      points(x=endyr + seq(4,10,length=7)[imodel],
             y=mod.sums[[spec]]$Bratio[row2013, imodel],
             col=col[imodel], pch=21, bg='white')


      ## points(seq(2018,2024,length=7)[imodel], sigma[imodel],
      ##        type='h', lend=3, lwd=3, col=col[imodel])
    }
    spec.legend <- species.legend[which(species.name==spec)]
    mtext(spec.legend, side=3, line=-1.5)
    if(par()$mfg[1]==par()$mfg[3]){
      #par(mgp=c(3,.8,0))
      axis(1, at=seq(1950, 2010, 10))
      #par(mgp=c(3,1,0))
      axis(1, at=endyr+7, label="Final") #, tick=FALSE)
      ## axis(1, at=2020, label=expression(italic(B[2013])))
    }
    if(par()$mfg[2]==1){
      axis(2, las=1)
    }
    box()
  }
}
mtext(side=1, line=2.5, outer=TRUE, "Year")
#mtext(side=2, line=2.5, outer=TRUE, "Relative spawning biomass")
mtext(side=2, line=2.3, outer=TRUE,
      expression(paste("Relative spawning output", ~~~(italic(B[t])/italic(B)[0]))))
dev.off()
 
}

########################################################
# make plot of spawning biomass timeseries
########################################################

if(5 %in% tasks){

endyr <- endyr
png(file=file.path(dir, paste0("../figs/survey_config_SSB_end",endyr,".png")),
    width=8, height=10, res=300,units='in')
# setup multi-panel figure
par(mfrow=c(4,3), mar=c(.3,.3,.3,.3), oma=c(4,4.3,.1,.1))
# loop over species
for(spec in sort(species.name)[order]){
  cat(spec, "\n")
  #spec <- species.name[ispec]
  n <- mod.sums[[spec]]$n

  # calculate sigma
  B0.EST <- mod.sums[[spec]]$SpawnBio[1,1:7]
  SPB.EST.2013 <- mod.sums[[spec]]$SpawnBio[mod.sums[[spec]]$SpawnBio$Yr==2013,1:7]
  SPB.SD.2013 <- mod.sums[[spec]]$SpawnBioSD[mod.sums[[spec]]$SpawnBio$Yr==2013,1:7]
  sigma <- sqrt(log((SPB.SD.2013/SPB.EST.2013)^2+1))

  # empty plot
  scale <- 2.1
  if(spec %in% c("Rex","Sharpchin","Yellowtail")){
    scale <- 4.7
  }
  plot(0, xlim=c(1933, endyr+12), ylim=c(0,scale*B0.EST[[1]]), xaxs='i', yaxs='i', type='n',
       xlab="", ylab="", axes=FALSE)

  #rect(2014, 0, 2030, 2, col=grey(.9), border=FALSE)
  abline(v=2014.5, lty=3, col='grey')
  ## # rectangle behind legend
  ## if(spec=="Canary"){
  ##   rect(1990, .55*par()$usr[4], 2030, par()$usr[4], col='white', border='white')
  ## }
  # add legend in place of English model (excluded from results)
  if(spec == "English"){
    legend('center', lty=1, col=col[legend.order], legend=run.labels[legend.order], lwd=3, bty='n',
           title="Survey configuration")
  }else{
    # make plot of depletion
    SSplotComparisons(mod.sums[[spec]], subplot=2, new=FALSE, add=TRUE,
                      spacepoints=2050, type='l',
                      #legend=(spec=="Canary"),
                      legend=FALSE,
                      endyrvec=endyr,
                      uncertainty=c(TRUE,rep(FALSE,6)),
                      legendloc='topright', legendncol=1,
                      #lty=c(1,2,3,1,2,3,1),
                      lty=1,
                      #lty=c(1,2,1,2,1,2,1), 
                      #col=rich.colors.short(5)[c(1,2,3,3,4,4,5)],
                      #col=gray(level=seq(0,.7,length=n)),
                      col=col,
                      lwd=c(4, rep(2, n-1)),
                      #legendlabels=paste0(run.labels[1:n], " sigma=", round(sigma,2)))
                      legendlabels=run.labels[1:n])

    # cover up early years to replace with uncertainty around B0
    rect(1930, 0, 1944, 1.2*par()$usr[4], col='white', border=NA)
    abline(v=1943.5, lty=3, col='grey')
    
    row2013 <- which(mod.sums[[spec]]$SpawnBio$Yr==2013)
    for(imodel in 1:7){
      # lines for final value
      lines(x=rep(endyr + seq(4,10,length=7)[imodel],2),
            y=c(mod.sums[[spec]]$SpawnBioLower[row2013, imodel],
                mod.sums[[spec]]$SpawnBioUpper[row2013, imodel]),
            col=col[imodel], lend=3, lwd=2.1)
      points(x=endyr + seq(4,10,length=7)[imodel],
             y=mod.sums[[spec]]$SpawnBio[row2013, imodel],
             col=col[imodel], pch=21, bg='white')


      # lines for B0
      lines(x=rep(seq(1935,1941,length=7)[imodel],2),
            y=c(mod.sums[[spec]]$SpawnBioLower[1, imodel],
                mod.sums[[spec]]$SpawnBioUpper[1, imodel]),
            col=col[imodel], lend=3, lwd=2.1)
      points(x=seq(1935,1941,length=7)[imodel],
             y=mod.sums[[spec]]$SpawnBio[1, imodel],
             col=col[imodel], pch=21, bg='white')

      ## points(seq(2018,2024,length=7)[imodel], sigma[imodel],
      ##        type='h', lend=3, lwd=3, col=col[imodel])
    }
    spec.legend <- species.legend[which(species.name==spec)]
    mtext(spec.legend, side=3, line=-1.5)
    if(par()$mfg[1]==par()$mfg[3]){
      #par(mgp=c(3,.8,0))
      axis(1, at=seq(1950, 2010, 10))
      #par(mgp=c(3,1,0))
      axis(1, at=endyr+7, label="Final") #, tick=FALSE)
      axis(1, at=1938, label=expression(italic(B)[0])) #, tick=FALSE)
      ## axis(1, at=2020, label=expression(italic(B[2013])))
    }
    if(par()$mfg[2]==1){
      axis(2, las=1, at=seq(0,5,.5)*B0.EST[[1]], label=seq(0,5,.5))
    }
    box()
  }
}
mtext(side=1, line=2.5, outer=TRUE, "Year")
#mtext(side=2, line=2.5, outer=TRUE, "Relative spawning biomass")
mtext(side=2, line=2.3, outer=TRUE,
      expression(paste("Spawning output relative to unfished value in status-quo configuration:",
          ~~~(italic(B[t])/italic(B)[0]^{status-quo}  ))))
dev.off()
 
}

if(6 %in% tasks){
  OFL.table <- data.frame(name = species,
                          full = NA,
                          half = NA,
                          even = NA,
                          odd = NA,
                          pass1 = NA,
                          pass2 = NA,
                          none = NA)
  for(spec in sort(species.name)[order]){
    cat(spec, "\n")
    summary <- mod.sums[[spec]]
    irow <- which(OFL.table$name==spec)

    for(imodel in 1:7){
      OFL.table[irow, imodel+1] <-
        mod.specs[[spec]][[imodel]]$derived_quants["OFLCatch_2015","Value"]
    }
  }
  OFL.table2 <- OFL.table
  # add extra row for mean absolute error
  new.row <- OFL.table2[1,]
  new.row$name <- "Mean abs. error"
  mean.abs.err <- rep(NA, 7)
  for(imodel in 2:7){
    # calculate relative error
    rel.errors <- OFL.table2[,1 + imodel]/OFL.table2[,1 + 1]
    # round and put into table
    OFL.table2[,1 + imodel] <- rel.errors # round(rel.errors, 2)
    # calculated rounded mean value
    new.row[,1 + imodel] <- mean(abs(rel.errors - 1)) #round(mean(abs(rel.errors - 1)), 2)
  }
  new.row[,1+1] <- NA
  OFL.table2 <- rbind(OFL.table2, new.row)
  write.csv(file=file.path(dir, "../tables/OFL2015_table.csv"), OFL.table2, row.names=FALSE)
}

if(8 %in% tasks){
  sig.table <- data.frame(name = species,
                          full = NA,
                          half = NA,
                          even = NA,
                          odd = NA,
                          pass1 = NA,
                          pass2 = NA,
                          none = NA)
  for(spec in sort(species.name)[order]){
    cat(spec, "\n")
    summary <- mod.sums[[spec]]
    irow <- which(sig.table$name==spec)

    for(imodel in 1:7){
      sig.table[irow, imodel+1] <- mod.specs[[spec]][[imodel]]$Pstar_sigma
    }
  }
  sig.table[,-1] <- round(sig.table[,-1], 2)
  sig.table <- data.frame(name=sig.table$name, category=1, default.sigma=0.36, sig.table[,-1])
  cat2species <- c("English","Rex","Sharpchin","Yellowtail")
  sig.table$category[sig.table$name %in% cat2species] <- 2
  sig.table$default.sigma[sig.table$name %in% cat2species] <- 0.72

  write.csv(file=file.path(dir, "../tables/sig_table.csv"), sig.table, row.names=FALSE)

  buffer.table <- sig.table
  for(irow in 1:nrow(buffer.table)){
    default <- sig.table$default.sigma[irow]
    for(icol in 3:ncol(buffer.table)){
      buffer.table[irow,icol] <-
        round(qlnorm(0.45, 0, sdlog=max(default, sig.table[irow,icol])), 3)
    }
  }
  write.csv(file=file.path(dir, "../tables/buffer_table.csv"), buffer.table, row.names=FALSE)

}

if(9 %in% tasks){
  relbio.table <- data.frame(name = species,
                          full = NA,
                          half = NA,
                          even = NA,
                          odd = NA,
                          pass1 = NA,
                          pass2 = NA,
                          none = NA)
  for(spec in sort(species.name)[order]){
    cat(spec, "\n")
    summary <- mod.sums[[spec]]
    irow <- which(relbio.table$name==spec)

    for(imodel in 1:7){
      relbio.table[irow, imodel+1] <- round(mod.specs[[spec]][[imodel]]$derived_quants["Bratio_2013","Value"], 2)
    }
  }
  
  write.csv(file=file.path(dir, "../tables/relbio_table.csv"), relbio.table, row.names=FALSE)
}

if(7 %in% tasks){
  B2013.table <- data.frame(name = species,
                          full = NA,
                          half = NA,
                          even = NA,
                          odd = NA,
                          pass1 = NA,
                          pass2 = NA,
                          none = NA)
  for(spec in sort(species.name)[order]){
    cat(spec, "\n")
    summary <- mod.sums[[spec]]
    irow <- which(B2013.table$name==spec)

    for(imodel in 1:7){
      B2013.table[irow, imodel+1] <- mod.specs[[spec]][[imodel]]$derived_quants["SPB_2013","Value"]
    }
  }
  B2013.table2 <- B2013.table
  # add extra row for mean absolute error
  new.row <- B2013.table2[1,]
  new.row$name <- "Mean abs. error"
  mean.abs.err <- rep(NA, 7)
  for(imodel in 2:7){
    # calculate relative error
    rel.errors <- B2013.table2[,1 + imodel]/B2013.table2[,1 + 1]
    # round and put into table
    B2013.table2[,1 + imodel] <- round(rel.errors, 2)
    # calculated rounded mean value
    new.row[,1 + imodel] <- round(mean(abs(rel.errors - 1)), 2)
  }
  new.row[,1+1] <- NA
  B2013.table2 <- rbind(B2013.table2, new.row)
  write.csv(file=file.path(dir, "../tables/B2013_table.csv"), B2013.table2, row.names=FALSE)
}

########################################################
# make plot of recruitment timeseries
########################################################

if(3 %in% tasks){
  
png(file=file.path(dir, "../figs/survey_config_recruitment_4-1-2019.png"),
    width=8, height=10, res=300,units='in')
# setup multi-panel figure
par(mfrow=c(4,3), mar=c(.3,.3,.3,.3), oma=c(4,4.3,.1,.1))
# loop over species
for(spec in sort(species.name)[order]){
  cat(spec, "\n")
  #spec <- species.name[ispec]
  n <- mod.sums[[spec]]$n

  # empty plot
  R0 <- mod.sums[[spec]]$recruits[1,1]
  year1 <- 1995
  space <- .2*(2013 - year1)
  plot(0, xlim=c(year1 - space, 2013),
       ylim=c(0, 4.4*R0),
       xaxs='i', yaxs='i', type='n',
       xlab="", ylab="", axes=FALSE)

  if(spec == "English"){
    legend('center', lty=1, col=col[legend.order],
           legend=run.labels[legend.order], lwd=3, bty='n',
           title="Survey configuration")
  }else{
    # make plot of recruitment
    SSplotComparisons(mod.sums[[spec]], subplot=7, new=FALSE, add=TRUE,
                      spacepoints=200, type='l',
                      #legend=(spec=="Canary"),'
                      legend=FALSE,
                      endyrvec=2012,
                      uncertainty=c(TRUE,rep(FALSE,6)),
                      #legendloc=c(.15,1),
                      legendloc='topright',
                      legendncol=1,
                      #lty=c(1,2,3,1,2,3,1),
                      lty=1,
                      #lty=c(1,2,1,2,1,2,1), 
                      #col=rich.colors.short(5)[c(1,2,3,3,4,4,5)],
                      #col=gray(level=seq(0,.7,length=n)),
                      col=col,
                      lwd=c(4, rep(2, n-1)),
                      legendlabels=run.labels[1:n])

    rect(1930, 0, year1, 5*R0, col='white', border=FALSE)
    abline(v=year1, lty=3, col='grey')
    for(imodel in 1:7){
      xval <- (year1 - space + space*(1+1:7)/10)[imodel]
      lines(x=rep(xval,2),
            y=c(mod.sums[[spec]]$recruitsLower[1, imodel],
                mod.sums[[spec]]$recruitsUpper[1, imodel]),
            col=col[imodel], lend=3, lwd=2.1)
      points(x=xval,
             y=mod.sums[[spec]]$recruits[1, imodel],
             col=col[imodel], pch=21, bg='white')
    }
    spec.legend <- species.legend[which(species.name==spec)]
    mtext(spec.legend, side=3, line=-1.5)
    if(par()$mfg[1]==par()$mfg[3]){
      par(mgp=c(3,.8,0))
      #axis(1, at=seq(10*ceiling(year1/10), 2010, 10))
      axis(1, at=seq(5*ceiling(year1/5), 2010, 5))
      par(mgp=c(3,1,0))
      axis(1, at=year1 - .5*space, label=expression(italic(R[0])))
      #axis(1, at=2020, label="Final", tick=FALSE)
    }
    if(par()$mfg[2]==1){
      axis(2, las=1, at=R0*pretty(c(0,4)), labels=pretty(c(0,4)))
    }
    #abline(h=R0, lty=3)
    box()
  }
  mtext(side=1, line=2.5, outer=TRUE, "Year")
  #mtext(side=2, line=2.5, outer=TRUE, "Relative spawning biomass")
  mtext(side=2, line=2.3, outer=TRUE,
        expression(paste("Recruitment relative to unfished value in status-quo model:",
            ~~~(italic(R[t])/italic(R)[0]^{status-quo}))))
}
dev.off()

}



########################################################
# make plot of SPR timeseries
########################################################

if(4 %in% tasks){
  
png(file=file.path(dir, "../figs/survey_config_SPR.png"),
    width=8, height=10, res=300,units='in')
# setup multi-panel figure
par(mfrow=c(4,3), mar=c(.3,.3,.3,.3), oma=c(4,4.3,.1,.1))
# loop over species
for(spec in sort(species.name)[order]){
  cat(spec, "\n")
  #spec <- species.name[ispec]
  n <- mod.sums[[spec]]$n

  # empty plot
  year1 <- 1960
  space <- .2*(2015 - year1)
  plot(0, xlim=c(year1, 2015),
       ylim=c(0, 2.0),
       xaxs='i', yaxs='i', type='n',
       xlab="", ylab="", axes=FALSE)
  
  # make plot of recruitment
  SSplotComparisons(mod.sums[[spec]], subplot=6, new=FALSE, add=TRUE,
                    spacepoints=200, type='l',
                    legend=(spec=="Aurora"),
                    endyrvec=2012,
                    uncertainty=c(TRUE,rep(FALSE,6)),
                    legendloc=c(.15,1), legendncol=1,
                    #lty=c(1,2,3,1,2,3,1),
                    lty=1,
                    #lty=c(1,2,1,2,1,2,1), 
                    #col=rich.colors.short(5)[c(1,2,3,3,4,4,5)],
                    #col=gray(level=seq(0,.7,length=n)),
                    col=col,
                    lwd=c(4, rep(2, n-1)),
                    legendlabels=run.labels[1:n])

  rect(1930, 0, year1, 5*R0, col='white', border=FALSE)
  abline(v=year1, lty=3, col='grey')
  for(imodel in 1:7){
    xval <- (year1 - space + space*(1+1:7)/10)[imodel]
    lines(x=rep(xval,2),
          y=c(mod.sums[[spec]]$recruitsLower[1, imodel],
              mod.sums[[spec]]$recruitsUpper[1, imodel]),
          col=col[imodel], lend=3, lwd=2.1)
    points(x=xval,
           y=mod.sums[[spec]]$recruits[1, imodel],
           col=col[imodel], pch=21, bg='white')
  }
  spec.legend <- species.legend[which(species.name==spec)]
  mtext(spec.legend, side=3, line=-1.5)
  if(par()$mfg[1]==par()$mfg[3]){
    par(mgp=c(3,.8,0))
    axis(1, at=seq(10*ceiling(year1/10), 2010, 10))
    par(mgp=c(3,1,0))
    axis(1, at=year1 - .5*space, label=expression(italic(R[0])))
    #axis(1, at=2020, label="Final", tick=FALSE)
  }
  if(par()$mfg[2]==1){
    axis(2, las=1, at=R0*pretty(c(0,3)), labels=pretty(c(0,3)))
  }
  #abline(h=R0, lty=3)
  box()
}
mtext(side=1, line=2.5, outer=TRUE, "Year")
#mtext(side=2, line=2.5, outer=TRUE, "Relative spawning biomass")
mtext(side=2, line=2.3, outer=TRUE,
      expression(paste("Spawning Potential Ratio (SPR)", ~~~(italic(SPR)))))
dev.off()

}

if(10 %in% tasks){

}

