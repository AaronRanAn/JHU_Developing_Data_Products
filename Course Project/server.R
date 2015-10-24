# this is the course shiny project for build data product

####

library(shiny) 

require(rCharts)

 options(RCHART_WIDTH = 1000)

shinyServer(
        
        function(input, output) {
                
                output$chart11 <- renderChart2({
                        
                        compare = input$website
                        
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
                        d1$yAxis( type = "addCategoryAxis", orderRule = "film", desc = T)
                        d1$legend(
                                x = 200,
                                y = 10,
                                width = 300,
                                height = 200,
                                horizontalAlign = "left"
                        )
                        
                        d1$set(height = 2500, width = 950)
                        
                        return(d1)
                })
                
                
        } # end of function
)