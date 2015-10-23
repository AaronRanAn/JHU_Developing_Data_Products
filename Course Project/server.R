# this is the course shiny project for build data product

library(rCharts)

library(ggplot2)

library(reshape)

# data pre-processing

# reshape the data into a better format for plotting

####

library(shiny) 

require(rCharts)

options(RCHART_WIDTH = 1000)

shinyServer(
        
 function(input, output) {

  output$chart1 <- renderChart({
          
          fan_score = read.csv('../fandango_score_comparison.csv')
          
          fan_scrap = read.csv('../fandango_scrape.csv')
          
          long_star = fan_score[,c(1, 7, 10, 12, 13)]
          
          as.character(long_star$FILM)
          
          as.character(long_melt$film)
          
          long_melt = melt(long_star, id.vars= "FILM")
          
          names(long_melt) = c("film", "website", "rating")
          
          long_melt[,1:2] = apply(long_melt[,1:2], 2, function(x) iconv(x,to="utf-8"))
          
          d1 <- dPlot(
                  x = "rating",
                  y = "film",
                  groups = "website",
                  data = long_melt,
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
          
          return(d1)
  })

        
 } # end of function
)