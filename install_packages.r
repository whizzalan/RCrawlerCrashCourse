packages_w1 <- c("rvest","stringr","selectr","quantmod","devtools","rjson","jsonlite","rlist","magrittr","pipeR")
packages_w2 <- c("data.table","rodbc","rjdbc","rmysql","RSQLite","RExcel","XLConnect")           
packages_w3 <- c("ggplot2","shiny","shinyapps","rmarkdown","circlize")              
packages_w4 <- c("e1071","jiebaR","xgboost") #"mxnet"
packages <- c(packages_w1)
if (length(setdiff(packages, rownames(installed.packages()))) > 0) {
  install.packages(setdiff(packages, rownames(installed.packages())),repos="http://cran.r-project.org")
}

github_Packages <- c('ramnathv/slidifyLibraries','ramnathv/slidify')
github_PackagesName <- sapply(strsplit(github_Packages,"/"),function(x)x[2])
if (length(setdiff(github_PackagesName, rownames(installed.packages()))) > 0) {
  index <- match(x = setdiff(github_PackagesName, rownames(installed.packages())), table = github_PackagesName)
  install_github(github_Packages[index])
}


