#stop()
  ### read all info from Rdata file
  # master directory
  dat.dir <- file.path('C:/Users/Ian.Taylor/Documents/manuscripts/',
                       'Hamel et al 2018 SurveyConfigurationPaper/Data_from_Thorson')
  tows.rex <- read.csv(file.path(dat.dir,
                                 "VesselEffectsStudy_20130916--SlopeShelf2003To2012_rex.csv"),
                       skip=8)
  tows <- read.csv(file.path(dat.dir,
                             "VesselEffectsStudy_20130916--SlopeShelf2003To2012_v2.csv" ))

  tows$Yr <- as.numeric(substring(tows$SURVEY_CYCLE, nchar("Cycle ")+1))
  tows.rex$Yr <- as.numeric(substring(tows.rex$PROJECT_CYCLE, nchar("Cycle ")+1))
  

  colname.table <- data.frame(species=species, stringsAsFactors=FALSE)
  colname.table$name <- c("AURORA_ROCKFISH_WT_KG",
                          "CANARY_ROCKFISH_WT_KG",
                          "CHILIPEPPER_WT_KG",
                          "DARKBLOTCHED_ROCKFISH_WT_KG",
                          "DOVER_SOLE_WT_KG",
                          "ENGLISH_SOLE_WT_KG",
                          "PETRALE_SOLE_WT_KG",
                          "PACIFIC_OCEAN_PERCH_WT_KG",
                          "REX",
                          "SABLEFISH_WT_KG",
                          "SHARPCHIN_ROCKFISH_WT_KG",
                          "YELLOWTAIL_ROCKFISH_WT_KG")

  count.table <- data.frame(Species=c("Total",species), stringsAsFactors=FALSE)
  count.table$AllYrs <- NA
  for(yr in 2003:2012){
    count.table[[paste(yr)]] <- NA
  }
  count.table$AllYrs[1] <- nrow(tows)
  for(yr in 2003:2012){
    count.table[1, names(count.table)==yr] <- sum(tows$Yr==yr)
  }
  
  for(ispec in 1:12){
    spec <- colname.table$species[ispec]
    name <- colname.table$name[ispec]
    row <- which(count.table$Species==spec)
    print(row)
    if(spec=="Rex"){
      wt <- tows.rex$HAUL_WT_KG
      yrs <- tows.rex$Yr
    }else{
      wt <- tows[[name]]
      yrs <- tows$Yr
    }
    count.table$AllYrs[row] <- sum(wt > 0)
    for(yr in 2003:2012){
      count.table[row, names(count.table)==yr] <- sum(wt[yrs==yr] > 0)
    }
  }

  count.table
##         Species AllYrs 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012
## 1         Total   6453  541  471  637  642  688  681  682  713  697  701
## 2        Aurora    886   67   55   89   87   94  119   88   92   94  101
## 3        Canary    442   50   37   53   32   48   36   33   51   46   56
## 4   Chilipepper    849   86   81   87   71   68   80   81  106   84  105
## 5  Darkblotched   1133  101   92  112  130  132  111  126  117  110  102
## 6         Dover   5348  444  407  552  530  580  556  545  601  572  561
## 7       English   2568  223  215  287  230  240  236  246  286  302  303
## 8       Petrale   2683  198  216  279  248  258  258  279  325  323  299
## 9           POP    448   47   36   38   33   50   40   47   53   53   51
## 10          Rex   4020  351  313  427  398  426  399  398  443  430  435
## 11    Sablefish   4211  421  332  447  399  430  421  419  457  457  428
## 12    Sharpchin    397   53   33   35   43   35   26   39   43   49   41
## 13   Yellowtail    409   35   27   47   36   45   37   41   47   48   46


even.vs.odd <- data.frame(species=count.table$Species,
                          even=apply(count.table[,seq(4,12,2)], 1, sum),
                          odd=apply(count.table[,seq(3,12,2)], 1, sum))

even.vs.odd$even.to.odd.ratio <- round(100*even.vs.odd$even/even.vs.odd$odd,1)
even.vs.odd$even.frac <- round(100*even.vs.odd$even/(even.vs.odd$even+even.vs.odd$odd),0)
