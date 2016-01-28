library(shiny)
shinyUI(fluidPage(
  titlePanel("US Personal Expenditures from 1940-1960"),
  
  sidebarLayout(
    sidebarPanel(
      p("Move slider to see changes from year to year."),
      numericInput('year', 'Year(1940-1960)', 1940, min = 1940, max = 1960, step = 5),
      submitButton('Submit')
      #sliderInput("yearSlider", label = h3("Year"),
       #           min = 1940, max = 1960, value = 1940, step = 5)
    ),
    
   mainPanel(
      h1("Spending by Category"),
      
      p("This project uses the US Personal Expenditure data in R and displays
         each spending category as a proportion of overall spending by year."),
      
      br(),
      
      p("Initial inspection of the data appears to show an incredible increase in 
        spending on food and alcohol from the years 1940-1960. However, when
        each category is viewed as a proportion of overall household spending, this
        drastic increase is lost. It appears, however, that total household spending 
        is what increases over this time. Which seems to be explained by the fact that 
        total inflation over this period is about 200%"),
     
       mainPanel(plotOutput("spendingPlot"))
  )))
)
