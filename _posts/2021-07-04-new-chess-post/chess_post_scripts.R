library(httr); library(jsonlite)
#library(reticulate)



url <- "https://lichess.org/api/games/user/hotleafjuice"

request <- GET(url, accept_json(),
               headers={"Accept": "application/x-ndjson"})

request3 <- GET(url, accept("application/x-ndjson"))

token <- "j6iPLB7UexGA1Ad2" #hidden for security purposes

configs <- list(accept("application/x-ndjson"), 
                add_headers(Authorization = 'Bearer j6iPLB7UexGA1Ad2'))

request4 <- GET(url, configs)

request5 <- GET(url, accept("application/x-ndjson"), 
                add_headers(Authorization = paste("Bearer", token, sep = " ")))

#query <- list(rated = TRUE, 
#              perfType = "blitz,rapid,classical",
#              clocks = TRUE,
#              opening = TRUE)

query <- list(rated = "true", 
              perfType = "blitz,rapid,classical",
              clocks = "true",
              opening = "true")


request6 <- GET(url, 
                accept("application/x-ndjson"), 
                add_headers(Authorization = paste("Bearer", token, sep = " ")),
                query = query)

request7 <- GET(url, 
                accept("application/x-ndjson"), 
                add_headers(Authorization = paste("Bearer", token, sep = " ")),
                query = query2)




test <- content(request, as="text", encoding = 'utf-8')

small <- "{\"id\":\"NDxEazyM\",\"rated\":false,\"variant\":\"standard\",\"speed\":\"rapid\",\"perf\":\"rapid\",\"createdAt\":1501607469962,\"lastMoveAt\":1501608759994,\"status\":\"outoftime\",\"players\":{\"white\":{\"user\":{\"name\":\"suhtKesine\",\"id\":\"suhtkesine\"},\"rating\":1571},\"black\":{\"user\":{\"name\":\"hotleafjuice\",\"id\":\"hotleafjuice\"},\"rating\":1584}},\"winner\":\"white\",\"moves\":\"e4 c5 Nf3 d6 c3 e5 d4 cxd4 cxd4 Nc6 d5 Nce7 Nc3 Nf6 Bg5 Ng6 Bb5+ Bd7 Qa4 Be7 Qb4 O-O O-O Qb6 a3 Bxb5 Nxb5 Nxe4 Bxe7 Nxe7 Rfe1 Qxf2+ Kh1 f5 Nxd6 Nxd6 Qxd6 Ng6 Nxe5 Rae8 h3 Nxe5 Rxe5 Qxb2 Rae1 Rxe5 Rxe5 Qc1+ Kh2 Qf4+ Kh1 Qc1+ Kh2 Qf4+ Kh1 Qf1+ Kh2 f4 Qe6+\",\"clock\":{\"initial\":600,\"increment\":8,\"totalTime\":920}}\n{\"id\":\"YdDnL5ye\",\"rated\":false,\"variant\":\"standard\",\"speed\":\"rapid\",\"perf\":\"rapid\",\"createdAt\":1501013779630,\"lastMoveAt\":1501015437790,\"status\":\"mate\",\"players\":{\"white\":{\"user\":{\"name\":\"hotleafjuice\",\"id\":\"hotleafjuice\"},\"rating\":1574},\"black\":{\"user\":{\"name\":\"suhtKesine\",\"id\":\"suhtkesine\"},\"rating\":1571}},\"winner\":\"white\",\"moves\":\"e4 e5 Nf3 f5 exf5 Bc5 Nc3 e4 Nxe4 Bb6 h3 Nf6 Nxf6+ Qxf6 Qe2+ Kf7 Qc4+ Kf8 g4 d6 d4 Nc6 Be3 Bd7 O-O-O Re8 Bg5 Na5 Qc3 Qf7 Bg2 Qxa2 d5 Qa1+ Kd2 Qa2 Nh4 Nc4+ Kd3 Nxb2+ Kd2 Nxd1 Rxd1 Bxf2 Bh6 Re7 f6 Rf7 Bxg7+ Kg8 Qxc7 Bxh4 Qd8+ Be8 Qxe8+ Rf8 Qxf8#\",\"clock\":{\"initial\":300,\"increment\":8,\"totalTime\":620}}\n"


#install.packages("ndjson")
library(ndjson)

to <- toJSON(small)
write(to, "output.json")

test_df <- ndjson::stream_in("output.json")


#d <- strsplit(readLines("output.json"),"\n")


#new day


test_df2 <- jsonlite::stream_in(file("test.json"))
View(as.data.frame(test_df2))

