# master directory
dir <- file.path('C:/Users/Ian.Taylor/Documents/manuscripts/',
                 'Hamel et al 2016 SurveyConfigurationPaper/Finished Runs')
# sub-directories for each species
species.dir <- dir(dir)
species.name <- rep(NA, length(species.dir))
# shorter names
names <- c("Darkblotched","Petrale","Sharpchin",
           "Aurora","Canary","Chilipepper", "Dover",
           "English","POP","Rex","Sablefish","Yellowtail")
# match vector of shorter names to vector of directories (same order)
for(name in names){
  species.name[grep(name, species.dir)] <- name
}

# get info on all the sub-directories
all.files <- dir(dir, recursive=TRUE)
rep.files <- all.files[basename(all.files)=="Report.sso"]
rep.dirs <- dirname(rep.files)

run.info <- data.frame(dir=rep.dirs, stringsAsFactors=FALSE)
# split out first element in each directory as the species folder
tmp <- strsplit(x=run.info$dir, split="/", fixed=TRUE)
run.info$species.dir <- unlist(lapply(tmp,
                                  function(x){strsplit(x, split="/",
                                                       fixed=TRUE)[[1]]}))
run.info$species.name <- NA
for(irow in 1:nrow(run.info)){
  run.info$species.name[irow] <- species.name[which(species.dir==
                                                      run.info$species.dir[irow])]
}

mods <- SSgetoutput(dirvec=file.path(dir, run.info$dir),
                    getcovar=FALSE, getcomp=FALSE)

mod.sums <- list()
for(ispec in 1:length(species.name)){
  spec <- species.name[ispec]
  cat(spec, "\n")
  mod.sums[[spec]] <- SSsummarize(mods[run.info$species.name==spec])
}

# setup multi-panel figure
par(mfrow=c(4,3), mar=c(.1,.1,.1,.1), oma=c(3,3,1,1))
# loop over species
for(ispec in 1:length(species.name)){
  spec <- species.name[ispec]
  # empty plot
  plot(0, xlim=c(1970, 2015), ylim=c(0,1.2), type='n',
       xlab="", ylab="", axes=FALSE)
  # make plot of depletion
  SSplotComparisons(mod.sums[ispec][[1]], subplot=3, new=FALSE, add=TRUE, pch=0)
  mtext(spec, side=3, line=-2)
  if(par()$mfg[1]==par()$mfg[3]){
    axis(1)
  }
  if(par()$mfg[2]==1){
    axis(2)
  }
  box()
}




### notes:
# Petrale base needs revised GLMM.
# English needs "none" case.
# Yellowtail needs "none" case.
# Sharpchin has repeat paths in file used for plotting.
