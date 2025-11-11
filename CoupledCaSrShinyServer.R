

# User Interface ----------------------------------------------------------



ui <- fluidPage(# Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      width = 3,
      tabsetPanel(
        tabPanel(
          "Ocean",
          sliderInput(
            "VocM",
            "Ocean Volume multipler:",
            min = 0,
            max = 2,
            value = c(1, 1),
            step = 0.001
          ),
          sliderInput(
            "DIC",
            "Initial DIC",
            min = 1.75e-3,
            max = 20e-3,
            value = c(1.91e-3, 1.91e-3),
            step = .01e-3
          ),
          sliderInput(
            "temp",
            "Temperature",
            min = 0,
            max = 45,
            value = c(15, 15),
            step = 0.5
          ),
          sliderInput(
            "s",
            "Salinity",
            min = 0,
            max = 2,
            value = c(1.035, 1.035),
            step = 0.001
          )
        ),
        
        tabPanel(
          "Masses",
          sliderInput(
            "molCa",
            "initial mol Calcium",
            min = 8e-3,
            max = 40e-3,
            value = c(17e-3, 17e-3),
            step = 1e-3
          ),
          sliderInput(
            "molSr",
            "initial mol Strontium x modern",
            min = 0,
            max = 100,
            value = c(1, 1),
            step = .01
          ),
          sliderInput(
            "molPO4",
            "initial mol Phosphate x modern",
            min = 0,
            max = 100,
            value = c(1, 1),
            step = .01
          ),
          sliderInput(
            "molSO4",
            "initial mol Sulphate",
            min = 0,
            max = 40e-3,
            value = c(28e-3, 28e-3),
            step = 1e-4
          )
        ),
        
        tabPanel(
          "Fluxes",
          sliderInput(
            "Fvolc",
            "initial Volcanic flux",
            min = 1e12,
            max = 30e12,
            value = c(16e12, 16e12),
            step = 1e12
          ),
          sliderInput(
            "Fwcarb",
            "initial Carbonate weathering",
            min = 1e12,
            max = 40e12,
            value = c(24e12, 24e12),
            step = 1e12
          ),
          sliderInput(
            "Fwsil",
            "initial Silicate weathering",
            min = 1e12,
            max = 40e12,
            value = c(12e12, 12e12),
            step = 1e12
          ),
          sliderInput(
            "Fwp",
            "initial Phosphate weathering",
            min = 1e10,
            max = 20e10,
            value = c(11.3e10, 11.3e10),
            step = 0.1e10
          )
        ),
        
        tabPanel(
          "Isotopes",
          sliderInput(
            "dCvolc",
            "delta13C Volcanic",
            min = -10,
            max = 10,
            value = c(-5.5, -5.5),
            step = .1
          ),
          sliderInput(
            "dCcarb",
            "delta13C carbonate",
            min = -10,
            max = 10,
            value = c(2, 2),
            step = .1
          ),
          sliderInput(
            "dCOrg",
            "delta13C organic",
            min = -60,
            max = 10,
            value = c(-28, -28),
            step = .1
          ),
          sliderInput(
            "dCawcarb",
            "delta44Ca carb weather",
            min = -2,
            max = 2,
            value = c(-.4, -.4),
            step = .01
          ),
          sliderInput(
            "dCawsili",
            "delta44Ca sili weather",
            min = -2,
            max = 2,
            value = c(-.1, -.1),
            step = .01
          ),
          sliderInput(
            "DeltaCai",
            "DeltaCa",
            min = -6,
            max = 3,
            value = c(-3.28, -3.28),
            step = .01
          ),
          sliderInput(
            "RadSrSil",
            "Rad Silicate Sr",
            min = 0.701,
            max = .72,
            value = c(0.7115, 0.7115),
            step = .0001
          ),
          sliderInput(
            "RadSrCarb",
            "Rad Carbonate Sr",
            min = 0.701,
            max = .72,
            value = c(0.708, 0.708),
            step = .0001
          ),
          sliderInput(
            "StabSrSil",
            "Stable Silicate Sr",
            min = 0.2,
            max = .3,
            value = c(0.27, 0.27),
            step = .0001
          ),
          sliderInput(
            "StabSrCarb",
            "Stable Carbonate Sr",
            min = 0.1,
            max = .2,
            value = c(0.16, 0.16),
            step = .0001
          ),
          sliderInput(
            "dStabSrHyd",
            "Stable Sr Hyrothermal Value",
            min = 0.10,
            max = .3,
            value = c(0.21, 0.21),
            step = .0001
          ),
          
          sliderInput(
            "DeltaCcarb",
            "Stable Sr Fractionation Factor",
            min = -1.0,
            max = 1.0,
            value = c(-0.24, -0.24),
            step = .0001
          )
        ),
        
        
        tabPanel(
          "'Constants'",
          sliderInput(
            "kalk",
            "kalk",
            min = 0,
            max = .05,
            value = c(0.002, 0.002),
            step = 0.0001
          ),
          sliderInput(
            "ksp",
            "ksp",
            min = 0,
            max = 10,
            value = c(1, 1),
            step = 0.01
          ),
          sliderInput(
            "kcp",
            "Initial kcp",
            min = 50,
            max = 190,
            value = c(106, 106),
            step = 1
          ),
          sliderInput(
            "G",
            "G constant",
            min = 1,
            max = 4,
            value = c(3.3, 3.3),
            step = .1
          ),
          sliderInput(
            "Z",
            "Z",
            min = 0,
            max = .1,
            value = c(.09, 0.09),
            step = 0.01
          ),
          sliderInput(
            "Zcarb",
            "Zcarb",
            min = 0,
            max = .1,
            value = c(.07, .07),
            step = .01
          ),
          sliderInput(
            "sat",
            "Omega Saturation State",
            min = .5,
            max = 4,
            value = c(1, 1),
            step = .1
          ),
          sliderInput(
            "pcp",
            "pcp scaling coeffecient",
            min = 0,
            max = 5,
            value = c(1, 1),
            step = .1
          ),
          sliderInput(
            "pbp",
            "pbp scaling coeffecient",
            min = 0,
            max = 5,
            value = c(1, 1),
            step = .1
          ),
          sliderInput(
            "KsilSr",
            "Sil Ca/Sr flux adjustment",
            min = 280,
            max = 350,
            value = c(305, 305),
            step = 1
          ),
          sliderInput(
            "KcarbSr",
            "Carb Ca/Sr flux adjustment",
            min = 1150,
            max = 1350,
            value = c(1250, 1250),
            step = 1
          ),
          sliderInput(
            "SrC_scalar",
            "Strontium/Carbon Flux Scalar",
            min = 0.001,
            max = .1,
            value = c(0.01, 0.01),
            step = .001
          ),
        ),
        
        tabPanel(
          "Eruption",
          sliderInput(
            "dCextra",
            "delta13C extra flux",
            min = -60,
            max = 10,
            value = c(-28, -28),
            step = .1
          ),
          sliderInput(
            "Eruption",
            "Eruption Magnitude (mol)",
            min = 1e17,
            max = 30e17,
            value = c(11e17, 11e17),
            step = 1e17
          ),
          textInput(
            "Excursion",
            label = h3("Excursions (Ma start-stop)"),
            value = "3.1 , 3.145"
          )
        )
      )
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      width = 9,
      h6("Coupled Carbonate System model", align = "center"),
      p("Shinyapp for doing simulation of the coupled carbonate system and calcium isotope response."),
      HTML("<p>Based on work from Aviv Bachan. Take a look at his <a href='https://github.com/avivbd/TJ_modeling/blob/master/CCaPS.m'> Github matlab code!</a><p>"),
      HTML("<p>Also based on a paper by Adam Jost. <a href='https://agupubs.onlinelibrary.wiley.com/doi/full/10.1002/2016GC006724'> Link to paper!</a></p>"),
      sliderInput(
        "modelRuns",
        "Number of Monte Carlo Simulations",
        min = 1,
        max = 100,
        value = 1,
        step = 1,
        width = "100%"
      ),
      sliderInput(
        "duration",
        "Duration of model (Ma)",
        min = 0,
        max = 10,
        value = 6,
        step = 0.1,
        width = "100%"
      ),
      actionButton("defaults", "Reset to Defaults"),
      actionButton("execute", "Calculate Model"),
      tabsetPanel(
        tabPanel("Carbon Plots",
                 plotOutput("modelAverage_C", height = 600)),
        tabPanel("Isotope Plots",
                 plotOutput("modelAverage_I", height = 600)),
        tabPanel("Monte Carlo Average",
                 plotOutput("modelAverage", height = 600)),
        tabPanel("Simulation Runs",
                 plotOutput("modelPlots", height = 600)),
        tabPanel("Simulation Params",
                 dataTableOutput("modeltable"))
      )
      
    )
  ))


# Server ------------------------------------------------------------------



