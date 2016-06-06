fluidPage(
  titlePanel("Calculs Boursiers !"),
  sidebarLayout(
    sidebarPanel(
      sliderInput(inputId = "coursha",
                  label = "Cours de l'action",
                  value = 45, min = 20, max = 70,step=1),
      numericInput("nbre", "Nbre d'action", 45500, 40, max = 100000, step = 1,width = NULL),
    sliderInput(inputId = "coursvte",
                label = "Cours de l'action",
                value = 45, min = 20, max = 70,step=1)),
#  sliderInput(inputId = "nbre",
#              label = "Nombre d'actions",
#              value = 25, min = 1, max = 50000),

  mainPanel(
    verbatimTextOutput("cours"),verbatimTextOutput("nb"),
    verbatimTextOutput("achat"),verbatimTextOutput("rslt")
    )
))
