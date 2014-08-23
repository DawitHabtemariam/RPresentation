
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(
fluidPage(
titlePanel("Climate in 1973"),

sidebarLayout(
              sidebarPanel(
              helpText("This graphic displays the change of certain climate features
              over a few months in 1973 under a range of temperatures in New York City.  You can select a range of temperatures
              using the slider to see the change of the climate over time. The source of the data is the New York Air Quality Measurements dataset in R")  ,
                
              h4("Choose Your Feature"),
              
             selectInput("choice","Pick Variable",
             
                       choices=c("Ozone","Solar Radiation"="Solar.R","Wind"),
                        selected="Ozone"),
              
               sliderInput("temperature","Pick Temperature Range",min=56,max=97,value=c(56,97))
                ,checkboxInput("summary","Show Stats") 
             ), 
              
             mainPanel(
                
                title="Air Quality Plot"
               , plotOutput("airqualityPlot"),
                 tableOutput("summary")
                ),
              
              
              position="left",
              fluid=T)

)

  )

