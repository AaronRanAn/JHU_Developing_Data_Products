# this is the course shiny project for build data product

####

library(shiny) 

require(rCharts)

 options(RCHART_WIDTH = 1000)
 
film <- sort(unique(long_melt$film))

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
                        
                        d1$set(height = 3000, width = 1000)
                        
                        return(d1)
                }) # end of chart 1
                
                # Initialize reactive values
                
                values <- reactiveValues()
                values$film <- film
                
                output$movieSelector <- renderUI({
                        checkboxGroupInput('film', 'Select Movies to Compare Ratings:', 
                                           film, selected = values$film)
                }) # end of box
                
                # Add observer on select-all button
                observe({
                        if(input$selectAll == 0) return()
                        values$film <- film
                })
                
                # Add observer on clear-all button
                observe({
                        if(input$clearAll == 0) return()
                        values$film <- c() # empty list
                })
                
                
        } # end of function
)