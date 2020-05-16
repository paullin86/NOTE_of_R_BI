# pacman::p_load(dplyr, googleVis)
load("data/R.rdata")
library(readr)
twGovExp <- read_table2("data/twGovExp.csv", 
                        locale = locale(encoding = "BIG5"))
# View(twGovExp)
colnames(twGovExp) <- enc2utf8(colnames(twGovExp))

# Encoding(twGovExp)<- "UTF-8"
twGovExp$county<-enc2utf8(twGovExp$county)
enc2utf8(twGovExp)
twGovExp <- as.data.frame(iconv(twGovExp,"big5","UTF-8"))
data.frame(twGovExp)

library(googleVis)
# op = options(gvis.plot.tag='chart')
plot( gvisMotionChart(
  twGovExp,"county","year","經濟發展","債務","教科文","總預算",
  options=list(width="900px", height="600px")) )
