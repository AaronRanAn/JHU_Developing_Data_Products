fan_score = read.csv('./Course Project/fandango_score_comparison.csv')

fan_scrap = read.csv('./Course Project/fandango_scrape.csv')

library(reshape)

long_star = fan_score[,c(1, 7, 10, 12, 13)]

long_star_2 = fan_score[,c(1, 19, 20, 21)]

as.character(long_star$FILM)

as.character(long_melt$film)

long_melt = melt(long_star, id.vars= "FILM")

long_melt[,1:2] = apply(long_melt[,1:2], 2, function(x) iconv(x,to="utf-8"))

save(long_melt, file = "long_melt.RData")

## prepare long_melt_2 for merge

long_melt_2 = melt(long_star_2, id.vars= "FILM")

names(long_melt) = c("film", "website", "rating")

names(long_melt_2) = c("film", "website", "review_count")

library(plyr)

long_melt_2$website <- revalue(long_melt_2$website, c("Metacritic_user_vote_count"="Metacritic_user_nom", 
                                                      "IMDB_user_vote_count"="IMDB_norm", "Fandango_votes" = "Fandango_Stars"))

movie_rating <-  merge(long_melt,long_melt_2,by=c("film","website"))

# Calculate rating Error

movie_rating_avg <- aggregate(movie_rating, by = list(movie_rating$film), FUN = mean, na.rm = T)

movie_rating_avg <- movie_rating_avg[,c(1,4)]

names(movie_rating_avg) <- c("film","avg_rating")

movie_rating <-  merge(movie_rating,movie_rating_avg,by=c("film"))

movie_rating$rating_error <- movie_rating$rating - movie_rating$avg_rating

save(movie_rating, file = "movie_rating.RData")

# Create another dplot

# library(rCharts)
# 
# d2 <- dPlot(
#         x = "review_count",
#         y = "rating_error",
#         groups = c("film", "website"),
#         data = movie_rating,
#         type = "bubble"
# )
# 
# d2$xAxis( type = "addMeasureAxis" )
# d2$yAxis( type = "addMeasureAxis")
# d2$legend(
#         x = 200,
#         y = 10,
#         width = 300,
#         height = 200,
#         horizontalAlign = "left"
# )
# 
# d2$set(height = 800, width = 800)
# 
# d2



## Plot the rchart

# library(rCharts)
# 
# d1 <- dPlot(
#         x = "rating",
#         y = "film",
#         groups = "website",
#         data = long_melt,
#         type = "bubble"
#         , bounds = list( x = 250, y = 50, width = 700, height = 2400)
# )
# 
# d1$xAxis( type = "addMeasureAxis" )
# d1$yAxis( type = "addCategoryAxis", orderRule = "film" )
# d1$legend(
#         x = 200,
#         y = 10,
#         width = 300,
#         height = 200,
#         horizontalAlign = "left"
# )
# 
# d1$set(height = 2500, width = 1000)
# 
# d1