small <- "{\"id\":\"NDxEazyM\",\"rated\":false,\"variant\":\"standard\",\"speed\":\"rapid\",\"perf\":\"rapid\",\"createdAt\":1501607469962,\"lastMoveAt\":1501608759994,\"status\":\"outoftime\",\"players\":{\"white\":{\"user\":{\"name\":\"suhtKesine\",\"id\":\"suhtkesine\"},\"rating\":1571},\"black\":{\"user\":{\"name\":\"hotleafjuice\",\"id\":\"hotleafjuice\"},\"rating\":1584}},\"winner\":\"white\",\"moves\":\"e4 c5 Nf3 d6 c3 e5 d4 cxd4 cxd4 Nc6 d5 Nce7 Nc3 Nf6 Bg5 Ng6 Bb5+ Bd7 Qa4 Be7 Qb4 O-O O-O Qb6 a3 Bxb5 Nxb5 Nxe4 Bxe7 Nxe7 Rfe1 Qxf2+ Kh1 f5 Nxd6 Nxd6 Qxd6 Ng6 Nxe5 Rae8 h3 Nxe5 Rxe5 Qxb2 Rae1 Rxe5 Rxe5 Qc1+ Kh2 Qf4+ Kh1 Qc1+ Kh2 Qf4+ Kh1 Qf1+ Kh2 f4 Qe6+\",\"clock\":{\"initial\":600,\"increment\":8,\"totalTime\":920}}\n{\"id\":\"YdDnL5ye\",\"rated\":false,\"variant\":\"standard\",\"speed\":\"rapid\",\"perf\":\"rapid\",\"createdAt\":1501013779630,\"lastMoveAt\":1501015437790,\"status\":\"mate\",\"players\":{\"white\":{\"user\":{\"name\":\"hotleafjuice\",\"id\":\"hotleafjuice\"},\"rating\":1574},\"black\":{\"user\":{\"name\":\"suhtKesine\",\"id\":\"suhtkesine\"},\"rating\":1571}},\"winner\":\"white\",\"moves\":\"e4 e5 Nf3 f5 exf5 Bc5 Nc3 e4 Nxe4 Bb6 h3 Nf6 Nxf6+ Qxf6 Qe2+ Kf7 Qc4+ Kf8 g4 d6 d4 Nc6 Be3 Bd7 O-O-O Re8 Bg5 Na5 Qc3 Qf7 Bg2 Qxa2 d5 Qa1+ Kd2 Qa2 Nh4 Nc4+ Kd3 Nxb2+ Kd2 Nxd1 Rxd1 Bxf2 Bh6 Re7 f6 Rf7 Bxg7+ Kg8 Qxc7 Bxh4 Qd8+ Be8 Qxe8+ Rf8 Qxf8#\",\"clock\":{\"initial\":300,\"increment\":8,\"totalTime\":620}}\n"

toJSON(small)
write(small, "small.json")

write(test, "big.json")

small_df <- ndjson::stream_in("small.json")

ndjson::stream_in(small)

big_df <- ndjson::stream_in("big.json")

lite_df <- jsonlite::stream_in(file('small.json'))

lite_big <- jsonlite::stream_in(file('big.json'))

test_flatten <- jsonlite::flatten(lite_big)
View(test_flatten)

names(test_flatten)


#cleaned code

library(httr); library(jsonlite); library(tidyverse)

url <- "https://lichess.org/api/games/user/hotleafjuice"

token <- "j6iPLB7UexGA1Ad2" #hidden for security purposes

query <- list(rated = "true", 
               perfType = "blitz,rapid,classical",
               clocks = "true",
               opening = "true")

#7th iteration of the GET command proved to be successful
request <- GET(url, 
                accept("application/x-ndjson"), 
                add_headers(Authorization = paste("Bearer", token, sep = " ")),
                query = query)


request$times #takes roughly a minute
#does it add up? according to documentation

json_content <- content(request, as="text", encoding = 'utf-8')

#initially I tried to convert this using toJSON, this did not work
#explain why

write(json_content, "chess_data.json")

#https://rdrr.io/cran/jsonlite/man/stream_in.html
stream_data <- jsonlite::stream_in(file('chess_data.json'))
data <- jsonlite::flatten(stream_data)


#pgnInJson

query2 <- list(rated = "true", 
              perfType = "blitz,rapid,classical",
              clocks = "true",
              opening = "true",
              pgnInJson = "true")

request2 <- GET(url, 
               accept("application/x-ndjson"), 
               add_headers(Authorization = paste("Bearer", token, sep = " ")),
               query = query2)

json_content2 <- content(request2, as="text", encoding = 'utf-8')

#initially I tried to convert this using toJSON, this did not work
#explain why

write(json_content2, "chess_data2.json")

#https://rdrr.io/cran/jsonlite/man/stream_in.html
stream_data2 <- jsonlite::stream_in(file('chess_data2.json'))
data2 <- jsonlite::flatten(stream_data2)


query3 <- list(rated = "false", 
               perfType = "blitz,rapid,classical",
               clocks = "true",
               opening = "true")

request3 <- GET("https://lichess.org/api/games/user/", 
               accept("application/x-ndjson"), 
               add_headers(Authorization = paste("Bearer", token, sep = " ")),
               path = "hotleafjuice", query = query3)



#make a function for it

get_chess_data <- function(username, token, query) {
  url <- paste("https://lichess.org/api/games/user/", username, sep = "")
  
  request <- GET(url, 
                 accept("application/x-ndjson"), 
                 add_headers(Authorization = paste("Bearer", token, sep = " ")),
                 query = query)
  
  json_content <- content(request, as="text", encoding = 'utf-8')
  
  #writes in current working directory
  write(json_content, "chess_data.json")
  
  #https://rdrr.io/cran/jsonlite/man/stream_in.html
  stream_data <- jsonlite::stream_in(file('chess_data.json'))
  data <- jsonlite::flatten(stream_data)
  return(data)
}

test <- get_chess_data("hotleafjuice", token, query2)
  
  
  