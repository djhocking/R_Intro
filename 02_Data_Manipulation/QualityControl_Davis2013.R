###########Quality control analysis of PZM data for inclusion in dataframe

#####I. Set working directory. (N.B. The "#" symbol comments out my annotations so that R doesn't read them

#You'll need to set the working directory when you use R scripts to process data files. You can get the file path by
# copying it from either windows explorer (PC) or the finder (Mac). Paste it in between the quotation marks below, and then
# add an extra forward-slash to tell R where to go.

# Here's an extra copy of my file path for you to use in case you get disoriented
#setwd("C:\\Users\\asdavis1.UIUC\\Documents\\Current Work\\Experimental Work\\Data\\PZM\\2013\\Quality control")

setwd("C:\\Users\\asdavis1.UIUC\\Documents\\Current Work\\Experimental Work\\Data\\PZM\\2013\\Quality control")

setwd("/Users/Dan/Documents/Teaching/R_intro/")


# Load any R libraries you'll need. Here, I'm firing up 'lattice', which I'll use to create trellis plots for QC
install.packages('lattice')
library(lattice)


#####II. Data import & error checking
pzm <- read.table("SeedTrtment_Litter_R.txt", header=T)

#II.a. Have all variables been imported in proper format?

edit(pzm) #take a look at the dataframe
names(pzm) #get list of variable names, and paste it in, below, for easy use. Also compare the list to the metadata page

# [1] "index"                  "location"               "yr"                    
# [4] "plot"                   "block"                  "type"                  
# [7] "data.priority"          "crop"                   "row.position"          
#[10] "tillage"                "cover.trt"              "cover.spp"             
#[13] "bd5.ss1"                "h2o.5.ss1"              "pmn5.ss1"              
#[16] "pmc5.ss1"               "rh.ss1"                 "rw.ss1"                
#[19] "midd.dens"              "cover.dens"             "cover.kgha"            
#[22] "rh.ss2"                 "rw.ss2"                 "pmn5.ss2"              
#[25] "pmc5.ss2"               "bd5.ss2"                "h2o.5.ss2"             
#[28] "bacteria.cc5.ss2"       "fungi.cc5.ss2"          "Pase.act5.ss2"         
#[31] "CBHase.act5.ss2"        "NAGase.act5.ss2"        "biogerm5.ss2"          
#[34] "biorl5.ss2"             "wsa5.ss2"               "pmn20.ss2"             
#[37] "pmc20.ss2"              "bd20.ss2"               "h2o.20.ss2"            
#[40] "bacteria.cc20.ss2"      "fungi.cc20.ss2"         "Pase.act20.ss2"        
#[43] "CBHase.act20.ss2"       "NAGase.act20.ss2"       "biogerm20.ss2"         
#[46] "biorl20.ss2"            "wsa20.ss2"              "amf.v1"                
#[49] "m.pop.init"             "spad.v6"                "iris"                  
#[52] "bd5.ss3"                "h2o.5.ss3"              "pmn5.ss3"              
#[55] "pmc5.ss3"               "bacteria.cc5.ss3"       "fungi.cc5.ss3"         
#[58] "Pase.act5.ss3"          "CBHase.act5.ss3"        "NAGase.act5.ss3"       
#[61] "bd20.ss3"               "h2o.20.ss3"             "pmn20.ss3"             
#[64] "pmc20.ss3"              "bacteria.cc20.ss3"      "fungi.cc20.ss3"        
#[67] "Pase.act20.ss3"         "CBHase.act20.ss3"       "NAGase.act20.ss3"      
#[70] "spad.v12"               "spad.vT"                "spad.R2"               
#[73] "tissN.black.total.pct"  "tissN.black.grain.pct"  "tissN.black.cob.pct"   
#[76] "tissN.black.stover.pct" "m.biomass.total"        "m.biomass.grain"       
#[79] "m.biomass.cob"          "m.biomass.stover"       "m.yld"                 
#[82] "m.pop.final"            "sb.yld"                 "weed.bio"              
#[85] "weed.cc"                "bd5.ss4"                "h2o.5.ss4"             
#[88] "pmn5.ss4"               "pmc5.ss4"               "stov.dec5.ss4"         
#[91] "pox.c5.ss4"             "amf.cc5.ss4"            "bd20.ss4"              
#[94] "h2o.20.ss4"             "pmn20.ss4"              "pmc20.ss4"             
#[97] "stov.dec20.ss4"         "pox.c20.ss4"            "amf.cc20.ss4"          


