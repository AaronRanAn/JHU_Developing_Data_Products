# Quiz 1

# Question 1, manipulate and slider creation

library(manipulate)

myPlot <- function(s) {
        plot(cars$dist - mean(cars$dist), cars$speed - mean(cars$speed))
        abline(0, s)
}

manipulate(myPlot(s), s = slider(0, 2, step = 0.1)) # correct answer. 

# Question 2, rChart

require(devtools)
install_github('rCharts', 'ramnathv')

require(rCharts)

data("airquality")

# option 1 - 4

dTable(airquality, sPaginationType = "full_numbers")

d <- data.frame(airquality, stringsAsFactors = FALSE) # this is just a static data table. 

# Question 4

library(shiny)
shinyUI(pageWithSidebar(
        headerPanel("Data science FTW!"),
        sidebarPanel(
                h2('Big text'), # every level of the title except the last one should be followed by a comma
                h3('Sidebar')
        ),
        mainPanel(
                h3('Main Panel text')
        )
))

# Question 5

shinyUI(pageWithSidebar(
        headerPanel("Example plot"),
        sidebarPanel(
                sliderInput('mu', 'Guess at the mu',value = 70, min = 60, max = 80, step = 0.05,)
        ),
        mainPanel(
                plotOutput('newHist') # here is the new hist, 
        )
))

library(UsingR)
data(galton)

shinyServer(
        function(input, output) { 
                output$myHist <- renderPlot({ # here the output is myhist
                        hist(galton$child, xlab='child height', col='lightblue',main='Histogram')
                        mu <- input$mu
                        lines(c(mu, mu), c(0, 200),col="red",lwd=5)
                        mse <- mean((galton$child - mu)^2)
                        text(63, 150, paste("mu = ", mu))
                        text(63, 140, paste("MSE = ", round(mse, 2)))
                })
                
        }
)

# finish quiz 1

