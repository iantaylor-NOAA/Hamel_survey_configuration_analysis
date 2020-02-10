config <- c("status-quo", "half", "pass1", "pass2", "even", "odd", "no-WCGBTS")
vessel <- rep(c("A","B"), 10)
year <- 2003:2012
pass <- rep(1:2, 10)

dir <- file.path('C:/Users/Ian.Taylor/Documents/manuscripts/',
                 'Hamel et al 2018 SurveyConfigurationPaper/')
png(file=file.path(dir, "figs/Fig1_configuration.png"),
    width=9, height=4.5, res=300,units='in')

par(mar=rep(0.5,4))
plot(0, type='n', xlim=c(1999, 2013), ylim=c(17, 0), xaxs='i', yaxs='i', axes=FALSE)
text(x=2003+.1, y=0.5, labels="Year", font=2, pos=2)
text(x=2003:2012+.5, y=0.5, labels=2003:2012)
text(x=2003+.1, y=1.5, labels="Pass", font=2, pos=2)
text(x=seq(2003, 2012.5, .5)+.25, y=1.5, labels=1:2)
text(x=2000.2, y=2.5, labels="Configuration", font=2)
text(x=2000.2, y=seq(3,17,2)+1, labels=config, font=1)
text(x=2001.7, y=2.5, labels="Vessel", font=2)
text(x=2001.7, y=seq(3,17,1)+0.5, labels=c("A","B"), font=1)

# add color blocks
require(dichromat)
col <- c(1,colorschemes$Categorical.12[seq(2,12,2)])
for(i in 1:7){
  yvec <- 2*i + c(3,1)
  rect(xleft  = 1999,   ybottom =yvec[1],
       xright = 1999.3, ytop    =yvec[2],
       col=col[i], border=NA)
}
col <- 'grey50'


for(yr in 2003:2012){
  #status-quo
  rect(xleft  = yr+0,  ybottom =5,
       xright = yr+1,  ytop    =3,
       col=col, border=col)
  #half
  chosen <- c("A","B","A","A","B","B","A","B","B","A","A","A","A","A","A","A","A","B","B","B")
  pass1vessel <- chosen[(yr-2003)*2 + 1]
  pass2vessel <- chosen[(yr-2003)*2 + 2]
  print(yr)
  print(pass1vessel)
  print(pass2vessel)
  rect(xleft  = yr+0,  ybottom =ifelse(pass1vessel=="A", 6, 7),
       xright = yr+.5, ytop    =ifelse(pass1vessel=="A", 5, 6),
       col=col, border=col)
  rect(xleft  = yr+.5, ybottom =ifelse(pass2vessel=="A", 6, 7),
       xright = yr+1,  ytop    =ifelse(pass2vessel=="A", 5, 6),
       col=col, border=col)
  
  #even
  if(yr %% 2 == 0){
    rect(xleft  = yr+0,  ybottom =9 + 4,
         xright = yr+1,  ytop    =7 + 4,
         col=col, border=col)
  }
  #odd
  if(yr %% 2 == 1){
    rect(xleft  = yr+0,  ybottom =11 + 4,
         xright = yr+1,  ytop    =9  + 4,
         col=col, border=col)
  }
  #pass1
  rect(xleft  = yr+0,  ybottom =13 - 4,
       xright = yr+.5, ytop    =11 - 4,
       col=col, border=col)
  #pass2
  rect(xleft  = yr+.5, ybottom =15 - 4,
       xright = yr+1,  ytop    =13 - 4,
       col=col, border=col)
}
yr <- 2004
for(i in 1:7){
  yvec <- 2*i + c(3,2)
  rect(xleft  = yr+0,  ybottom =yvec[1],
       xright = yr+.5, ytop    =yvec[2],
       col='white', border=NA)
  segments(x0=yr, x1=yr+.5, y0=yvec, y1=rev(yvec), col=col)
}

# add color blocks
#  require(dichromat)
#  col <- c(1,colorschemes$Categorical.12[seq(2,12,2)])
#for(i in 1:7){


segments(x0=seq(2003.5, 2012.5, 1),
         x1=seq(2003.5, 2012.5, 1),
         y0=rep(3, 10),
         y1=rep(17, 10), col=1, lty=3, lwd=1)
segments(x0=2003,
         x1=2013,
         y0=seq(4, 16, 2),
         y1=seq(4, 16, 2), col=1, lty=3, lwd=1)
abline(h=c(2, seq(3,17,2)))
segments(x0=seq(2003, 2013, 1),
         x1=seq(2003, 2013, 1),
         y0=rep(3, 10),
         y1=rep(17, 10))

dev.off()
