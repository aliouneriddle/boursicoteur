tab = data.frame(secteur=c("DISTRIBUTION","FINANCES","DISTRIBUTION","FINANCES","FINANCES","FINANCES","FINANCES","FINANCES","INDUSTRIE","DISTRIBUTION","PUBLICS","FINANCES","INDUSTRIE","INDUSTRIE","INDUSTRIE","PUBLICS","AGRICULTURE","DISTRIBUTION","FINANCES","PUBLICS","TRANSPORTS","INDUSTRIE","FINANCES","DISTRIBUTION","AGRICULTURE","INDUSTRIE","INDUSTRIE","INDUSTRIE","PUBLICS","AGRICULTURE","AGRICULTURE","AUTRES","INDUSTRIE","TRANSPORTS","DISTRIBUTION","DISTRIBUTION","INDUSTRIE","INDUSTRIE","INDUSTRIE"),
                 titre=c("ABJC","BICC","BNBC","BOAB","BOABF","BOAC","BOAN","BOAS","CABC","CFAC","CIEC","ETIT","FTSC","NEIC","NTLC","ONTBF","PALC","PRSC","SAFC","SDCC","SDSC","SEMC","SGBC","SHEC","SICC","SIVC","SLBC","SMBC","SNTS","SOGC","SPHC","STAC","STBC","SVOC","TTLC","TTLS","TTRC","UNLC","UNXC"),
                 lib_titre=c("SERVAIR ABIDJAN CI","BICI CI","BERNABE CI","BANK OF AFRICA BN","BANK OF AFRICA BF","BANK OF AFRICA CI","BANK OF AFRICA NG","BANK OF AFRICA SN","SICABLE CI","CFAO CI","CIE CI","ECOBANK TRANS. INCORP. TG (**)","FILTISAC CI","NEI-CEDA CI","NESTLE CI","ONATEL BF","PALM CI","TRACTAFRIC MOTORS CI","SAFCA CI","SODE CI","BOLLORE AFRICA LOGISTICS CI","CROWN SIEM CI","SGB CI","VIVO ENERGY CI","SICOR CI","AIR LIQUIDE CI","SOLIBRA CI","SMB CI","SONATEL SN","SOGB CI","SAPH CI","SETAO CI","SITAB CI","MOVIS CI","TOTAL CI (*)","TOTAL SN (***)","TRITURAF CI-Ste en Liquidation","UNILEVER CI","UNIWAX CI (*)")
)

fluidPage(
  titlePanel("Calculs Boursiers !"),br(),
  sidebarPanel(
    selectInput(inputId="secteur",label="secteur",choices=unique(tab$secteur),selected="DISTRIBUTION"),
    #uiOutput("sliderSect"),
    uiOutput("sliderTitre"),
    numericInput("coursha","Cours achat",52,0,500000,1,width=NULL),
    numericInput("nbre","Nbre d'action",45500,40,100000,1,width=NULL),
    numericInput("coursvte","Cours vente",54,0,500000,1,width=NULL),
    checkboxInput(inputId = "individual_obs",label = strong("Show individual observations"),value = FALSE),
    actionButton("update", "Ajouter au portefeuille"),
    downloadButton('downloadData', 'Télécharger')
    
  ),
  
  mainPanel(
    
    tabsetPanel(id = "tabs",
                tabPanel("Présentation", value = "AA",hr(),h3("Présentation"),br(),
                         p("Cette application a été élaborée dans le but de simuler le
                           comportement d'une transaction boursière ou  d'un portefeuille de valeurs mobilières.",
                           "Elle donnera à ses usagers la possibilité de valoriser le coût d'une transaction en 
                           bourse (vente ou achat) ",br(),
                           paste("Vous venez de choisir la valeur"
                           ))
                         #fluidRow(column(width=2,tableOutput("cout_achat")))
                ),
                tabPanel("Paramètres", value = "A", h3("Table de paramétrage"),hr(),br(),
                         fluidRow(
                           column(width=2,numericInput("neg", "Négociation", 0.014, 0, 1, step = 0.001,width = NULL)),
                           column(width=2,numericInput("val", "Valorisation", 0.025, 0,1, step = 0.001,width = NULL)),
                           column(width=2,numericInput("taf", "TAF", 0.17, 0, 1, 0.01,width = NULL)),
                           column(width=2,numericInput("btaf", "Base TAF", 0.011, 0, 1, 0.001,width = NULL))
                         ),
                         hr(),
                         h4("Troisième ligne"),
                         fluidRow(column(width=3,br(),verbatimTextOutput("resultat")#format("resultat",digits=9,decimal.mark=",",big.mark=" ",small.interval=3))
                                         #digits=9, decimal.mark=",", big.mark=" ",small.interval=3)
                         )),
                         hr(),fluidRow(column(width=2,tableOutput("cout_achat")))
                ),
                #fluidRow(
                #column(width=2,nnumericInput("taf", "TAF", 0.17, 0, 1, 0.01,width = NULL))
                #column(width=2,numericInput("btaf", "Base TAF", 0.011, 0, 1, 0.001,width = NULL
                #fluidRow(
                #column(width=2,br(),verbatimTextOutput("rlst"))#,
                #dataTableOutput("tab")
                tabPanel("Simulation", value = "D",hr(),h3("Résultat de la simulation")
                         #fluidRow(column(width=2,tableOutput("cout_achat")))
                ),
                tabPanel("Prévisions", value = "C", hr(),h3("Résultat de la prévision")),
                #fluidRow(
                #column(width=2,numericInput("negF", "NÃ©gociation", 0.014, 0, 1, step = 0.001,width = NULL)),
                #column(width=2,verbatimTextOutput("negoc"))
                #)
                tabPanel("Portefeuille", value = "D",hr(),h3("Portefeuille de valeurs"),
                         tableOutput("table1")),
                #fluidRow(column(width=2,verbatimTextOutput("vachats")))),
                tabPanel("Graphiques", value = "E", br(),br(),plotOutput("pl"))
  )))
