NielsonFract <- function(
  Mca = 10e-3,
  Voc = 2.32e21,
  DIC = 2.1*10^-3,
  alk = 1.89*10^-3,
  temp = 25,
  s = 1.035,
  z = 0)

{
  #### Function to return proposed DELTA44/40Ca between SW and carb ####
  # combines code from Jiuyan and Aviv
  #
  #
  ####Args ####
  #
  #
  #
  #

  alkconst <- alk - (2 * (( Mca ) / (s * Voc))) / ( s * Voc)

  alk <- (2 * (( Mca ) / (s * Voc))) / ( s * Voc) + alkconst

  #source('CarbonSpeciesFunction.R')

  carbchem <- CarbonSpecies(temp = temp,
                            s = s,
                            z = z,
                            alk = alk,
                            DIC = DIC)

  CO3 <- carbchem[2]
  pCO2 <- carbchem[5]


  ra <- 10^((Mca/(Voc * s))/CO3)

  kca <- 1.32*10^(8)
  kco3 <- 1.77*10^(8)
  vca <- 3.41*10^(3)
  vco3 <- 1.98*10^(4)
  af <- 0.9963
  aeq <- 0.9998
  ksp <- 4.31e-7

  r <- (kca*ra)/kco3

  Omega <- ((Mca)*(CO3))/ksp

  Satur <- exp(Omega)

  PA1 <- (sqrt(Satur*r*vca*vco3)+vco3)/(sqrt(Satur*r*vca*vco3)+sqrt(Satur*vca*vco3/r+vco3+vca)+vca+vco3)
  PB1 <- (sqrt(Satur*vca*vco3/r)+vca)/(sqrt(Satur*r*vca*vco3)+sqrt(Satur*vca*vco3/r+vco3+vca)+vca+vco3)
  ap1 <- (af*sqrt(Satur*r*vca*vco3)*PB1)/(sqrt(Satur*r*vca*vco3)*PB1+vca*PA1*(af/aeq-1))

  DeltaCa <- ((ap1-1)*1000)

  output <- cbind(DeltaCa, pCO2, Omega, alk)

  return(output)}
