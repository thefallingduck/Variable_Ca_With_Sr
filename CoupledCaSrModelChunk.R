CarbonSpecies <-
  function(temp = 15,
           s = 1.035,
           z = 0,
           alk = 1.89 * 10 ^ -3,
           DIC = 1.9 * 10 ^ -3) {
    #Based on Bachan's matlab github script (avivbd)
    #Derived from Chemical Oceanography and the Marine Carbon Cycle 2008 by Emmerson
    # and Hedges p. 129 and Zeebe's C system code
    
    #Args:
    # temp:   Temperature in degrees C
    # s:      salinity in kg/L
    # z:      % m
    # alk:    alkalinity eq/kg
    # DIC:    Dissolved inorganic carbon mol/kg
    
    #Returns:
    #   columns consisting of the following:
    #
    # pCO2:   pCO2 of atmosphere in ?units?
    # pH:     pH units
    # CO2:    CO2 in mol/Kg
    # HCO3:   HCO3 in mol/Kg
    # CO3:    CO3 in mol/Kg
    
    
    s <- s * 1e3 - 1e3
    t <- temp + 273.15
    Pr <- z / 10
    R <- 83.131
    tbor <- (0.000416 * s) / 35.0
    
    ####Constants ####
    
    U1 <- -60.2409 + 93.4517 * (100 / t) + 23.3585 * log(t / 100)
    
    U2 <-
      s * (0.023517 - 0.023656 * (t / 100) + 0.0047036 * (t / 100) ^ 2)
    
    KH <- exp(U1 + U2)
    KB <- exp((-8966.9 - 2890.53 * s ^ 0.5 - 77.942 * s
               + 1.728 * s ^ 1.5 - 0.0996 * s ^ 2) / t
              + 148.0248 + 137.1942 * s ^ 0.5 + 1.62142 * s
              - (24.4344 + 25.085 * s ^ 0.5 + 0.2474 * s)
              * log(t) + 0.053105 * s ^ 0.5 * t
    )
    
    K1 <-
      10 ^ (-1 * (
        3633.86 / t - 61.2172 + 9.67770 * log(t) - 0.011555 * s + 0.0001152 * s ^
          2
      ))
    
    K2 <-
      10 ^ (-1 * (471.78 / t + 25.9290 - 3.16967 * log(t) - 0.01781 * s + 0.0001122 * s ^
                    2))
    
    dvB <- -29.48 + 0.1622 * temp - 0.002608 * (temp) ^ 2
    
    dv1 <- -25.20 + 0.1271 * temp
    
    dv2 <- -15.82 - 0.0219 * temp
    
    dkB <- -0.00284
    
    dk1 <- -0.00308 + 0.0000877 * temp
    
    dk2 <- 0.00113 - 0.0001475 * temp
    
    KB <-
      (exp(-1 * (dvB / (R * t)) * Pr + (0.5 * dkB / (R * t)) * Pr ^ 2)) * KB
    
    K1 <-
      (exp(-1 * (dv1 / (R * t)) * Pr + (0.5 * dk1 / (R * t)) * Pr ^ 2)) * K1
    
    K2 <-
      (exp(-1 * (dv2 / (R * t)) * Pr + (0.5 * dk2 / (R * t)) * Pr ^ 2)) * K2
    
    KW1 <- 148.96502 - 13847.26 / t - 23.65218 * log(t)
    
    KW2 <-
      (118.67 / t - 5.977 + 1.0495 * log(t)) * s ^ 0.5 - 0.01615 * s
    
    KW <- exp(KW1 + KW2)
    
    #### Solve for H ion ####
    
    a1 <- 1
    
    a2 <- (alk + KB + K1)
    
    a3 <-
      (alk * KB - KB * tbor - KW + alk * K1 + K1 * KB + K1 * K2 - DIC * K1)
    
    a4 <-
      (-KW * KB + alk * KB * K1 - KB * tbor * K1 - KW * K1 + alk * K1 * K2 + KB * K1 * K2 - DIC * KB * K1 - 2 * DIC * K1 * K2)
    
    a5 <-
      (-KW * KB * K1 + alk * KB * K1 * K2 - KW * K1 * K2 - KB * tbor * K1 * K2 - 2 * DIC * KB * K1 * K2)
    
    a6 <- -KB * KW * K1 * K2
    
    p <-
      c(a6, a5, a4, a3, a2, a1) #Reversed order from matlab function
    
    r <- polyroot(p)
    
    h <- max(Re(r))
    
    ####Calculate HCO3, CO3, CO2aq [mol/kg], and pCO2 [microatm]
    
    HCO3 <- DIC / (1 + h / K1 + K2 / h)
    CO3 <- DIC / (1 + h / K2 + h * h / (K1 * K2))
    CO2 <- DIC / (1 + K1 / h + K1 * K2 / (h * h))
    
    pH <- -log10(h)
    
    pCO2 <- 1e6 * CO2 / KH
    
    output <- cbind(HCO3, CO3, CO2, pH, pCO2)
    
    return(output)
    
  }

