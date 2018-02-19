# load twitter library - the rtweet library is recommended now over twitteR
library(rtweet)
# plotting and pipes - tidyverse!
library(ggplot2)
library(dplyr)
# text mining library
library(tidytext)
# plotting packages
library(igraph)
library(ggraph)
library(base64enc)
library(devtools)
#install_github("twitteR", username="geoffjentry")
library(twitteR)


# Find tweet using forest fire in them
src_tweets <- search_tweets(q = "#Wakandaforever", n = 10000, lang = "en",
                                include_rts = FALSE)

api_key <- "Ca4tjGIoJTf7BLUdbyjWL9PWv"

api_secret <- "BkGjlugBwsnVEwdm1FKN4G3pBfaTXNoTqC0IG2B1fAnTBzMmhV"

access_token <- "132496406-16m33EdXUAsCv4mgkUXE7M0UnVDBdezQMEXyMO63"

access_token_secret <- "2EUWDf5wSK5vEtWCcALeSK058ak1tpnM0b9LmV0nFUK2B"

setup_twitter_oauth(api_key,api_secret)




