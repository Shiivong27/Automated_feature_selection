library(shiny)
shinyUI(
  fluidPage(
    titlePanel("Automated Regression and Variable Selection"), 
    
    sidebarLayout(sidebarPanel(h2("Dataset"),
  selectInput(inputId = "dataset",label = "Please the select one of the Datasets",
              choices = c("iris","mtcars","esoph","rock","attitude","Sales")),
  br(),
  uiOutput("vx"),
  br(),
  helpText("This Regression application not only creates a multiple regression model,
           but also suggests the users which variables to drop/select for building a predictive
           model based on the AIC(Akaike information criterion)."),
  br(),
  helpText("This app was designed by Shiivong Birla, final year Computer Science Undergad of VIT University.")
  ),
    mainPanel(h2("Linear Model"), align = "center",
              actionButton("analysis","Analyze!"),
              tabsetPanel( type = "pills",
                           tabPanel("Data",dataTableOutput("data")),
                           tabPanel("Model Summary",verbatimTextOutput("form"),verbatimTextOutput("modelSummary")),
                           tabPanel("Plot",plotOutput("plot")),
                           tabPanel("Optimal Model",verbatimTextOutput("bestmodel")))
              
    ))
  )
)