#now check the variable type for each of the columns; is it what you intended? if something that
# you intended to be an integer or numeric type variable turned into a factor, check cell formatting in the source
# Excel worksheet

lapply(pzm,class) # list form
c<-as.data.frame(sapply(pzm,class)) # vector form, formatted as dataframe for easier viewing
edit(c)

#II.b Checking values

#For factors, look at list of unique values for each variable
f<-pzm[,sapply(pzm,is.factor)] #Returns subset of dataframe, with only factors

names(f)
#[1] "location"      "type"          "data.priority" "crop"         
#[5] "row.position"  "tillage"       "cover.trt"     "cover.spp"  

attach(f) #This temporarily makes the variable names in the dataframe available to R. Don't forget to detach!!
sort(unique(tillage)) #Do this for each of the factor variables; are there the right number of levels? Any repeats, different spelling?
                      #If you find repeats, go back and correct the excel worksheet, save as tab-delim. text file and 
                      #re-import into R. This step is very important in order to avoid having spurious extra factor levels.
detach(f)


#For numeric and integer type variables, use either graphical displays or summary stats to investigate the data range & mean

names(pzm[,sapply(pzm,is.numeric)])
# [1] "index"                  "yr"                     "plot"                  
# [4] "block"                  "bd5.ss1"                "h2o.5.ss1"             
# [7] "pmn5.ss1"               "pmc5.ss1"               "rh.ss1"                
#[10] "rw.ss1"                 "midd.dens"              "cover.dens"            
#[13] "cover.kgha"             "rh.ss2"                 "rw.ss2"                
#[16] "pmn5.ss2"               "pmc5.ss2"               "bd5.ss2"               
#[19] "h2o.5.ss2"              "bacteria.cc5.ss2"       "fungi.cc5.ss2"         
#[22] "biogerm5.ss2"           "biorl5.ss2"             "pmn20.ss2"             
#[25] "pmc20.ss2"              "bd20.ss2"               "h2o.20.ss2"            
#[28] "bacteria.cc20.ss2"      "fungi.cc20.ss2"         "biogerm20.ss2"         
#[31] "biorl20.ss2"            "spad.v6"                "iris"                  
#[34] "bd5.ss3"                "h2o.5.ss3"              "pmn5.ss3"              
#[37] "pmc5.ss3"               "bacteria.cc5.ss3"       "fungi.cc5.ss3"         
#[40] "bd20.ss3"               "h2o.20.ss3"             "pmn20.ss3"             
#[43] "pmc20.ss3"              "bacteria.cc20.ss3"      "fungi.cc20.ss3"        
#[46] "spad.v12"               "spad.vT"                "spad.R2"               
#[49] "tissN.black.total.pct"  "tissN.black.grain.pct"  "tissN.black.cob.pct"   
#[52] "tissN.black.stover.pct" "m.biomass.total"        "m.biomass.grain"       
#[55] "m.biomass.cob"          "m.biomass.stover"       "m.yld"                 
#[58] "m.pop.final"            "sb.yld"                 "weed.bio"  

quantile(na.omit(pzm$m.yld)) #Overall

attach(pzm)
tapply(m.yld,tillage, quantile, na.rm=T)  #By study site
detach(pzm)

#Above code produces a table, and it's ok, but I find visuals easier to interpret (see below, for trellis plots)


#Trellis plots
g<-pzm[pzm$type=='foundational',] #keep all columns of 'pzm'; select only those data rows that relate to foundational plots
attach(g)
dotplot(tillage~m.yld|cover.trt, xlab = "Maize yield (kg/ha)",xlim =c(4000,10000)) 
detach(g)

attach(pzm)
dotplot(cover.spp~na.omit(cover.kgha)|cover.trt*tillage, xlab = "Cover crop biomass (kg/ha)",xlim =c(0,1500)) 
detach(pzm)




#Kernel histogram
g<-pzm[pzm$type=='foundational',] #keep all columns of 'pzm'; select only those data rows that relate to foundational plots
attach(g)
densityplot(~m.yld|tillage*cover.trt, xlab = "Maize yield (kg/ha)",xlim =c(4000,10000)) 
detach(g)

g<-pzm[pzm$data.priority=='critical',] 
attach(g)
densityplot(row.position~na.omit(bd5.ss1)|cover.trt*tillage, xlab = "Bulk density SS I (g/cm3)",xlim =c(0.8,1.4)) 
detach(g)
