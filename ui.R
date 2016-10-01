basicPage(
  titlePanel("Calculs Boursiers !"),
  sidebarPanel(
    sliderInput(inputId = "coursha",label = "Cours achat",value = 45, min = 20, max = 70,step=1),
    numericInput("nbre","Nbre d'action",45500,40,100000,1,width=NULL),
    sliderInput(inputId = "coursvte",label = "Cours vente",value = 45, min = 20, max = 70,step=1)
    ),
  
mainPanel(
  tabsetPanel(id = "tabs",
              tabPanel("Paramètres", value = "A", hr(),
                       numericInput("neg", "Négociation", 0.014, 0, 1, step = 0.001,width = NULL),
                       numericInput("val", "Valorisation", 0.025, 0,1, step = 0.001,width = NULL),
                       numericInput("taf", "TAF", 0.17, 0, 1, 0.01,width = NULL),
                       numericInput("btaf", "Base TAF", 0.011, 0, 1, 0.001,width = NULL),
                       verbatimTextOutput("nego")),
              tabPanel("Simulation", value = "B", br(),br(),"Here's some content for tab B."),
              tabPanel("Prévisions", value = "C", br(),br(),
                       numericInput("val", "Valorisation", 0.025, 0,1, step = 0.001,width = NULL)),
              tabPanel("Panorama", value = "D", br(),br(),verbatimTextOutput("cours")),
              tabPanel("Graphiques", value = "E", br(),br(),plotOutput("pl"))
              )
))
