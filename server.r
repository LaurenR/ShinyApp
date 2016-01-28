SpendInfl <- read.csv("data/SpendData.csv")
#source("helpers.r")
library(ggplot2)
##Load all data and packages above this line##

shinyServer(function(input, output){
    
    output$spendingPlot <- renderPlot({
      #data <- subset(SpendInfl, Year == input$yearSlider)
      data <- subset(SpendInfl, Year == input$year)
      g <- ggplot(data, aes(x=Category, y=Billions))
      g <- g + geom_point(aes(size = Proportion, color = Category))
      g
    })
})
#    output$SpendingPlot <- renderPlot({
#      
#               switch(input$yearSlider,
#                     "1940" = subset(SpendInfl, Year == "1940"),
#                     "1945" = subset(SpendInfl, Year == "1945"),
#                     "1950" = subset(SpendInfl, Year == "1950"),
#                     "1955" = subset(SpendInfl, Year == "1955"),
#                     "1960" = subset(SpendInfl, Year == "1960")
#                     )

   #})
   
#})