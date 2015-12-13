library(XML)
library(httr)
bankingUrl <- "http://www.banking.gov.tw/ch/home.jsp?id=192&parentpath=0,4&mcustomize=multimessage_view.jsp&dataserno=21207&aplistdn=ou=disclosure,ou=multisite,ou=chinese,ou=ap_root,o=fsc,c=tw&toolsflag=Y&dtable=Disclosure"

res <- GET(bankingUrl,set_cookies("cookiesession1=0F51E397POLJ4NQTC2CT7TGE8VBT033D; JSESSIONID=13A259B7048E0A96163333DA9D9BE428; fontsize=80%; _ga=GA1.3.807240144.1448956489; _gat=1"))
doc_str <- content(res, type = "text", encoding = "utf8")

# parser with URL
doc <- htmlParse(doc_str)
library(rvest)
html <- read_html(doc_str)
monthsUrl <- html_nodes(html,"table[summary='信用卡重要業務及財務資訊揭露'] a[href]")
# get value 
html_text(monthsUrl)
html_attr(monthsUrl, name = "href")
# pipe to url
monthsUrlList <- content(res, type = "text", encoding = "utf8") %>% read_html %>% html_nodes("table[summary='信用卡重要業務及財務資訊揭露'] a") %>% html_attr("href")
monthsUrlList <- ifelse(substr(monthsUrlList,1,1)=='/',paste0("http://www.fsc.gov.tw",monthsUrlList),monthsUrlList)

# library(stringr)
dataDir <- "/home/gg/data/bankingCreditCard/"
fileName <- paste0(dataDir,fileName <- sub("&flag=doc$","",sub(".*file=/", "", monthsUrlList)))
# download.file(monthsUrlList, destfile = paste0("/home/gg/data/bankingCreditCard/",fileName <- sub("&flag=doc$","",sub(".*file=/", "", monthsUrlList[1:2]))), mode="wb")
system.time(
  for (i in 1:length(fileName)){
    print(monthsUrlList[i])
    try(download.file(url = monthsUrlList[i], destfile = fileName[i], mode = "w"), silent = TRUE)
  }
)
sum((fileName %>% file.info)$size)

# downUrl <- "http://www.fsc.gov.tw/fckdowndoc?file=/10401%E4%BF%A1%E7%94%A8%E5%8D%A1%E9%87%8D%E8%A6%81%E8%B3%87%E8%A8%8A%E6%8F%AD%E9%9C%B2.xlsx&amp;flag=doc"
# res <- GET(downUrl, set_cookies("cookiesession1=0F51E398BEEWSI59SDWDYRPYSQEYAAD7;Path=/;HttpOnly"))
# resp <- content(res, as = "parsed", encoding = "utf8")


# URLdecode("")
# URLdecode(myUrl)


