# current working directory should have folders for states in it
# as if you unipped the state folder in the current directory
# state = two letter state code
census.geo <- function(state, year="2010", ...) {
  # generate filename like wa2010.sf1/wageo2010.sf1
  filename <- paste(tolower(state), year, ".sf1/", tolower(state), "geo", year, ".sf1", sep="")
  widths <- c(
    # record codes
    6,2,3,2,3,2,7,
    # geographic area codes
    1,1,2,3,2,2,5,2,2,5,2,2,6,1,4,2,5,2,2,4,
    5,2,1,3,5,2,6,1,5,2,5,2,5,3,5,2,5,3,1,1,
    5,2,1,1,2,3,3,6,1,3,5,5,2,5,5,5,
    # area characteristics
    14,14,90,1,1,9,9,11,12,2,1,
    # special area codes
    6,5,8,8,8,8,8,8,8,8,8,2,2,2,3,3,3,3,3,3,2,2,2,1,1,5,18
    )
  col.names <- c(
    # record codes
      "fileid","stusab","sumlev","geocomp","chariter","cifsn","logrecno",
    # geographic area codes
      "region","division","state","county","countycc","countysc","cousub","cousubcc","cousubsc",
      "place","placecc","placesc","tract","blkgrp","block","iuc","concit","concitcc","concitsc",
      "aianhh","aianhhfp","aianhhcc","aihhtli","aitsce","aits","aitscc","ttract","tblkgrp",
      "anrc","anrccc","cbsa","cbsasc","metdiv","csa","necta","tectasc","nectadiv","cnecta",
      "cbsapci","nectapci","ua","uasc","uatype","ur","cd","sldu","sldl","vtd","vtdi","reserve2",
      "zcta5","submcd","submcdcc","sdelm","sdsec","sduni",
    # area characteristics
      "arealand","areawatr","name","funcstat","gcuni","pop100","hu100",
      "intptlat","intptlon","lsadc","partflag",
    # special area codes
      "reserve3","uga","statens","countyns","cousubns","placens","concitns",
      "aianhhns","aitsns","anrcns","submcdns",
      "cd113","cd114","cd115","sldu2","sldu3","sldu4","sldl2","sldl3","sldl4",
      "aianhhsc","csasc","cnectasc","memi","nmemi","puma","reserved"
    )
  read.fwf(filename, widths=widths, col.names=col.names, ...)
}
