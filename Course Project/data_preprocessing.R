fan_score = read.csv('./Course Project/fandango_score_comparison.csv')

fan_scrap = read.csv('./Course Project/fandango_scrape.csv')

library(reshape)

long_star = fan_score[,c(1, 7, 10, 12, 13)]

as.character(long_star$FILM)

as.character(long_melt$film)

long_melt = melt(long_star, id.vars= "FILM")

names(long_melt) = c("film", "website", "rating")

long_melt[,1:2] = apply(long_melt[,1:2], 2, function(x) iconv(x,to="utf-8"))
