MOPS_URL.TWSE_ALL <-
  "http://www.twse.com.tw/en/listed/listed_company/apply_listing.php?page=1"

library(rvest)
library(XML)
web_page <- htmlParse(MOPS_URL.TWSE_ALL, encoding="big5")

web_page <- read_html(iconv(MOPS_URL.TWSE_ALL,to = "big5"), encoding = "big5")
data <- readHTMLTable(MOPS_URL.TWSE_ALL, which=6, stringsAsFactors=F, header = T)
names(data) <- 
  c("Application Date", "Code", "Company", "Chairman","Amount of Capital",
    "Underwriter")
data <- data[-1,]
head(data, n=3)