server <- function(input, output, session) {
  observeEvent(input$defaults, {
    updateSliderInput(session = session,
                      "VocM",
                      "Ocean Volume multipler:",
                      value = c(1, 1))
    updateSliderInput(session = session,
                      "DIC",
                      "Initial DIC",
                      value = c(1.90e-3, 1.90e-3))
    updateSliderInput(session = session,
                      "temp",
                      "Temperature",
                      value = c(15, 15))
    updateSliderInput(session = session,
                      "s",
                      "Salinity",
                      value = c(1.035, 1.035))
    updateSliderInput(
      session = session,
      "molCa",
      "initial mol Calcium",
      value = c(17e-3, 17e-3)
    )
    updateSliderInput(
      session = session,
      "molSr",
      "initial mol Strontium x modern",
      value = c(1, 1)
    )
    updateSliderInput(
      session = session,
      "molPO4",
      "initial mol Phosphate x modern",
      value = c(1, 1)
    )
    updateSliderInput(
      session = session,
      "molSO4",
      "initial mol Sulphate",
      value = c(28e-3, 28e-3)
    )
    updateSliderInput(
      session = session,
      "Fvolc",
      "initial Volcanic flux",
      value = c(16e12, 16e12)
    )
    updateSliderInput(
      session = session,
      "Fwcarb",
      "initial Carbonate weathering",
      value = c(24e12, 24e12)
    )
    updateSliderInput(
      session = session,
      "Fwsil",
      "initial Silicate weathering",
      value = c(12e12, 12e12)
    )
    updateSliderInput(
      session = session,
      "Fwp",
      "initial Phosphate weathering",
      value = c(11.3e10, 11.3e10)
    )
    updateSliderInput(session = session, "ksp", "ksp", value = c(1, 1))
    updateSliderInput(session = session,
                      "kcp",
                      "Initial kcp",
                      value = c(106, 106))
    updateSliderInput(session = session,
                      "G",
                      "G constant",
                      value = c(3.3, 3.3))
    updateSliderInput(session = session, "Z", "Z", value = c(.09, 0.09))
    updateSliderInput(session = session,
                      "Zcarb",
                      "Zcarb",
                      value = c(.07, .07))
    updateSliderInput(session = session,
                      "sat",
                      "Omega Saturation State",
                      value = c(1, 1))
    updateSliderInput(session = session,
                      "pcp",
                      "pcp scaling coeffecient",
                      value = c(1, 1))
    updateSliderInput(session = session,
                      "pbp",
                      "pbp scaling coeffecient",
                      value = c(1, 1))
    updateSliderInput(
      session = session,
      "KsilSr",
      "Sil Ca/Sr flux adjustment",
      value = c(305, 305)
    )
    updateSliderInput(
      session = session,
      "KcarbSr",
      "Carb Ca/Sr flux adjustment",
      value = c(1250, 1250)
    )
    updateSliderInput(
      session = session,
      "Eruption",
      "Eruption Magnitude (mol)",
      value = c(9e17, 9e17)
    )
    updateTextInput(
      session = session,
      "Excursion",
      label = h3("Excursions (Ma start-stop)"),
      value = ".1 , .125"
    )
    updateSliderInput(
      session = session,
      "modelRuns",
      "Number of Monte Carlo Simulations",
      value = 10
    )
    updateSliderInput(session = session,
                      "duration",
                      "Duration of model (Ma)",
                      value = 1)
    updateSliderInput(session = session,
                      "dCvolc",
                      "delta13C Volcanic",
                      value = c(-5.5, -5.5))
    updateSliderInput(session = session,
                      "dCcarb",
                      "delta13C carbonate",
                      value = c(2, 2))
    updateSliderInput(session = session,
                      "dCOrg",
                      "delta13C organic",
                      value = c(-28, -28))
    updateSliderInput(session = session,
                      "dCextra",
                      "delta13C extra flux",
                      value = c(-28, -28))
    updateSliderInput(
      session = session,
      "dCawcarb",
      "delta44Ca carb weather",
      value = c(-.4, -.4)
    )
    updateSliderInput(
      session = session,
      "dCawsili",
      "delta44Ca sili weather",
      value = c(-.1, -.1)
    )
    updateSliderInput(session = session,
                      "DeltaCai",
                      "DeltaCa",
                      value = c(-3.28, -3.28))
    updateSliderInput(session = session,
                      "RadSrSil",
                      "Rad Silicate Sr",
                      value = c(0.7115, 0.7115))
    updateSliderInput(session = session,
                      "RadSrCarb",
                      "Rad Carbonate Sr",
                      value = c(0.708, 0.708))
    updateSliderInput(session = session,
                      "StabSrSil",
                      "Stable Silicate Sr",
                      value = c(0.27, 0.27))
    updateSliderInput(session = session,
                      "StabSrCarb",
                      "Stable Carbonate Sr",
                      value = c(0.16, 0.16))
    updateSliderInput(session = session,
                      "dStabSrHyd",
                      "Stable Sr Hydrothermal Value",
                      value = c(0.21, 0.21))
    updateSliderInput(session = session,
                      "SrC_scalar",
                      "Strontium/Carbon Scalar",
                      value = c(0.01, 0.01))
    updateSliderInput(session = session,
                      "DeltaCcarb",
                      "Stable Sr Fractionation Factor",
                      value = c(-0.24, -0.24))
    updateSliderInput(session = session,
                      "kalk",
                      "kalk",
                      value = c(0.002, 0.002))
    
  })
  
  simInputs <- reactive({
    param_rows <- input$modelRuns
    
    iter <- 1:param_rows
    rand_Voc <- runif(param_rows, input$VocM[1], input$VocM[2])
    rand_DIC <- runif(param_rows, input$DIC[1], input$DIC[2])
    rand_temp <- runif(param_rows, input$temp[1], input$temp[2])
    rand_s <- runif(param_rows, input$s[1], input$s[2])
    rand_molCa <- runif(param_rows, input$molCa[1], input$molCa[2])
    rand_molSr <-
      runif(param_rows, input$molSr[1] * 17e-8, input$molSr[2] * 17e-8)
    rand_molPO4 <-
      runif(param_rows, input$molPO4[1] * 2.5e-7, input$molPO4[2] * 2.5e-7)
    rand_molSO4 <- runif(param_rows, input$molSO4[1], input$molSO4[2])
    rand_Fvolc <- runif(param_rows, input$Fvolc[1], input$Fvolc[2])
    rand_Fwcarb <- runif(param_rows, input$Fwcarb[1], input$Fwcarb[2])
    rand_Fwsil <- runif(param_rows, input$Fwsil[1], input$Fwsil[2])
    rand_Fwp <- runif(param_rows, input$Fwp[1], input$Fwp[2])
    rand_ksp <-
      runif(param_rows, input$ksp[1] * 4.31e-7, input$ksp[2] * 4.31e-7)
    rand_kcp <- runif(param_rows, input$kcp[1], input$kcp[2])
    rand_G <- runif(param_rows, input$G[1], input$G[2])
    rand_Z <- runif(param_rows, input$Z[1], input$Z[2])
    rand_Zcarb <- runif(param_rows, input$Zcarb[1], input$Zcarb[2])
    rand_sat <- runif(param_rows, input$sat[1], input$sat[2])
    rand_pcp <- runif(param_rows, input$pcp[1], input$pcp[2])
    rand_pbp <- runif(param_rows, input$pbp[1], input$pbp[2])
    rand_KsilSr <- runif(param_rows, input$KsilSr[1], input$KsilSr[2])
    rand_KcarbSr <-
      runif(param_rows, input$KcarbSr[1], input$KcarbSr[2])
    rand_Eruption <-
      runif(param_rows, input$Eruption[1], input$Eruption[2])
    rand_dCvolc <- runif(param_rows, input$dCvolc[1], input$dCvolc[2])
    rand_dCcarb <- runif(param_rows, input$dCcarb[1], input$dCcarb[2])
    rand_dCOrg <- runif(param_rows, input$dCOrg[1], input$dCOrg[2])
    rand_dCextra <-
      runif(param_rows, input$dCextra[1], input$dCextra[2])
    rand_dCawcarb <-
      runif(param_rows, input$dCawcarb[1], input$dCawcarb[2])
    rand_dCawsili <-
      runif(param_rows, input$dCawsili[1], input$dCawsili[2])
    rand_DeltaCai <-
      runif(param_rows, input$DeltaCai[1], input$DeltaCai[2])
    rand_RadSrSil <-
      runif(param_rows, input$RadSrSil[1], input$RadSrSil[2])
    rand_RadSrCarb <-
      runif(param_rows, input$RadSrCarb[1], input$RadSrCarb[2])
    rand_dStabSrHyd <-
      runif(param_rows, input$dStabSrHyd[1], input$dStabSrHyd[2])
    rand_SrC_scalar <-
      runif(param_rows, input$SrC_scalar[1], input$SrC_scalar[2])
    rand_kalk <- runif(param_rows, input$kalk[1], input$kalk[2])
    rand_StabSrSil <-
      runif(param_rows, input$StabSrSil[1], input$StabSrSil[2])
    rand_StabSrCarb <-
      runif(param_rows, input$StabSrCarb[1], input$StabSrCarb[2])
    rand_kalk <- runif(param_rows, input$kalk[1], input$kalk[2])
    rand_DeltaCcarb <-
      runif(param_rows, input$DeltaCcarb[1], input$DeltaCcarb[2])
    rand_kalk <- runif(param_rows, input$kalk[1], input$kalk[2])
    
    data.frame(
      iter,
      rand_Voc,
      rand_DIC,
      rand_temp,
      rand_s,
      rand_molCa,
      rand_molSr,
      rand_molPO4,
      rand_molSO4,
      rand_Fvolc,
      rand_Fwcarb,
      rand_Fwsil,
      rand_Fwp,
      rand_ksp,
      rand_kcp,
      rand_G,
      rand_Z,
      rand_Zcarb,
      rand_sat,
      rand_pcp,
      rand_pbp,
      rand_KsilSr,
      rand_KcarbSr,
      rand_Eruption,
      rand_dCvolc,
      rand_dCcarb,
      rand_dCOrg,
      rand_dCextra,
      rand_dCawcarb,
      rand_dCawsili,
      rand_DeltaCai,
      rand_RadSrSil,
      rand_RadSrCarb,
      rand_StabSrSil,
      rand_StabSrCarb,
      rand_dStabSrHyd,
      rand_SrC_scalar,
      rand_DeltaCcarb,
      rand_kalk
    )
  })
  
  output$modeltable <- renderDataTable({
    simInputs()
  })
  
  simulations <- eventReactive(input$execute, {
    simParams <- simInputs()
    each_run <- as.list(1:input$modelRuns)
    for (i in 1:input$modelRuns) {
      # run argmodel() for current iteration of loop
      
      curr_it <- CoupledCaSrModel(
        duration = input$duration[1],
        Stepsize = 1000,
        initial = list(
          z = 0,
          temp = simParams$rand_temp[i],
          s = simParams$rand_s[i],
          Voc = (2.32e21 * simParams$rand_Voc[i]),
          DIC = simParams$rand_DIC[i],
          molCa = simParams$rand_molCa[i],
          molPO4 = simParams$rand_molPO4[i],
          molSO4 = simParams$rand_molSO4[i],
          ksp = simParams$rand_ksp[i],
          Fvolc = simParams$rand_Fvolc[i],
          Fwcarb = simParams$rand_Fwcarb[i],
          Fwsil = simParams$rand_Fwsil[i],
          Fwp = simParams$rand_Fwp[i],
          kcp = simParams$rand_kcp[i],
          G = simParams$rand_G[i],
          Z = simParams$rand_Z[i],
          Zcarb = simParams$rand_Zcarb[i],
          pcp = simParams$rand_pcp[i],
          dCvolc = simParams$rand_dCvolc[i],
          dCCarb = simParams$rand_dCcarb[i],
          dCOrg = simParams$rand_dCOrg[i],
          dCextra = simParams$rand_dCextra[i],
          dCawcarb = simParams$rand_dCawcarb[i],
          dCawsili = simParams$rand_dCawsili[i],
          DeltaCai = simParams$rand_DeltaCai[i],
          pbp = simParams$rand_pbp[i],
          sat = simParams$rand_sat[i],
          RadSrSil = simParams$rand_RadSrSil[i],
          RadSrCarb = simParams$rand_RadSrCarb[i],
          StabSrSil = simParams$rand_StabSrSil[i],
          StabSrCarb = simParams$rand_StabSrCarb[i],
          dStabSrHyd = simParams$rand_dStabSrHyd[i],
          SrC_scalar = simParams$rand_SrC_scalar[i],
          DeltaCcarb = simParams$rand_DeltaCcarb[i],
          
          molSr = simParams$rand_molSr[i],
          KsilSr = (1 / simParams$rand_KsilSr[i]),
          KcarbSr = (1 / simParams$rand_KcarbSr[i]),
          kalk = simParams$rand_kalk[i]
        ),
        Eruption = simParams$rand_Eruption[i],
        excursion = as.numeric(strsplit(input$Excursion, ',')[[1]])
      )
      curr_it$runNum <- i
      each_run[[i]] <- curr_it
    }
    all_runs <- do.call("rbind", each_run)
  })
  
  dSW_sim_stats <- reactive({
    #creates an aggregate of data by time
    simulation_data <- simulations()
    dSW_simulation_stats <-
      ddply(
        simulation_data,
        "time",
        summarize,
        mean = mean(dC),
        sd = sd(dC),
        sd2 = 2 * sd(dC),
        max = max(dC),
        min = min(dC)
      )
  })
  
  ## Check why this -.86 is here?
  
  dCa_sim_stats <- reactive({
    simulation_data <- simulations()
    simulation_data$dCa <- simulation_data$dCa - .86
    dCa_simulation_stats <-
      ddply(
        simulation_data,
        "time",
        summarize,
        mean = mean(dCa),
        sd = sd(dCa),
        sd2 = 2 * sd(dCa),
        max = max(dCa),
        min = min(dCa)
      )
  })
  
  dCa_carb_sim_stats <- reactive({
    simulation_data <- simulations()
    simulation_data$DeltaCa <- simulation_data$dCa + simulation_data$DeltaCa
    dCa_simulation_stats <-
      ddply(
        simulation_data,
        "time",
        summarize,
        mean = mean(DeltaCa),
        sd = sd(DeltaCa),
        sd2 = 2 * sd(DeltaCa),
        max = max(DeltaCa),
        min = min(DeltaCa)
      )
  })
  
  dSr_sim_stats <- reactive({
    simulation_data <- simulations()
    dSr_simulation_stats <-
      ddply(
        simulation_data,
        "time",
        summarize,
        mean = mean(RadSr),
        sd = sd(RadSr),
        sd2 = 2 * sd(RadSr),
        max = max(RadSr),
        min = min(RadSr)
      )
  })
  
  dStabSr_sim_stats <- reactive({
    simulation_data <- simulations()
    dStabSr_simulation_stats <-
      ddply(
        simulation_data,
        "time",
        summarize,
        mean = mean(StabSr),
        sd = sd(StabSr),
        sd2 = 2 * sd(StabSr),
        max = max(StabSr),
        min = min(StabSr)
      )
  })
  pH_sim_stats <- reactive({
    simulation_data <- simulations()
    pH_simulation_stats <-
      ddply(
        simulation_data,
        "time",
        summarize,
        mean = mean(pH),
        sd = sd(pH),
        sd2 = 2 * sd(pH),
        max = max(pH),
        min = min(pH)
      )
  })
  
  CO2_sim_stats <- reactive({
    simulation_data <- simulations()
    CO2_simulation_stats <-
      ddply(
        simulation_data,
        "time",
        summarize,
        mean = mean(pCO2),
        sd = sd(pCO2),
        sd2 = 2 * sd(pCO2),
        max = max(pCO2),
        min = min(pCO2)
      )
  })
  
  CO3_sim_stats <- reactive({
    simulation_data <- simulations()
    CO3_simulation_stats <-
      ddply(
        simulation_data,
        "time",
        summarize,
        mean = mean(CO3),
        sd = sd(CO3),
        sd2 = 2 * sd(CO3),
        max = max(CO3),
        min = min(CO3)
      )
  })
  
  Omega_sim_stats <- reactive({
    simulation_data <- simulations()
    Omega_simulation_stats <-
      ddply(
        simulation_data,
        "time",
        summarize,
        mean = mean(Omega),
        sd = sd(Omega),
        sd2 = 2 * sd(Omega),
        max = max(Omega),
        min = min(Omega)
      )
  })
  
  Alk_sim_stats <- reactive({
    simulation_data <- simulations()
    Alk_simulation_stats <-
      ddply(
        simulation_data,
        "time",
        summarize,
        mean = mean(Alk),
        sd = sd(Alk),
        sd2 = 2 * sd(Alk),
        max = max(Alk),
        min = min(Alk)
      )
  })
  
  Fbcarb_sim_stats <- reactive({
    simulation_data <- simulations()
    Fbcarb_simulation_stats <-
      ddply(
        simulation_data,
        "time",
        summarize,
        mean = mean(Fbcarb),
        sd = sd(Fbcarb),
        sd2 = 2 * sd(Fbcarb),
        max = max(Fbcarb),
        min = min(Fbcarb)
      )
  })
  
  #Eruption_times <- reactive(
  # Eruption_times_comp<-as.vector(as.numeric(strsplit(input$Excursion, ',')[[1]]))
  #)
  
  output$modelAverage <- renderPlot({
    dSW_stats <- dSW_sim_stats()
    dCa_stats <- dCa_sim_stats()
    dCa_carb_stats <- dCa_carb_sim_stats()
    dSr_stats <- dSr_sim_stats()
    dStabSr_stats <- dStabSr_sim_stats()
    pH_stats <- pH_sim_stats()
    CO2_stats <- CO2_sim_stats()
    CO3_stats <- CO3_sim_stats()
    Omega_stats <- Omega_sim_stats()
    Alk_stats <- Alk_sim_stats()
    Fbcarb_stats <- Fbcarb_sim_stats()
    Eruption_time <-
      as.numeric(unlist(strsplit(input$Excursion, ','))) * 1e6
    
    d13CPlot <-
      ggplot(dSW_stats) + geom_line(aes(time, mean)) + scale_x_continuous(expand =
                                                                            c(0, 0)) + theme_bw() + xlab("Time (Years)") + ylab(expression(delta ^ {
                                                                              13
                                                                            } * C ~ ("‰ VPDB"))) +
      geom_ribbon(
        aes(
          x = time,
          ymin = dSW_stats$mean - dSW_stats$sd,
          ymax = dSW_stats$mean + dSW_stats$sd,
          fill = "1SD"
        ),
        alpha = 0.3
      ) +
      geom_ribbon(
        aes(
          x = time,
          ymin = dSW_stats$mean - dSW_stats$sd2,
          ymax = dSW_stats$mean + dSW_stats$sd2,
          fill = "2SD"
        ),
        alpha = 0.3
      ) +
      geom_line(aes(time, min), linetype = "dotted") + geom_line(aes(time, max), linetype =
                                                                   "dotted") +
      #ylim(limit = c(1.1+.8,2.4+.8))+
      geom_vline(xintercept = Eruption_time, linetype = "dashed") +
      coord_flip() + theme(
        legend.position = "none",
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank()
      )
    
    d44CaPlot <-
      ggplot(dCa_stats) + geom_line(aes(time, mean)) + 
      scale_x_continuous(expand =c(0, 0)) + theme_bw() + xlab("Time (Years)") + 
      ylab(expression(delta ^ {44 / 40} * Ca ~ ("‰ SW"))) +
      geom_ribbon(
        aes(
          x = time,
          ymin = dCa_stats$mean - dCa_stats$sd,
          ymax = dCa_stats$mean + dCa_stats$sd,
          fill = "1SD"
        ),
        alpha = 0.3
      ) +
      geom_ribbon(
        aes(
          x = time,
          ymin = dCa_stats$mean - dCa_stats$sd2,
          ymax = dCa_stats$mean + dCa_stats$sd2,
          fill = "2SD"
        ),
        alpha = 0.3
      ) +
      geom_line(aes(time, min), linetype = "dotted") + geom_line(aes(time, max), linetype =
                                                                   "dotted") +
      geom_vline(xintercept = Eruption_time, linetype = "dashed") +
      ylim(limit = range(dCa_stats$mean))+
      coord_flip() + theme(
        legend.position = "none",
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank()
      )
    
    d44CaCarbPlot <-
      ggplot(dCa_carb_stats) + geom_line(aes(time, mean)) + 
      scale_x_continuous(expand =c(0, 0)) + theme_bw() + xlab("Time (Years)") + 
      ylab(expression(delta ^ {44 / 40} * Ca ~ ("‰ SW of Carb"))) +
      geom_ribbon(
        aes(
          x = time,
          ymin = dCa_carb_stats$mean - dCa_carb_stats$sd,
          ymax = dCa_carb_stats$mean + dCa_carb_stats$sd,
          fill = "1SD"
        ),
        alpha = 0.3
      ) +
      geom_ribbon(
        aes(
          x = time,
          ymin = dCa_carb_stats$mean - dCa_carb_stats$sd2,
          ymax = dCa_carb_stats$mean + dCa_carb_stats$sd2,
          fill = "2SD"
        ),
        alpha = 0.3
      ) +
      geom_line(aes(time, min), linetype = "dotted") + geom_line(aes(time, max), linetype =
                                                                   "dotted") +
      geom_vline(xintercept = Eruption_time, linetype = "dashed") +
      ylim(limit = range(dCa_carb_stats$mean))+
      coord_flip() + theme(
        legend.position = "none",
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank()
      )
    
    dSrPlot <-
      ggplot(dSr_stats) + geom_line(aes(time, mean)) + scale_x_continuous(expand =
                                                                            c(0, 0)) + theme_bw() + xlab("Time (Years)") + ylab(expression("" ^ 87 *
                                                                                                                                             "Sr" / "" ^ 86 * "Sr")) +
      geom_ribbon(
        aes(
          x = time,
          ymin = dSr_stats$mean - dSr_stats$sd,
          ymax = dSr_stats$mean + dSr_stats$sd,
          fill = "1SD"
        ),
        alpha = 0.3
      ) +
      geom_ribbon(
        aes(
          x = time,
          ymin = dSr_stats$mean - dSr_stats$sd2,
          ymax = dSr_stats$mean + dSr_stats$sd2,
          fill = "2SD"
        ),
        alpha = 0.3
      ) +
      geom_line(aes(time, min), linetype = "dotted") + geom_line(aes(time, max), linetype =
                                                                   "dotted") +
      geom_vline(xintercept = Eruption_time, linetype = "dashed") +
      ylim(limit = c(0.709, 0.715)) +
      coord_flip() + theme(
        legend.position = "none",
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank()
      )
    
    dStabSrPlot <-
      ggplot(dStabSr_stats) + geom_line(aes(time, mean)) + scale_x_continuous(expand =
                                                                                c(0, 0)) + theme_bw() + xlab("Time (Years)") + ylab(expression(delta ^ {
                                                                                  88 / 86
                                                                                } * Sr ~ ("‰ SW"))) +
      geom_ribbon(    
        aes(
          x = time,
          ymin = dStabSr_stats$mean - dStabSr_stats$sd,
          ymax = dStabSr_stats$mean + dStabSr_stats$sd,
          fill = "1SD"
        ),
        alpha = 0.3
      ) +
      geom_ribbon(
        aes(
          x = time,
          ymin = dStabSr_stats$mean - dStabSr_stats$sd2,
          ymax = dStabSr_stats$mean + dStabSr_stats$sd2,
          fill = "2SD"
        ),
        alpha = 0.3
      ) +
      geom_line(aes(time, min), linetype = "dotted") + geom_line(aes(time, max), linetype =
                                                                   "dotted") +
      geom_vline(xintercept = Eruption_time, linetype = "dashed") +
      ylim(limit = c(0.3, 0.5)) +
      coord_flip() + theme(
        legend.position = "none",
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank()
      )
    
    pHPlot <-
      ggplot(pH_stats) + geom_line(aes(time, mean)) + scale_x_continuous(expand =
                                                                           c(0, 0)) + theme_bw() + xlab("Time (Years)") + ylab("pH") +
      geom_ribbon(
        aes(
          x = time,
          ymin = pH_stats$mean - pH_stats$sd,
          ymax = pH_stats$mean + pH_stats$sd,
          fill = "1SD"
        ),
        alpha = 0.3
      ) +
      geom_ribbon(
        aes(
          x = time,
          ymin = pH_stats$mean - pH_stats$sd2,
          ymax = pH_stats$mean + pH_stats$sd2,
          fill = "2SD"
        ),
        alpha = 0.3
      ) +
      geom_line(aes(time, min), linetype = "dotted") + geom_line(aes(time, max), linetype =
                                                                   "dotted") +
      geom_vline(xintercept = Eruption_time, linetype = "dashed") +
      #ggtitle(label="Black line is mean of model runs, shaded bands are 1SD and 2SD errors, dotted lines denote most extreme simulation values")+
      coord_flip() + theme(
        legend.position = "none",
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank()
      )
    
    CO2Plot <-
      ggplot(CO2_stats) + geom_line(aes(time, mean)) + scale_x_continuous(expand =
                                                                            c(0, 0)) + theme_bw() + xlab("Time (Years)") + ylab("pCO2 (ppm)") +
      geom_ribbon(
        aes(
          x = time,
          ymin = CO2_stats$mean - CO2_stats$sd,
          ymax = CO2_stats$mean + CO2_stats$sd,
          fill = "1SD"
        ),
        alpha = 0.3
      ) +
      geom_ribbon(
        aes(
          x = time,
          ymin = CO2_stats$mean - CO2_stats$sd2,
          ymax = CO2_stats$mean + CO2_stats$sd2,
          fill = "2SD"
        ),
        alpha = 0.3
      ) +
      geom_line(aes(time, min), linetype = "dotted") + geom_line(aes(time, max), linetype =
                                                                   "dotted") +
      geom_vline(xintercept = Eruption_time, linetype = "dashed") +
      coord_flip() + theme(legend.position = "none")
    
    CO3Plot <-
      ggplot(CO3_stats) + geom_line(aes(time, mean)) + scale_x_continuous(expand =
                                                                            c(0, 0)) + theme_bw() + xlab("Time (Years)") + ylab("CO3 (ppm)") +
      geom_ribbon(
        aes(
          x = time,
          ymin = CO3_stats$mean - CO3_stats$sd,
          ymax = CO3_stats$mean + CO3_stats$sd,
          fill = "1SD"
        ),
        alpha = 0.3
      ) +
      geom_ribbon(
        aes(
          x = time,
          ymin = CO3_stats$mean - CO3_stats$sd2,
          ymax = CO3_stats$mean + CO3_stats$sd2,
          fill = "2SD"
        ),
        alpha = 0.3
      ) +
      geom_line(aes(time, min), linetype = "dotted") + geom_line(aes(time, max), linetype =
                                                                   "dotted") +
      geom_vline(xintercept = Eruption_time, linetype = "dashed") +
      coord_flip() + theme(legend.position = "none")
    
    OmegaPlot <-
      ggplot(Omega_stats) + geom_line(aes(time, mean)) + scale_x_continuous(expand =
                                                                              c(0, 0)) + theme_bw() + xlab("Time (Years)") + ylab(expression(Omega)) +
      geom_ribbon(
        aes(
          x = time,
          ymin = Omega_stats$mean - Omega_stats$sd,
          ymax = Omega_stats$mean + Omega_stats$sd,
          fill = "1SD"
        ),
        alpha = 0.3
      ) +
      geom_ribbon(
        aes(
          x = time,
          ymin = Omega_stats$mean - Omega_stats$sd2,
          ymax = Omega_stats$mean + Omega_stats$sd2,
          fill = "2SD"
        ),
        alpha = 0.3
      ) +
      geom_line(aes(time, min), linetype = "dotted") + geom_line(aes(time, max), linetype =
                                                                   "dotted") +
      geom_vline(xintercept = Eruption_time, linetype = "dashed") +
      #ggtitle(label="Black line is mean of model runs, shaded bands are 1SD and 2SD errors, dotted lines denote most extreme simulation values")+
      coord_flip() + theme(
        legend.position = "none",
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank()
      )
    
    AlkPlot <-
      ggplot(Alk_stats) + geom_line(aes(time, mean)) + scale_x_continuous(expand =
                                                                            c(0, 0)) + theme_bw() + xlab("Time (Years)") + ylab('Alk') +
      geom_ribbon(
        aes(
          x = time,
          ymin = Alk_stats$mean - Alk_stats$sd,
          ymax = Alk_stats$mean + Alk_stats$sd,
          fill = "1SD"
        ),
        alpha = 0.3
      ) +
      geom_ribbon(
        aes(
          x = time,
          ymin = Alk_stats$mean - Alk_stats$sd2,
          ymax = Alk_stats$mean + Alk_stats$sd2,
          fill = "2SD"
        ),
        alpha = 0.3
      ) +
      geom_line(aes(time, min), linetype = "dotted") + geom_line(aes(time, max), linetype =
                                                                   "dotted") +
      geom_vline(xintercept = Eruption_time, linetype = "dashed") +
      #ggtitle(label="Black line is mean of model runs, shaded bands are 1SD and 2SD errors, dotted lines denote most extreme simulation values")+
      coord_flip() + theme(
        legend.position = "none",
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank()
      )
    
    FbcarbPlot <-
      ggplot(Fbcarb_stats) + geom_line(aes(time, mean)) + scale_x_continuous(expand =
                                                                               c(0, 0)) + theme_bw() + xlab("Time (Years)") + ylab("Fbcarb") +
      geom_ribbon(
        aes(
          x = time,
          ymin = Fbcarb_stats$mean - Fbcarb_stats$sd,
          ymax = Fbcarb_stats$mean + Fbcarb_stats$sd,
          fill = "1SD"
        ),
        alpha = 0.3
      ) +
      geom_ribbon(
        aes(
          x = time,
          ymin = Fbcarb_stats$mean - Fbcarb_stats$sd2,
          ymax = Fbcarb_stats$mean + Fbcarb_stats$sd2,
          fill = "2SD"
        ),
        alpha = 0.3
      ) +
      geom_line(aes(time, min), linetype = "dotted") + geom_line(aes(time, max), linetype =
                                                                   "dotted") +
      geom_vline(xintercept = Eruption_time, linetype = "dashed") +
      #ggtitle(label="Black line is mean of model runs, shaded bands are 1SD and 2SD errors, dotted lines denote most extreme simulation values")+
      coord_flip() + theme(
        legend.position = "none",
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank()
      )
    
    
    #CO2Plot <-
    
    #PlotList <- list(CO2Plot, pHPlot, d13CPlot, d44CaPlot, dSrPlot)
    
    grobCO2 <- ggplotGrob(CO2Plot)
    grobCO3 <- ggplotGrob(CO3Plot)
    grobpH <- ggplotGrob(pHPlot)
    grob13C <- ggplotGrob(d13CPlot)
    grob44Ca <- ggplotGrob(d44CaPlot)
    grob44Cacarb <- ggplotGrob(d44CaCarbPlot)
    grobSr <- ggplotGrob(dSrPlot)
    grobStabSr <- ggplotGrob(dStabSrPlot)
    grobOmega <- ggplotGrob(OmegaPlot)
    grobAlk <- ggplotGrob(AlkPlot)
    grobFbcarb <- ggplotGrob(FbcarbPlot)
    grid::grid.newpage()
    grid::grid.draw(gtable_cbind(grobCO2, grobpH, grobOmega, grobFbcarb, grob13C, grob44Ca, grobSr, grobStabSr))
    
    
    #pdf(file = 'Model Out.pdf', width = (2*8/1.5), height = (7/1.5))
    grid::grid.newpage()
    grid::grid.draw(
      gtable_cbind(
        grobCO2,
        grobpH,
        grob13C,
        grob44Ca,
        grob44Cacarb,
        grobOmega,
        grobAlk,
        grobFbcarb,
        grobCO3, 
        grobSr,
        grobStabSr
      )
    )
    #dev.off()
    #grid.arrange(grobs = PlotList, ncol = 5)
    
  })
  
  
  # Nilou Added Plot Experiment ---------------------------------------------
  
  output$modelAverage_C <- renderPlot({
    dSW_stats <- dSW_sim_stats()
    dCa_stats <- dCa_sim_stats()
    dCa_carb_stats <- dCa_carb_sim_stats()
    dSr_stats <- dSr_sim_stats()
    dStabSr_stats <- dStabSr_sim_stats()
    pH_stats <- pH_sim_stats()
    CO2_stats <- CO2_sim_stats()
    CO3_stats <- CO3_sim_stats()
    Omega_stats <- Omega_sim_stats()
    Alk_stats <- Alk_sim_stats()
    Fbcarb_stats <- Fbcarb_sim_stats()
    Eruption_time <-
      as.numeric(unlist(strsplit(input$Excursion, ','))) * 1e6
    
    d13CPlot <-
      ggplot(dSW_stats) + geom_line(aes(time, mean)) + scale_x_continuous(expand =
                                                                            c(0, 0)) + theme_bw() + xlab("Time (Years)") + ylab(expression(delta ^ {
                                                                              13
                                                                            } * C ~ ("‰ VPDB"))) +
      geom_ribbon(
        aes(
          x = time,
          ymin = dSW_stats$mean - dSW_stats$sd,
          ymax = dSW_stats$mean + dSW_stats$sd,
          fill = "1SD"
        ),
        alpha = 0.3
      ) +
      geom_ribbon(
        aes(
          x = time,
          ymin = dSW_stats$mean - dSW_stats$sd2,
          ymax = dSW_stats$mean + dSW_stats$sd2,
          fill = "2SD"
        ),
        alpha = 0.3
      ) +
      geom_line(aes(time, min), linetype = "dotted") + geom_line(aes(time, max), linetype =
                                                                   "dotted") +
      #ylim(limit = c(1.1+.8,2.4+.8))+
      geom_vline(xintercept = Eruption_time, linetype = "dashed") +
      coord_flip() + theme(
        legend.position = "none",
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank()
      )
    
    d44CaPlot <-
      ggplot(dCa_stats) + geom_line(aes(time, mean)) + 
      scale_x_continuous(expand =c(0, 0)) + theme_bw() + xlab("Time (Years)") + 
      ylab(expression(delta ^ {44 / 40} * Ca ~ ("‰ SW"))) +
      geom_ribbon(
        aes(
          x = time,
          ymin = dCa_stats$mean - dCa_stats$sd,
          ymax = dCa_stats$mean + dCa_stats$sd,
          fill = "1SD"
        ),
        alpha = 0.3
      ) +
      geom_ribbon(
        aes(
          x = time,
          ymin = dCa_stats$mean - dCa_stats$sd2,
          ymax = dCa_stats$mean + dCa_stats$sd2,
          fill = "2SD"
        ),
        alpha = 0.3
      ) +
      geom_line(aes(time, min), linetype = "dotted") + geom_line(aes(time, max), linetype =
                                                                   "dotted") +
      geom_vline(xintercept = Eruption_time, linetype = "dashed") +
      #ylim(limit = c(-1.5,-1))+
      coord_flip() + theme(
        legend.position = "none",
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank()
      )
    
    dSrPlot <-
      ggplot(dSr_stats) + geom_line(aes(time, mean)) + scale_x_continuous(expand =
                                                                            c(0, 0)) + theme_bw() + xlab("Time (Years)") + ylab(expression("" ^ 87 *
                                                                                                                                             "Sr" / "" ^ 86 * "Sr")) +
      geom_ribbon(
        aes(
          x = time,
          ymin = dSr_stats$mean - dSr_stats$sd,
          ymax = dSr_stats$mean + dSr_stats$sd,
          fill = "1SD"
        ),
        alpha = 0.3
      ) +
      geom_ribbon(
        aes(
          x = time,
          ymin = dSr_stats$mean - dSr_stats$sd2,
          ymax = dSr_stats$mean + dSr_stats$sd2,
          fill = "2SD"
        ),
        alpha = 0.3
      ) +
      geom_line(aes(time, min), linetype = "dotted") + geom_line(aes(time, max), linetype =
                                                                   "dotted") +
      geom_vline(xintercept = Eruption_time, linetype = "dashed") +
      ylim(limit = c(0.709, 0.715)) +
      coord_flip() + theme(
        legend.position = "none",
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank()
      )
    
    dStabSrPlot <-
      ggplot(dStabSr_stats) + geom_line(aes(time, mean)) + scale_x_continuous(expand =
                                                                                c(0, 0)) + theme_bw() + xlab("Time (Years)") + ylab(expression(delta ^ {
                                                                                  88 / 86
                                                                                } * Sr ~ ("‰ SW"))) +
      geom_ribbon(    
        aes(
          x = time,
          ymin = dStabSr_stats$mean - dStabSr_stats$sd,
          ymax = dStabSr_stats$mean + dStabSr_stats$sd,
          fill = "1SD"
        ),
        alpha = 0.3
      ) +
      geom_ribbon(
        aes(
          x = time,
          ymin = dStabSr_stats$mean - dStabSr_stats$sd2,
          ymax = dStabSr_stats$mean + dStabSr_stats$sd2,
          fill = "2SD"
        ),
        alpha = 0.3
      ) +
      geom_line(aes(time, min), linetype = "dotted") + geom_line(aes(time, max), linetype =
                                                                   "dotted") +
      geom_vline(xintercept = Eruption_time, linetype = "dashed") +
      ylim(limit = c(0.3, 0.5)) +
      coord_flip() + theme(
        legend.position = "none",
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank()
      )
    
    pHPlot <-
      ggplot(pH_stats) + geom_line(aes(time, mean)) + scale_x_continuous(expand =
                                                                           c(0, 0)) + theme_bw() + xlab("Time (Years)") + ylab("pH") +
      geom_ribbon(
        aes(
          x = time,
          ymin = pH_stats$mean - pH_stats$sd,
          ymax = pH_stats$mean + pH_stats$sd,
          fill = "1SD"
        ),
        alpha = 0.3
      ) +
      geom_ribbon(
        aes(
          x = time,
          ymin = pH_stats$mean - pH_stats$sd2,
          ymax = pH_stats$mean + pH_stats$sd2,
          fill = "2SD"
        ),
        alpha = 0.3
      ) +
      geom_line(aes(time, min), linetype = "dotted") + geom_line(aes(time, max), linetype =
                                                                   "dotted") +
      geom_vline(xintercept = Eruption_time, linetype = "dashed") +
      #ggtitle(label="Black line is mean of model runs, shaded bands are 1SD and 2SD errors, dotted lines denote most extreme simulation values")+
      coord_flip() + theme(
        legend.position = "none",
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank()
      )
    
    CO2Plot <-
      ggplot(CO2_stats) + geom_line(aes(time, mean)) + scale_x_continuous(expand =
                                                                            c(0, 0)) + theme_bw() + xlab("Time (Years)") + ylab("pCO2 (ppm)") +
      geom_ribbon(
        aes(
          x = time,
          ymin = CO2_stats$mean - CO2_stats$sd,
          ymax = CO2_stats$mean + CO2_stats$sd,
          fill = "1SD"
        ),
        alpha = 0.3
      ) +
      geom_ribbon(
        aes(
          x = time,
          ymin = CO2_stats$mean - CO2_stats$sd2,
          ymax = CO2_stats$mean + CO2_stats$sd2,
          fill = "2SD"
        ),
        alpha = 0.3
      ) +
      geom_line(aes(time, min), linetype = "dotted") + geom_line(aes(time, max), linetype =
                                                                   "dotted") +
      geom_vline(xintercept = Eruption_time, linetype = "dashed") +
      coord_flip() + theme(legend.position = "none")
    
    CO3Plot <-
      ggplot(CO3_stats) + geom_line(aes(time, mean)) + scale_x_continuous(expand =
                                                                            c(0, 0)) + theme_bw() + xlab("Time (Years)") + ylab("CO3 (ppm)") +
      geom_ribbon(
        aes(
          x = time,
          ymin = CO3_stats$mean - CO3_stats$sd,
          ymax = CO3_stats$mean + CO3_stats$sd,
          fill = "1SD"
        ),
        alpha = 0.3
      ) +
      geom_ribbon(
        aes(
          x = time,
          ymin = CO3_stats$mean - CO3_stats$sd2,
          ymax = CO3_stats$mean + CO3_stats$sd2,
          fill = "2SD"
        ),
        alpha = 0.3
      ) +
      geom_line(aes(time, min), linetype = "dotted") + geom_line(aes(time, max), linetype =
                                                                   "dotted") +
      geom_vline(xintercept = Eruption_time, linetype = "dashed") +
      coord_flip() + theme(legend.position = "none")
    
    OmegaPlot <-
      ggplot(Omega_stats) + geom_line(aes(time, mean)) + scale_x_continuous(expand =
                                                                              c(0, 0)) + theme_bw() + xlab("Time (Years)") + ylab(expression(Omega)) +
      geom_ribbon(
        aes(
          x = time,
          ymin = Omega_stats$mean - Omega_stats$sd,
          ymax = Omega_stats$mean + Omega_stats$sd,
          fill = "1SD"
        ),
        alpha = 0.3
      ) +
      geom_ribbon(
        aes(
          x = time,
          ymin = Omega_stats$mean - Omega_stats$sd2,
          ymax = Omega_stats$mean + Omega_stats$sd2,
          fill = "2SD"
        ),
        alpha = 0.3
      ) +
      geom_line(aes(time, min), linetype = "dotted") + geom_line(aes(time, max), linetype =
                                                                   "dotted") +
      geom_vline(xintercept = Eruption_time, linetype = "dashed") +
      #ggtitle(label="Black line is mean of model runs, shaded bands are 1SD and 2SD errors, dotted lines denote most extreme simulation values")+
      coord_flip() + theme(
        legend.position = "none",
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank()
      )
    
    AlkPlot <-
      ggplot(Alk_stats) + geom_line(aes(time, mean)) + scale_x_continuous(expand =
                                                                            c(0, 0)) + theme_bw() + xlab("Time (Years)") + ylab('Alk') +
      geom_ribbon(
        aes(
          x = time,
          ymin = Alk_stats$mean - Alk_stats$sd,
          ymax = Alk_stats$mean + Alk_stats$sd,
          fill = "1SD"
        ),
        alpha = 0.3
      ) +
      geom_ribbon(
        aes(
          x = time,
          ymin = Alk_stats$mean - Alk_stats$sd2,
          ymax = Alk_stats$mean + Alk_stats$sd2,
          fill = "2SD"
        ),
        alpha = 0.3
      ) +
      geom_line(aes(time, min), linetype = "dotted") + geom_line(aes(time, max), linetype =
                                                                   "dotted") +
      geom_vline(xintercept = Eruption_time, linetype = "dashed") +
      #ggtitle(label="Black line is mean of model runs, shaded bands are 1SD and 2SD errors, dotted lines denote most extreme simulation values")+
      coord_flip() + theme(
        legend.position = "none",
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank()
      )
    
    FbcarbPlot <-
      ggplot(Fbcarb_stats) + geom_line(aes(time, mean)) + scale_x_continuous(expand =
                                                                               c(0, 0)) + theme_bw() + xlab("Time (Years)") + ylab("Fbcarb") +
      geom_ribbon(
        aes(
          x = time,
          ymin = Fbcarb_stats$mean - Fbcarb_stats$sd,
          ymax = Fbcarb_stats$mean + Fbcarb_stats$sd,
          fill = "1SD"
        ),
        alpha = 0.3
      ) +
      geom_ribbon(
        aes(
          x = time,
          ymin = Fbcarb_stats$mean - Fbcarb_stats$sd2,
          ymax = Fbcarb_stats$mean + Fbcarb_stats$sd2,
          fill = "2SD"
        ),
        alpha = 0.3
      ) +
      geom_line(aes(time, min), linetype = "dotted") + geom_line(aes(time, max), linetype =
                                                                   "dotted") +
      geom_vline(xintercept = Eruption_time, linetype = "dashed") +
      #ggtitle(label="Black line is mean of model runs, shaded bands are 1SD and 2SD errors, dotted lines denote most extreme simulation values")+
      coord_flip() + theme(
        legend.position = "none",
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank()
      )
    
    
    #CO2Plot <-
    
    #PlotList <- list(CO2Plot, pHPlot, d13CPlot, d44CaPlot, dSrPlot)
    
    grobCO2 <- ggplotGrob(CO2Plot)
    grobCO3 <- ggplotGrob(CO3Plot)
    grobpH <- ggplotGrob(pHPlot)
    grob13C <- ggplotGrob(d13CPlot)
    grob44Ca <- ggplotGrob(d44CaPlot)
    
    grobSr <- ggplotGrob(dSrPlot)
    grobStabSr <- ggplotGrob(dStabSrPlot)
    grobOmega <- ggplotGrob(OmegaPlot)
    grobAlk <- ggplotGrob(AlkPlot)
    grobFbcarb <- ggplotGrob(FbcarbPlot)
    grid::grid.newpage()
    grid::grid.draw(gtable_cbind(grobCO2, grobpH, grobOmega, grobFbcarb, grob13C, grob44Ca, grobSr, grobStabSr))
    
    
    #pdf(file = 'Model Out.pdf', width = (2*8/1.5), height = (7/1.5))
    grid::grid.newpage()
    grid::grid.draw(
      gtable_cbind(
        grobCO2,
        grobpH,
        #grob13C,
        #grob44Ca,
        grobOmega,
        grobAlk,
        grobFbcarb,
        grobCO3#, 
        #grobSr,
        #grobStabSr
      )
    )
    #dev.off()
    #grid.arrange(grobs = PlotList, ncol = 5)
    
  })
  
  output$modelAverage_I <- renderPlot({
    dSW_stats <- dSW_sim_stats()
    dCa_stats <- dCa_sim_stats()
    dCa_carb_stats <- dCa_carb_sim_stats()
    dSr_stats <- dSr_sim_stats()
    dStabSr_stats <- dStabSr_sim_stats()
    pH_stats <- pH_sim_stats()
    CO2_stats <- CO2_sim_stats()
    CO3_stats <- CO3_sim_stats()
    Omega_stats <- Omega_sim_stats()
    Alk_stats <- Alk_sim_stats()
    Fbcarb_stats <- Fbcarb_sim_stats()
    Eruption_time <-
      as.numeric(unlist(strsplit(input$Excursion, ','))) * 1e6
    
    d13CPlot <-
      ggplot(dSW_stats) + geom_line(aes(time, mean)) + scale_x_continuous(expand =
                                                                            c(0, 0)) + theme_bw() + xlab("Time (Years)") + ylab(expression(delta ^ {
                                                                              13
                                                                            } * C ~ ("‰ VPDB"))) +
      geom_ribbon(
        aes(
          x = time,
          ymin = dSW_stats$mean - dSW_stats$sd,
          ymax = dSW_stats$mean + dSW_stats$sd,
          fill = "1SD"
        ),
        alpha = 0.3
      ) +
      geom_ribbon(
        aes(
          x = time,
          ymin = dSW_stats$mean - dSW_stats$sd2,
          ymax = dSW_stats$mean + dSW_stats$sd2,
          fill = "2SD"
        ),
        alpha = 0.3
      ) +
      geom_line(aes(time, min), linetype = "dotted") + geom_line(aes(time, max), linetype =
                                                                   "dotted") +
      #ylim(limit = c(1.1+.8,2.4+.8))+
      geom_vline(xintercept = Eruption_time, linetype = "dashed") +
      coord_flip() + theme(
        legend.position = "none",
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank()
      )
    
    d44CaPlot <-
      ggplot(dCa_stats) + geom_line(aes(time, mean)) + 
      scale_x_continuous(expand =c(0, 0)) + theme_bw() + xlab("Time (Years)") + 
      ylab(expression(delta ^ {44 / 40} * Ca ~ ("‰ SW"))) +
      geom_ribbon(
        aes(
          x = time,
          ymin = dCa_stats$mean - dCa_stats$sd,
          ymax = dCa_stats$mean + dCa_stats$sd,
          fill = "1SD"
        ),
        alpha = 0.3
      ) +
      geom_ribbon(
        aes(
          x = time,
          ymin = dCa_stats$mean - dCa_stats$sd2,
          ymax = dCa_stats$mean + dCa_stats$sd2,
          fill = "2SD"
        ),
        alpha = 0.3
      ) +
      geom_line(aes(time, min), linetype = "dotted") + geom_line(aes(time, max), linetype =
                                                                   "dotted") +
      geom_vline(xintercept = Eruption_time, linetype = "dashed") +
      #ylim(limit = c(-1.5,-1))+
      coord_flip() + theme(
        legend.position = "none",
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank()
      )
    
    d44CaCarbPlot <-
      ggplot(dCa_carb_stats) + geom_line(aes(time, mean)) + 
      scale_x_continuous(expand =c(0, 0)) + theme_bw() + xlab("Time (Years)") + 
      ylab(expression(delta ^ {44 / 40} * Ca ~ ("‰ SW of carb"))) +
      geom_ribbon(
        aes(
          x = time,
          ymin = dCa_carb_stats$mean - dCa_carb_stats$sd,
          ymax = dCa_carb_stats$mean + dCa_carb_stats$sd,
          fill = "1SD"
        ),
        alpha = 0.3
      ) +
      geom_ribbon(
        aes(
          x = time,
          ymin = dCa_carb_stats$mean - dCa_carb_stats$sd2,
          ymax = dCa_carb_stats$mean + dCa_carb_stats$sd2,
          fill = "2SD"
        ),
        alpha = 0.3
      ) +
      geom_line(aes(time, min), linetype = "dotted") + geom_line(aes(time, max), linetype =
                                                                   "dotted") +
      geom_vline(xintercept = Eruption_time, linetype = "dashed") +
      ylim(limit = range(dCa_carb_stats$mean))+
      coord_flip() + theme(
        legend.position = "none",
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank()
      )
    
    dSrPlot <-
      ggplot(dSr_stats) + geom_line(aes(time, mean)) + scale_x_continuous(expand =
                                                                            c(0, 0)) + theme_bw() + xlab("Time (Years)") + ylab(expression("" ^ 87 *
                                                                                                                                             "Sr" / "" ^ 86 * "Sr")) +
      geom_ribbon(
        aes(
          x = time,
          ymin = dSr_stats$mean - dSr_stats$sd,
          ymax = dSr_stats$mean + dSr_stats$sd,
          fill = "1SD"
        ),
        alpha = 0.3
      ) +
      geom_ribbon(
        aes(
          x = time,
          ymin = dSr_stats$mean - dSr_stats$sd2,
          ymax = dSr_stats$mean + dSr_stats$sd2,
          fill = "2SD"
        ),
        alpha = 0.3
      ) +
      geom_line(aes(time, min), linetype = "dotted") + geom_line(aes(time, max), linetype =
                                                                   "dotted") +
      geom_vline(xintercept = Eruption_time, linetype = "dashed") +
      ylim(limit = c(0.709, 0.715)) +
      coord_flip() + theme(
        legend.position = "none",
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank()
      )
    
    dStabSrPlot <-
      ggplot(dStabSr_stats) + geom_line(aes(time, mean)) + scale_x_continuous(expand =
                                                                                c(0, 0)) + theme_bw() + xlab("Time (Years)") + ylab(expression(delta ^ {
                                                                                  88 / 86
                                                                                } * Sr ~ ("‰ SW"))) +
      geom_ribbon(    
        aes(
          x = time,
          ymin = dStabSr_stats$mean - dStabSr_stats$sd,
          ymax = dStabSr_stats$mean + dStabSr_stats$sd,
          fill = "1SD"
        ),
        alpha = 0.3
      ) +
      geom_ribbon(
        aes(
          x = time,
          ymin = dStabSr_stats$mean - dStabSr_stats$sd2,
          ymax = dStabSr_stats$mean + dStabSr_stats$sd2,
          fill = "2SD"
        ),
        alpha = 0.3
      ) +
      geom_line(aes(time, min), linetype = "dotted") + geom_line(aes(time, max), linetype =
                                                                   "dotted") +
      geom_vline(xintercept = Eruption_time, linetype = "dashed") +
      ylim(limit = c(0.3, 0.5)) +
      coord_flip() + theme(
        legend.position = "none",
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank()
      )
    
    pHPlot <-
      ggplot(pH_stats) + geom_line(aes(time, mean)) + scale_x_continuous(expand =
                                                                           c(0, 0)) + theme_bw() + xlab("Time (Years)") + ylab("pH") +
      geom_ribbon(
        aes(
          x = time,
          ymin = pH_stats$mean - pH_stats$sd,
          ymax = pH_stats$mean + pH_stats$sd,
          fill = "1SD"
        ),
        alpha = 0.3
      ) +
      geom_ribbon(
        aes(
          x = time,
          ymin = pH_stats$mean - pH_stats$sd2,
          ymax = pH_stats$mean + pH_stats$sd2,
          fill = "2SD"
        ),
        alpha = 0.3
      ) +
      geom_line(aes(time, min), linetype = "dotted") + geom_line(aes(time, max), linetype =
                                                                   "dotted") +
      geom_vline(xintercept = Eruption_time, linetype = "dashed") +
      #ggtitle(label="Black line is mean of model runs, shaded bands are 1SD and 2SD errors, dotted lines denote most extreme simulation values")+
      coord_flip() + theme(
        legend.position = "none",
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank()
      )
    
    CO2Plot <-
      ggplot(CO2_stats) + geom_line(aes(time, mean)) + scale_x_continuous(expand =
                                                                            c(0, 0)) + theme_bw() + xlab("Time (Years)") + ylab("pCO2 (ppm)") +
      geom_ribbon(
        aes(
          x = time,
          ymin = CO2_stats$mean - CO2_stats$sd,
          ymax = CO2_stats$mean + CO2_stats$sd,
          fill = "1SD"
        ),
        alpha = 0.3
      ) +
      geom_ribbon(
        aes(
          x = time,
          ymin = CO2_stats$mean - CO2_stats$sd2,
          ymax = CO2_stats$mean + CO2_stats$sd2,
          fill = "2SD"
        ),
        alpha = 0.3
      ) +
      geom_line(aes(time, min), linetype = "dotted") + geom_line(aes(time, max), linetype =
                                                                   "dotted") +
      geom_vline(xintercept = Eruption_time, linetype = "dashed") +
      coord_flip() + theme(legend.position = "none")
    
    CO3Plot <-
      ggplot(CO3_stats) + geom_line(aes(time, mean)) + scale_x_continuous(expand =
                                                                            c(0, 0)) + theme_bw() + xlab("Time (Years)") + ylab("CO3 (ppm)") +
      geom_ribbon(
        aes(
          x = time,
          ymin = CO3_stats$mean - CO3_stats$sd,
          ymax = CO3_stats$mean + CO3_stats$sd,
          fill = "1SD"
        ),
        alpha = 0.3
      ) +
      geom_ribbon(
        aes(
          x = time,
          ymin = CO3_stats$mean - CO3_stats$sd2,
          ymax = CO3_stats$mean + CO3_stats$sd2,
          fill = "2SD"
        ),
        alpha = 0.3
      ) +
      geom_line(aes(time, min), linetype = "dotted") + geom_line(aes(time, max), linetype =
                                                                   "dotted") +
      geom_vline(xintercept = Eruption_time, linetype = "dashed") +
      coord_flip() + theme(legend.position = "none")
    
    OmegaPlot <-
      ggplot(Omega_stats) + geom_line(aes(time, mean)) + scale_x_continuous(expand =
                                                                              c(0, 0)) + theme_bw() + xlab("Time (Years)") + ylab(expression(Omega)) +
      geom_ribbon(
        aes(
          x = time,
          ymin = Omega_stats$mean - Omega_stats$sd,
          ymax = Omega_stats$mean + Omega_stats$sd,
          fill = "1SD"
        ),
        alpha = 0.3
      ) +
      geom_ribbon(
        aes(
          x = time,
          ymin = Omega_stats$mean - Omega_stats$sd2,
          ymax = Omega_stats$mean + Omega_stats$sd2,
          fill = "2SD"
        ),
        alpha = 0.3
      ) +
      geom_line(aes(time, min), linetype = "dotted") + geom_line(aes(time, max), linetype =
                                                                   "dotted") +
      geom_vline(xintercept = Eruption_time, linetype = "dashed") +
      #ggtitle(label="Black line is mean of model runs, shaded bands are 1SD and 2SD errors, dotted lines denote most extreme simulation values")+
      coord_flip() + theme(
        legend.position = "none",
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank()
      )
    
    AlkPlot <-
      ggplot(Alk_stats) + geom_line(aes(time, mean)) + scale_x_continuous(expand =
                                                                            c(0, 0)) + theme_bw() + xlab("Time (Years)") + ylab('Alk') +
      geom_ribbon(
        aes(
          x = time,
          ymin = Alk_stats$mean - Alk_stats$sd,
          ymax = Alk_stats$mean + Alk_stats$sd,
          fill = "1SD"
        ),
        alpha = 0.3
      ) +
      geom_ribbon(
        aes(
          x = time,
          ymin = Alk_stats$mean - Alk_stats$sd2,
          ymax = Alk_stats$mean + Alk_stats$sd2,
          fill = "2SD"
        ),
        alpha = 0.3
      ) +
      geom_line(aes(time, min), linetype = "dotted") + geom_line(aes(time, max), linetype =
                                                                   "dotted") +
      geom_vline(xintercept = Eruption_time, linetype = "dashed") +
      #ggtitle(label="Black line is mean of model runs, shaded bands are 1SD and 2SD errors, dotted lines denote most extreme simulation values")+
      coord_flip() + theme(
        legend.position = "none",
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank()
      )
    
    FbcarbPlot <-
      ggplot(Fbcarb_stats) + geom_line(aes(time, mean)) + scale_x_continuous(expand =
                                                                               c(0, 0)) + theme_bw() + xlab("Time (Years)") + ylab("Fbcarb") +
      geom_ribbon(
        aes(
          x = time,
          ymin = Fbcarb_stats$mean - Fbcarb_stats$sd,
          ymax = Fbcarb_stats$mean + Fbcarb_stats$sd,
          fill = "1SD"
        ),
        alpha = 0.3
      ) +
      geom_ribbon(
        aes(
          x = time,
          ymin = Fbcarb_stats$mean - Fbcarb_stats$sd2,
          ymax = Fbcarb_stats$mean + Fbcarb_stats$sd2,
          fill = "2SD"
        ),
        alpha = 0.3
      ) +
      geom_line(aes(time, min), linetype = "dotted") + geom_line(aes(time, max), linetype =
                                                                   "dotted") +
      geom_vline(xintercept = Eruption_time, linetype = "dashed") +
      #ggtitle(label="Black line is mean of model runs, shaded bands are 1SD and 2SD errors, dotted lines denote most extreme simulation values")+
      coord_flip() + theme(
        legend.position = "none",
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank()
      )
    
    
    #CO2Plot <-
    
    #PlotList <- list(CO2Plot, pHPlot, d13CPlot, d44CaPlot, dSrPlot)
    
    grobCO2 <- ggplotGrob(CO2Plot)
    grobCO3 <- ggplotGrob(CO3Plot)
    grobpH <- ggplotGrob(pHPlot)
    grob13C <- ggplotGrob(d13CPlot)
    grob44Ca <- ggplotGrob(d44CaPlot)
    grob44Cacarb <- ggplotGrob(d44CaCarbPlot)
    grobSr <- ggplotGrob(dSrPlot)
    grobStabSr <- ggplotGrob(dStabSrPlot)
    grobOmega <- ggplotGrob(OmegaPlot)
    grobAlk <- ggplotGrob(AlkPlot)
    grobFbcarb <- ggplotGrob(FbcarbPlot)
    grid::grid.newpage()
    grid::grid.draw(gtable_cbind(grob13C, grob44Ca, grobSr, grobStabSr, grobFbcarb )) #, grobCO2, grobpH, grobOmega,  ))
    
    
    #pdf(file = 'Model Out.pdf', width = (2*8/1.5), height = (7/1.5))
    grid::grid.newpage()
    grid::grid.draw(
      gtable_cbind(
        #grobCO2,
        #grobpH,
        grob13C,
        grob44Ca,
        grob44Cacarb,
        #grobOmega,
        #grobAlk,
        grobFbcarb,
        #grobCO3, 
        grobSr,
        grobStabSr
      )
    )
    #dev.off()
    #grid.arrange(grobs = PlotList, ncol = 5)
    
  })
  
  output$modelPlots <- renderPlot({
    simulation_data <- simulations()
    ggplot(simulation_data, aes(time, dCa, color = as.character(simulation_data$runNum))) +
      geom_line() + scale_x_continuous(expand = c(0, 0)) + theme_bw()
  })
  
}


  
  