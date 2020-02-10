require(r4ss)
# master directory
dir <- file.path('C:/Users/Ian.Taylor/Documents/manuscripts/',
                 'Hamel et al 2018 SurveyConfigurationPaper/')
species <- c("Aurora", "Canary", "Chilipepper", "Darkblotched",
             "Dover", "English", "Petrale", "POP",
             "Rex", "Sablefish", "Sharpchin", "Yellowtail")

species.legend <- species
species.legend[c(1:4,11:12)] <- paste(species[c(1:4,11:12)], "rockfish")
species.legend[c(5:7,9)] <- paste(species[c(5:7,9)], "sole")
species.legend[8] <- paste("Pacific ocean perch")
species.legend[species %in% c("Rex", "Sharpchin", "Yellowtail")] <-
  paste(species.legend[species %in% c("Rex", "Sharpchin", "Yellowtail")], "(DM)")

interval <- 0.75

### function to add intervals to plot
index.fn <- function(dat, col=1, pch=16, x.adj=0, scale=1,
                     length=0.02, type='p', lty=2, interval=0.95,...){
  # function adding to a plot a series of index values with intervals
  # input is a data.frame with 3 columns:
  #  1. year,
  #  2. biomass, and
  #  3. SD of biomass on a log scale
  yrs <- dat[,1] + x.adj
  bio <- dat[,2]
  sdlog <- dat[,3]
  qlo <- (1-interval)/2
  qhi <- 1 - qlo
  arrows(x0 = yrs, y0 = scale*qlnorm(qlo, meanlog=log(bio), sdlog=sdlog),
         x1 = yrs, y1 = scale*qlnorm(qhi, meanlog=log(bio), sdlog=sdlog),
         length = length, angle = 90, code = 3, col = col)
  points(yrs, scale*bio, pch=pch, col=col, type=type, lty=lty, ...)
}

### read indices
dir.index <- file.path(dir, 'Indices')
dir(dir.index)
filenames <- paste0("Index_estimates_",
                    c("AURORA_ROCKFISH_WT_KG",
                      "CANARY_ROCKFISH_WT_KG",
                      "CHILIPEPPER_WT_KG",
                      "DARKBLOTCHED_ROCKFISH_WT_KG",
                      "DOVER_SOLE_WT_KG",
                      "ENGLISH_SOLE_WT_KG",
                      "PETRALE_SOLE_WT_KG",
                      "PACIFIC_OCEAN_PERCH_WT_KG",
                      "rex",
                      "SABLEFISH_WT_KG",
                      "SHARPCHIN_ROCKFISH_WT_KG",
                      "YELLOWTAIL_ROCKFISH_WT_KG"),
                    ".csv")

filenames %in% dir(dir.index)
## [1] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE

png(file=file.path(dir, "figs/Fig2_indices.png"),
    width=8, height=10, res=300,units='in')
# setup multi-panel figure
par(mfrow=c(4,3), mar=c(.3,2,.3,.3), oma=c(4,2.3,.1,.1))
# loop over species
order <- c(1:5, 7:8, 10, 6, 9, 11:12)
for(spec in sort(species)[order]){
  cat(spec, "\n")

  # scaling for units (convert kgs to 1000s of tons)
  scale <- 1e-6

  # read file with indices in it
  inds <- read.csv(file.path(dir.index, filenames[which(species==spec)]))
  inds <- inds[1:length(2003:2012),] # some files have extra rows below
  # missing year column for English file
  if(spec=="English"){
    inds$X <- 2003:2012 # add header (no longer used)
    # add legend
    plot(0, type='n', axes=FALSE, xlab="", ylab="")
    legend('center', lty=1, col=col[1:6], legend=runs[1:6], lwd=3, bty='n',
           title='Survey configuration')
  }else{
    
    # max = top of largest interval, capped at 1500
    ## ymax <- 1.1*min(1500, max(scale*qlnorm(.95,meanlog=(unlist(log(inds[seq(2,12,2)]))),
    ##                               sdlog=(unlist(inds[seq(3,13,2)]))),
    ##                           na.rm=TRUE))
    # max = top of largest interval, capped at 2*largest point estimate
    ymax <- 1.1*min(max(scale*qlnorm(1 - (1-interval)/2,
                                     meanlog=(unlist(log(inds[seq(2,12,2)]))),
                                     sdlog=(unlist(inds[seq(3,13,2)]))),
                        na.rm=TRUE),
                    3*max(scale*inds[seq(2,12,2)], na.rm=TRUE))
    
    # print upper values for Sablefish that get truncated
#    if(spec=="Sablefish"){
      maxvals <- scale*qlnorm(1 - (1-interval)/2,
                              meanlog=(unlist(log(inds[seq(2,12,2)]))),
                              sdlog=(unlist(inds[seq(3,13,2)])))
      print(cbind(2003:2012, round(maxvals))[!is.na(maxvals) & maxvals > ymax,])
#    }
    # make empty plot
    pad <- 0.8*c(-1, 1)
    plot(0, xlim=c(2003, 2012) + pad,
         ylim=c(0, ymax),
         xaxs='i', yaxs='i', type='n',
         xlab="", ylab="", axes=FALSE)
    # get vector of colors
    source(file.path(dir, 'R/color_settings.R'))

    # values for legend
    runs <- c("status-quo", "half", "pass1", "pass2", "even", "odd", "none")
    # which column has biomass estimates (following column has sdlog values)
    col.order <- c(2,8,10,12,4,6,NA)
    # loop over configurations
    for(imodel in 1:6){
      icol <- col.order[imodel]
      # make plot using function defined above
      index.fn(dat=inds[,c(1, icol, icol + 1)], scale=scale,
               col=col[imodel], x.adj=(imodel-4)/10, interval=interval)
    }
    spec.legend <- species.legend[which(species==spec)]
    mtext(spec.legend, side=3, line=-1.5, adj=0.5)
    if(par()$mfg[1]==par()$mfg[3]){
      par(mgp=c(3,.8,0))
      par(mgp=c(3,1,0))
      axis(1, at=2003:2012)
    }
    axis(2, las=0)
    box()
  }
}
mtext(side=1, line=2.5, outer=TRUE, "Year")
mtext(side=2, line=0.5, outer=TRUE, "Estimated biomass (x1000 t)")
dev.off()


