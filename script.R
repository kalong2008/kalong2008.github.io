#Load library
library(tidyverse)
library(rvest)

# declare XML sitemap url
url <- 'https://www.rforseo.com/sitemap.xml'

# grab html 

url_html <- read_html(url)

# Select all the <loc>'s
# and count them

nbr_url <- url_html %>% 
  html_nodes("loc")  %>%
  length()

# create a new row of data, with todayd's date and urls number
row <- data.frame(Sys.Date(), nbr_url)

# append at the end of the csv the new data
write_csv(row,paste0('data/xml_url_count.csv'),append = T)   
