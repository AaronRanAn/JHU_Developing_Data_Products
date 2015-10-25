# this is the course shiny project for build data product

require(rCharts)

library(shiny)

options(RCHART_LIB = 'dimple')

shinyUI(
        
        navbarPage("Online Movie Rating Explorer",
                   
                   tabPanel("Movies & Rating",  # Start of Tab 1
                            sidebarPanel(
                                    h3('Explore Ratings'),
                                    selectInput(inputId = "website",
                                                label = "Select to compare to Fandango",
                                                choices = c("Fandango_Stars", "IMDB_norm","Metacritic_user_nom","RT_user_norm"),
                                                selected = "IMDB_norm"
                                    ),
                                    uiOutput("movieSelector"),
                                    actionButton(inputId = "clearAll", 
                                                 label = "Clear selection", 
                                                 icon = icon("square-o")),
                                    actionButton(inputId = "selectAll", 
                                                 label = "Select all", 
                                                 icon = icon("check-square-o")),
                                    width = 3
                            ),
                            mainPanel(
                                    showOutput("chart11", "dimple")
                            )
                   ), # End of Tab 1
                   
                   tabPanel("Rating Error & Rating Counts", # Start of Tab 2
                            sidebarPanel(
                                    h4("Which Ratings To Trust?"),
                                    sliderInput("rating_error", 
                                                "Select Rating Error Range:", 
                                                min = -2.0,
                                                max = 2.0,
                                                value = c(-2.0, 2.0),
                                                step = 0.1
                                                ),
                                    h6("* Rating Error = Rating - Avg Rating"),
                                    width=3
                            ),
                            
                            mainPanel(
                                    showOutput("chart12", "dimple")
                            )
                   ), # End of Tab 2
                   
                   tabPanel("How To Use This App?", # Start of last tab
                            includeMarkdown("about.md")
                            
                   ) # End of last tab
        )
)
