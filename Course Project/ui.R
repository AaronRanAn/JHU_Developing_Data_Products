# this is the course shiny project for build data product

require(rCharts)

library(shiny)

shinyUI(
        
        navbarPage("Does Fandango Overate Movies?",
                   
                   tabPanel("Lollipop Chart",  # Start of Tab 1
                           sidebarPanel(
                                   h3('Sidebar text') #,
                             #      selectInput(inputId = "website",
                              #       label = "select the website you want to compare to Fandango",
                               #      choices = sort(unique(long_melt$website)),
                                #     selected = "IMDB_norm"
                                   # )
                           ),
                           mainPanel(
                                   showOutput("chart1", "nvd3")
                           )
                    ), # End of Tab 1
                  
                  tabPanel("ggplot2", # Start of Tab 2
                           sidebarPanel(
                                   h3('sidebar on page 2')
                           ),
                          
                           mainPanel(
                                   h3('main panel on tab2 content')
                           )
                  ), # End of Tab 2
                  
                  tabPanel("Movie Explore",
                           sidebarPanel(
                                   h3 ("sidebar on tab 3")
                           ),
                           
                           mainPanel(
                                   
                           )
                   ), # End of Tab 3
                  
                  tabPanel("About", # Start of last tab
                           
                           mainPanel(h2("This is where you introduce project and project"))
                           
                           ) # End of last tab
        )
)
