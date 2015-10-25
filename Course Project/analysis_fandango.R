fan_score = read.csv('./Course Project/fandango_score_comparison.csv')

fan_scrap = read.csv('./Course Project/fandango_scrape.csv')

library(rCharts)

library(ggplot2)

library(reshape)

# data pre-processing

# reshape the data into a better format for plotting

long_star = fan_score[,c(1, 7, 10, 12, 13)]

as.character(long_star$FILM)

as.character(long_melt$film)

long_melt = melt(long_star, id.vars= "FILM")

# recode column names level, prepare for merge

names(long_melt) = c("film", "website", "rating")

names(long_melt) = c("film", "website", "rating")


####

long_melt[,1:2] = apply(long_melt[,1:2], 2, function(x) iconv(x,to="utf-8"))

compare = "IMDB_norm"

fan_comp = subset(long_melt, website == "Fandango_Stars" | website == compare)

d1 <- dPlot(
        x = "rating",
        y = "film",
        groups = "website",
        data = fan_comp,
        type = "bubble"
        , bounds = list( x = 250, y = 50, width = 700, height = 2400)
)

d1$xAxis( type = "addMeasureAxis" )
d1$yAxis( type = "addCategoryAxis", orderRule = "film" )
d1$legend(
        x = 200,
        y = 10,
        width = 300,
        height = 200,
        horizontalAlign = "left"
)

d1$set(height = 2500, width = 1000)

d1