####
vec <- NULL
for(spec in sort(species)[order]){
  cat(spec, "\n")
  # read file with indices in it
  inds <- read.csv(file.path(dir.index, filenames[which(species==spec)]))
  inds <- inds[1:length(2003:2012),] # some files have extra rows below
  print(round(mean(inds$unchanged_SdLog), 3))
  ## print(round(range(apply(inds[,grep("SdLog", names(inds))], 2, mean, na.rm=TRUE)[-1]),3))
  ## print(round(range(apply(inds[,grep("SdLog", names(inds))], 2, mean, na.rm=TRUE)[-1] - mean(inds$unchanged_SdLog)),3))
  ## print(round(range(apply(inds[,grep("SdLog", names(inds))], 2, mean, na.rm=TRUE)[-1] - mean(inds$unchanged_SdLog)),3))

  ## print(round(mean(apply(inds[,grep("SdLog", names(inds))][,-1] -
  ##                           inds$unchanged_SdLog, 2, mean, na.rm=TRUE)),3))
  val <- round(mean(as.matrix(inds[,grep("SdLog", names(inds))][,-1] -
                                inds$unchanged_SdLog), na.rm=TRUE),3)
  vec <- c(vec, val)
  print(val)
  print(round(range(apply(inds[,grep("SdLog", names(inds))][,-1] -
                            inds$unchanged_SdLog, 2, mean, na.rm=TRUE)),3))
}

(df <- data.frame(val=vec, spec=sort(species)[order]))
##      val         spec
## 1  0.132       Aurora
## 2  0.146       Canary
## 3  0.240  Chilipepper
## 4  0.150 Darkblotched
## 5  0.036        Dover
## 6  0.069      Petrale
## 7  0.317          POP
## 8  0.642    Sablefish
## 9  0.083      English
## 10 0.040          Rex
## 11 0.392    Sharpchin
## 12 0.197   Yellowtail

round(range(df$val[!df$spec %in% c("Dover","Petrale","English","Rex")]), 2)
##[1] 0.13 0.64
round(range(df$val[df$spec %in% c("Dover","Petrale","Rex")]), 2)
##[1] 0.04 0.07

### again with CV instead of SdLog
vec <- NULL
for(spec in sort(species)[order]){
  cat(spec, "\n")
  # read file with indices in it
  inds <- read.csv(file.path(dir.index, filenames[which(species==spec)]))
  inds <- inds[1:length(2003:2012),] # some files have extra rows below
  inds2 <- inds # copy file
  inds2[,grep("SdLog", names(inds2))] <- sqrt(exp(inds2[,grep("SdLog", names(inds2))]^2) - 1)
  print(round(mean(inds2$unchanged_SdLog), 3))
  val <- round(mean(as.matrix(inds2[,grep("SdLog", names(inds2))][,-1] -
                                inds2$unchanged_SdLog), na.rm=TRUE),3)
  vec <- c(vec, val)
  print(val)
  print(round(range(apply(inds2[,grep("SdLog", names(inds2))][,-1] -
                            inds2$unchanged_SdLog, 2, mean, na.rm=TRUE)),3))
}

(df <- data.frame(val=round(vec,2), spec=sort(species)[order]))
##     val         spec
## 1  0.15       Aurora
## 2  0.22       Canary
## 3  0.33  Chilipepper
## 4  0.19 Darkblotched
## 5  0.04        Dover
## 6  0.07      Petrale
## 7  0.64          POP
## 8  1.52    Sablefish
## 9  0.08      English
## 10 0.04          Rex
## 11 0.80    Sharpchin
## 12 0.26   Yellowtail

round(range(df$val[df$spec %in% c("Sablefish")]), 2)
##[1] 1.52 1.52
round(range(df$val[!df$spec %in% c("Dover","Petrale","English","Rex", "Sablefish")]), 2)
##[1] 0.15 0.80
round(range(df$val[df$spec %in% c("Dover","Petrale","Rex")]), 2)
##[1] 0.04 0.07