CoupledCaSrModel <- function(duration = 3,
                             Stepsize = 1000,
                             initial = list(
                               z = 0,
                               temp = 15,
                               s = 1.035,
                               Voc = 2.32e21,
                               DIC = 1.910e-3,
                               molCa = 17e-3,
                               molPO4 = 0.25e-6,
                               molSO4 = 28e-3,
                               ksp = 4.31e-7,
                               Fvolc = 16e12,
                               Fwcarb = 24e12,
                               Fwsil = 12e12,
                               Fwp = 11.3e10,
                               kcp = 106,
                               G = 3.3,
                               Z = 0.09,
                               Zcarb = 0.07,
                               pcp = 1,
                               dCvolc = -5.5,
                               dCCarb = 2,
                               dCOrg = -28,
                               dCextra = -15,
                               dCawcarb = -0.4,
                               dCawsili = -0.1,
                               DeltaCai = -1.4,
                               pbp = 1,
                               sat = 1,
                               RadSrSil = 0.7115,
                               RadSrCarb = 0.708,
                               dStabSrSil = 0.27, #vollsteadt 
                               dStabSrCarb = 0.16, #need to adjust this for time period
                               dStabSrHyd = 0.27,
                               SrC_scalar = 0.01, #made this number up 
                               molSr = 17e-8,
                               KsilSr = (1 / 305),
                               KcarbSr = (1 / 1250),
                               kalk = 0.02389
                             ),
                             Eruption = 9.00e17,
                             excursion = c(1, 1.02)) {
  #### Load additional functions and packages ####
  library(deSolve)
  
  #### Args ####
  #   duration:   Duration of model run in millions of years
  #   StepSize:   Timestep of integration of model in years
  #   z:          Water depth for Zeebe equations
  #   temp:       Temperature (C) for Zeebe equations
  #   s:          Salinity
  #   Voc:        Ocean volume in L
  #   DIC:        Dissolved inorganic carbon
  #   molCa:      Moles of Ca in 1 L of seawater
  #   molPO4:     Moles of PO4 in 1 L of seawater
  #   molSO4:     Moles of SO4 in 1 L of seawater
  #   ksp:        Denominator in Omega equation
  #   Fvolc:      Volcanic flux of C or Ca in mol
  #   Fwcarb:     Weathering flux of C or Ca from carbonate in mol
  #   Fwsil:      Weathering flux of Ca from silicates
  #   Fwp:        Weathering flux of phosphate
  #   kcp:        Carbon/phosphorus of organic matter in sediment
  #   G:          Berner 2004 coeffecent for RCO2 weathering flux adjustment
  #   Z:          Berner 2004 coeffecent for RCO2 weathering flux adjustment
  #   Zcarb:      Berner 2004 coeffecent for RCO2 weathering flux adjustment
  #   pcp:        exponent for C:P sensitivity
  #   dCvolc:     Carbon isotope composition of volcanic flux
  #   dCCarb:     Carbon isotope composition of buried carbonate
  #   dCOrg:      Carbon isotope composition of buried organic matter
  #   dCextra:    Carbon isotope composition of CO2 input
  
  
  
  
  #### Flux Calculations to ensure steady-state ####
  Fvolc <- initial$Fvolc
  Fwcarbi <- initial$Fwcarb
  Fwsili <- initial$Fwsil
  Fbcarbi <- Fwcarbi + Fwsili
  kcpi <- initial$kcp
  Fwpi <- initial$Fwp
  Fbpi <- Fwpi
  Fborgi <- Fbpi * kcpi
  Fworgi <- -(Fwcarbi + Fvolc - Fbcarbi - Fborgi)
  
  #### Filling parms list for steady state ####
  parms <- list(
    z = initial$z,
    temp = initial$temp,
    s = initial$s,
    Voc = initial$Voc,
    #2.32
    DICi = initial$DIC,
    #1.9134 for pCO2 1983, for pCO2 of 353 1.71
    molCai = initial$molCa,
    molPO4i = initial$molPO4,
    molSO4i = initial$molSO4,
    omegai = 1,
    #Adjusted based on DIC and molCai for steadystate
    ksp = initial$ksp,
    pCO2i = 1,
    #Adjusted based on DIC for steadystate #1893
    kalk = initial$kalk - 2 * initial$molCa + 2 * initial$molSO4,
    #0.02389, #changed because of rounding?0.02389
    Fvolc = Fvolc,
    Fwcarbi = Fwcarbi,
    Fwsili = Fwsili,
    Fbcarbi = Fbcarbi,
    kcpi = kcpi,
    Fwpi = Fwpi,
    Fbpi = Fwpi,
    Fborgi = Fborgi,
    Fworgi = Fworgi,
    G = initial$G,
    Z = initial$Z,
    Zcarb = initial$Zcarb,
    pcp = initial$pcp,
    #scalling coeffecient for eq 11 in Jost et al
    dCvolc = initial$dCvolc,
    dCbCarbi = initial$dCCarb,
    dCbOrgi = initial$dCOrg,
    dCwcarb = initial$dCCarb,
    dCworg = initial$dCOrg,
    dCawcarb = initial$dCawcarb + initial$DeltaCai,
    dCawsil = initial$dCawsili + initial$DeltaCai,
    DeltaCorgi = abs(initial$dCOrg - initial$dCCarb),
    DeltaCai = initial$DeltaCai,
    dCextra = initial$dCextra,
    pbp = initial$pbp,
    sat = initial$sat,
    #omega saturation state, may want to adjust up because of dissolution at higher sat states in reefs
    Eruption = (((Eruption)) / (sum(diff(
      excursion
    )) * 10 ^ 6)),
    excursion = excursion * 10 ^ 6,
    RadSrSil = initial$RadSrSil,
    RadSrCarb = initial$RadSrCarb,
    SrC_scalar = 0.001,
    RadSrHyd = 0.7025,
    
    ### stable sr nls added ### 
    dStabSrSil = 0.27, ### nls added
    dStabSrCarb = 0.16, ### nls added
    #driv = 0.16, #adjusted by ADJ NLS
    dStabSrHyd = 0.21, #vollstaedt 2014
    #dgroundw = 0.12, # adjusted by ADJ NLS
    #ddiag = 0.39, #vollstaedt 2014 used porewater fluids #0.39 is also seawater 
    DeltaCcarb = -0.24, # fractionation factor carbonate-sw vollstaedt 2014 -0.24 krabbenhoft -0.21
    ####
    
    molSr = initial$molSr,
    KsilSr = initial$KsilSr,
    KcarbSr = initial$KcarbSr,
    KbcarbSr = (((Fwcarbi * initial$KcarbSr + Fwsili * initial$KsilSr) / Fbcarbi
    ))
  )
  
  parms$pCO2i <- CarbonSpecies(
    temp = parms$temp,
    s = parms$s,
    z = parms$z,
    alk = (2 * ((parms$molCai * parms$s * parms$Voc) / (parms$s * parms$Voc)
    )) - (2 * ((parms$molSO4i * parms$s * parms$Voc) / (parms$s * parms$Voc)
    )) + parms$kalk,
    DIC = parms$DICi
  )[5]
  
  parms$omegai <- ((parms$molCai) * (
    CarbonSpecies(
      temp = parms$temp,
      s = parms$s,
      z = parms$z,
      alk = (2 * ((parms$molCai * parms$s * parms$Voc) / (parms$s * parms$Voc)
      )) - (2 * ((parms$molSO4i * parms$s * parms$Voc) / (parms$s * parms$Voc)
      )) + parms$kalk,
      DIC = parms$DICi
    )[2]
  )) / parms$ksp
  
  #### Filling initial conditions of values for boxmodel ####
  
  yini <- c(
    Mc = parms$DICi * parms$Voc * parms$s,
    dC = 2,
    Mca = parms$molCai * parms$Voc * parms$s,
    dCa = -.3,
    Mp = parms$molPO4i * parms$Voc * parms$s,
    Msr = parms$molSr * parms$Voc * parms$s,
    RadSr = 0.71035214965,
    StabSr = 0.396
  )
  
  #### Vector of times equations are solved for ####
  
  times <- seq(0, (duration * 10 ^ 6), by = Stepsize)
  
  
  #### Flux extra equation - C and Ca input from volcanic source ####
  
  Fextra <- function(t, parms) {
    Evens <- parms$excursion[which(seq_along(parms$excursion) %% 2 == 0)]
    Odds <- parms$excursion[which(seq_along(parms$excursion) %% 2 != 0)]
    num <-
      as.numeric(as.character(ifelse(
        all(t > Evens | t < Odds), parms$Eruption * 0, (parms$Eruption)
      )))
    return(num)
  }
  #### Boxmodel ####
  boxmodel <- function (t, y, parms) {
    with(as.list(y), {
      #### Carbonate system ####
      
      Alk <-
        (2 * ((Mca) / (parms$s * parms$Voc))) - (2 * ((parms$molSO4i * parms$Voc * parms$s) /
                                                        (parms$s * parms$Voc)
        )) + parms$kalk
      
      DIC <- Mc / (parms$s * parms$Voc)
      
      CarbonInfo <- CarbonSpecies(
        temp = parms$temp,
        s = parms$s,
        z = parms$z,
        alk = Alk,
        DIC = DIC
      )
      pCO2 <- CarbonInfo[5]
      
      pH <- CarbonInfo[4]
      
      CO2 <- CarbonInfo[3]
      
      CO3 <- CarbonInfo[2]
      
      HCO3 <- CarbonInfo[1]
      
      Omega <- ((Mca / parms$Voc / parms$s) * (CO3)) / parms$ksp
      
      RCO2 <- pCO2 / parms$pCO2i
      
      #### Burial fluxes calculated ####
      Fbp <-
        parms$Fbpi * (Mp / (parms$molPO4i * parms$Voc * parms$s)) ^ parms$pbp
      
      kcp <- parms$kcpi * exp(Fbp / parms$Fbpi - 1) ^ parms$pcp
      
      Fborg <- Fbp * kcp
      Fbcarb <-
        parms$Fbcarbi * ((Omega - parms$sat) / (parms$omegai - parms$sat))
      
      #### Weathering fluxes calculated ####
      Fwcarb <-
        parms$Fwcarbi * (RCO2) ^ (parms$G * parms$Z) * (1 + parms$G * parms$Zcarb *
                                                          log(RCO2)) #?changed to Zcarb in second piece
      #Fwsil <- parms$Fwsili*(RCO2)^(parms$G*parms$Z)*(1+parms$G*parms$Z*log(RCO2))^(0.65)	#not sure what 0.65 means?
      Fwsil <- parms$Fwsili * 1.5 * (log2(RCO2) + 1)
      Fworg <-
        parms$Fworgi * (RCO2) ^ (parms$G * parms$Z) * (1 + parms$G * parms$Z *
                                                         log(RCO2)) ^ (0.65)
      Fwp <-
        parms$Fwpi * (RCO2) ^ (parms$G * parms$Z) * (1 + parms$G * parms$Z * log(RCO2)) ^
        (0.65)
      
      #### Calcium isotope fractionation factor ####
      
      DeltaCa <- NielsonFract(Mca = Mca/parms$Voc,
                              Voc = parms$Voc,
                              DIC = DIC,
                              alk = Alk,
                              temp = parms$temp,
                              s = parms$s,
                              z = parms$z)[1]
      
      #### Extra flux of C###
      
      Erupt <- Fextra(t, parms)
      
      #### Carbon box ####
      
      dMc <-
        Fwcarb + Fworg + parms$Fvolc - Fbcarb - Fborg + Fextra(t, parms)
      
      ddeltaC <- (
        parms$Fvolc * (parms$dCvolc - dC)
        + Fworg * (parms$dCworg - dC)
        + Fwcarb * (parms$dCwcarb - dC)
        - Fborg * (-parms$DeltaCorgi)
        + Fextra(t, parms) * (parms$dCextra - dC)
      ) / Mc
      
      #### Calcium box ####
      dMca <- Fwsil + Fwcarb - Fbcarb
      
      ddeltaCa <-
        (((Fwsil * (
          parms$dCawsil - dCa
        )) + (Fwcarb * (
          parms$dCawcarb - dCa
        ))
        - (Fbcarb * (
          DeltaCa
        )))) / Mca
      
      #### PO4 box ####
      
      dMp <- Fwp - Fbp
      
      #### Radiogenic Sr box ####
      
      dMsr <-
        (Fwsil * parms$KsilSr) + (Fwcarb * parms$KcarbSr) - (Fbcarb * parms$KbcarbSr) + Fextra(t, parms)*parms$SrC_scalar
      
      dRadSr <-
        (((
          Fwsil * parms$KsilSr * (parms$RadSrSil - RadSr)
        ) + (
          Fwcarb * parms$KcarbSr * (parms$RadSrCarb - RadSr)
        ))+ 
          Fextra(t,parms) *parms$SrC_scalar * (parms$RadSrHyd - RadSr)) / Msr
      
      #### Stable Sr box ####
      
      dStabSr <- 
        ((Fwsil * parms$KsilSr) * (parms$dStabSrSil - StabSr) + 
           (Fwcarb * parms$KcarbSr) * (parms$dStabSrCarb - StabSr) +
           (Fextra(t,parms) *parms$SrC_scalar * (parms$dStabSrHyd - StabSr) ) -
           (Fbcarb * parms$KbcarbSr * parms$DeltaCcarb) #burial is removed, extra volcanic is added
        ) /Msr
      
      #### Return list for boxmodel function ####
      list(c(dMc, ddeltaC, dMca, ddeltaCa, dMp, dMsr, dRadSr, dStabSr), 
           Alk = Alk, DIC = DIC, DeltaCa = DeltaCa, Erupt = Erupt, pCO2 = pCO2, pH = pH, 
           CO2 = CO2, CO3 = CO3, HCO3 = HCO3, Omega = Omega, Fbp = Fbp, Fborg = Fborg, 
           Fbcarb = Fbcarb, Fwcarb = Fwcarb, Fwsil = Fwsil, Fworg = Fworg, Fwp = Fwp)
    })
    
  }
  
  #### Differential equation solver initilization ####
  
  out <-
    lsoda(
      y = yini,
      times = times,
      func = boxmodel,
      parms = parms
    )
  
  allout <- as.data.frame(out)
  
  return(allout)
  
}
  