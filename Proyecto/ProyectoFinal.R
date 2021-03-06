## Proyecto Final an�lisis num�rico
#Integrantes:
#  Diego Gomez
#  Luis Manuel Pe�aranda
#  Camilo Moreno

#Fuente para la obtencion de datos malware:
#Datos de infecci�n:
##   https://cybermap.kaspersky.com/es/stats
#Datos de recuperados:
##   Detection of Intrusions and Malware, and Vulnerability Assessment: 8th International Conference, DIMVA 2011, Amsterdam, The Netherlands, July 7-8, 2011, Proceedings
##   Link del libro: https://books.google.com.co/books?id=l6ERBwAAQBAJ&dq=how+many+chance+do+a+anti+virus+detect&hl=es

#el escenario consiste en que kasperski es nuestro mundo de 
#pruebas por ende nuestro numero de suceptibles son el numero 
#de dispositivos que tienen el antivirus, nuestros infectados es 
#el numero de ataques que reciben los dispositivos con el 
#antivirus por parte de los malwares y los recuperados mas 
#que recuperados son aquellos dispositivos el cual el antivirus 
#no pudo proteger y son afectados por le malware atacante.


library(shiny)
library (shinydashboard) 
library(shinyjs)
library(PolynomF)
library(deSolve)
library(phaseR)
#datos desde 13 abril 2020 a 18 mayo 2020
kasp<-c(2481667,2402646,2442653,2584573,2501995,2747072,2740103,
        10805670,5817167,6384624,15171063,14331878,11909716,11759059,
        14595563,14626680,14530705,14530705,11347762,19363886,18961818,
        18340856,17038822,20291509,18754639,18203043,19297302,18655692,
        24020341,20930352,20779337,20243631,16447359,11256883,10329849,13970758)
#18 mayo
dias<-seq(1, length(kasp), by = 1)
total<-c(kasp[1])
for(i in 1:(length(kasp)-1)){
  total <- c(total, total[i] + kasp[i+1])
}
total <- total/1000000
#Caluclo del Beta por medio de las pendientes de infecci�n:
p <- 0
pr <- 0
cont <- 0
for(i in 1:(length(total)-1)){
  p <- (total[i+1]-total[i]) + p
  cont <- cont + 1
}
p<- p/cont
p <- p/100
p #promedio de las pendientes en porcentaje

# Define UI for displaying current time ----
ui <- dashboardPage(
  dashboardHeader (), 
  dashboardSidebar (), 
  dashboardBody () 
)
header <- dashboardHeader(title = "Malware")


sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("SI", tabName = "SI", icon = icon("calculator")),
    menuItem("SIR", tabName = "SIR", icon = icon("calculator") )
  )

)

frow1 <- fluidRow(
  valueBoxOutput("value1")
  ,valueBoxOutput("value2")
  ,valueBoxOutput("value3")
)

TabSI <- fluidRow( 
  
  box(
    title = "Modelo SI.", 
    width = 4,
    shinyjs::useShinyjs(),
    
    #Numero de infectados dado por el numero inicial que obtuvimos de kaspersky, dado en millones
    sliderInput("infectadosSI", "Infectados:", 1, 1000, 14, step = 1),
    
    #suceptibles es numero total de usuarios del antivirus kaspersky
    sliderInput("suceptiblesSI", "Suceptibles:", 12, 1000, 600, step = 1),
    
    #Numero de dias dado por el total de datos obtenidos en kaspersky
    sliderInput("diasSI", "Dias:", 30, 50, 35, step = 1),
    
    #El beta calculado por medio de las pendientes
    sliderInput("bethaSI", "Beta:", 0.1000, 0.2000, round(p, 4), step = 0.0001),
    actionButton("botonCalcularSI", "Calcular")
  ),
  tabBox(
    title = "Metodos",
    width = 8,
    tabPanel("RK4",
             width = 400,
             plotOutput("plot1SI", height = 380),
             plotOutput("plot1PendSI", height = 380, width = 400),
             plotOutput("plot1ErrorSI", height = 400, width = 400),
             dataTableOutput("tablaErrorR")
    ),
    tabPanel("Adams",
             width = 400,
             plotOutput("plot2SI", height = 380),
             plotOutput("plot2PendSI", height = 380, width = 400),
             plotOutput("plot2ErrorSI", height = 400, width = 400),
             dataTableOutput("tablaErrorA")
    )
  )
  
  
)


TabSIR <- fluidRow( 
  box(
    title = "Modelo SIR.", 
    width = 4,
    shinyjs::useShinyjs(),
    
    #Numero de infectados dado por el numero inicial que obtuvimos de kaspersky, dado en millones
    sliderInput("infectadosSIR", "Infectados:", 1, 1000, 14, step = 1),
    
    #suceptibles es numero total de usuarios del antivirus kaspersky
    sliderInput("suceptiblesSIR", "Suceptibles:", 12, 1000, 600, step = 1),
    
    #Numero de dias dado por el total de datos obtenidos en kaspersky
    sliderInput("diasSIR", "Dias:", 30, 50, 35, step = 1),
    
    #El beta calculado por medio de las pendientes
    sliderInput("bethaSIR", "Beta:", 0.1000, 0.2000, 0.1351, step = 0.0001),
    
    #El gamma es dado por el libro referenciado anteriormente, el valor es una probabilidad del 28%
    sliderInput("gammaSIR", "Gamma:", 0.2500, 0.3500, 0.2800, step = 0.0001),
    actionButton("botonCalcularSIR", "Calcular")
  ),
  tabBox(
    title = "Metodos",
    width = 8,
    tabPanel("RK4",
             width = 400,
             plotOutput("plot1SIR", height = 380),
             plotOutput("plot1PendSIR", height = 380, width = 400),
             plotOutput("plot1ErrorSIR", height = 400, width = 400),
             dataTableOutput("tablaErrorR2")
    ),
    tabPanel("Adams",
             width = 400,
             plotOutput("plot2SIR", height = 380),
             plotOutput("plot2PendSIR", height = 380, width = 400),
             plotOutput("plot2ErrorSIR", height = 400, width = 400),
             dataTableOutput("tablaErrorA2")
    )
  )
)


body <- dashboardBody(
  tabItems(
    tabItem("SI",frow1, TabSI),
    tabItem("SIR",TabSIR)
  )
  
)

ui <- dashboardPage(title = 'Reto 3', header, sidebar, body, skin='red')

# Define server logic to show current time, update every second ----
server <- function(input, output, session) {
  CalcularSI <- function(){
    
    #Graficas SI con RK4

    output$plot1SI <- renderPlot({
      N = 1
      #estado inicial de los compartimentos
      init <- c(S = input$suceptiblesSI,
                I = input$infectadosSI)
      #par�metros del modelo (coeficientes de las variables)
      param <- c(beta = input$bethaSI,
                 gamma = input$gammaSI)
      
      si <- function(times, init, param) {
        with(as.list(c(init, param)), {
          #ecuaciones diferenciales   
          dS <- -beta * S * I / (S + I)
          dI <-  beta * S * I / (S + I)
          #dR <-                 gamma * I
          #resultados de las tasas de cambio    
          return(list(c(dS, dI)))
        })
      }
      times <- seq(0,input$diasSI, by = 1)
      #resolver el sistema de ecuaciones con funci�n 'ode'
      out <- ode(y = init, times = times, func = si, parms = param, method = "rk4")
      #cambiar out a un data.frame
      out <- as.data.frame(out*N) #aqui puede multiplicar 'out' por N
      attach(out)
      
      #grafica
      plot(dias, total, pch = 19, ylim = c(0, 800), xlim = c(0, input$diasSI),cex=1, col = "red")
      splineAjuste=splinefun(dias, total) # frontera natural
      curve(splineAjuste,add=T,lty=1,lwd=2, ylim = c(0, 800), xlim = c(0, input$diasSI), col= "blue")
      par(new=T)
      plot(out$time, out$S, type="l", col="green", ylim=c(0,800), xlab="Dias", ylab="Infectados",main = "Runge Kutta 4")
      par(new=T)
      plot(out$time, out$I ,col="red", type="l", xlab="Dias", ylab="Infectados", ylim = c(0,800))
      legend(x = "topright", legend=c("Susceptibles", "Infectados aproximado", "infectados real"), col=c("green", "red", "blue"), lty=rep(1, 2)) 
    })
    
    #Campo pendientes SI RK4
    output$plot1PendSI <- renderPlot({
      scopeField <- function(t, p, parameters){
        k <- parameters[1]
        n <- parameters[2]
        dp <- k*(p*(n-p))
        list(dp)
      }
      
      scopeField.flowField <- flowField(scopeField, xlim = c(0, input$diasSI),
                                        ylim = c(0, input$suceptiblesSI), parameters = c(0.0005, 1000),
                                        system = "one.dim",
                                        add = FALSE, xlab = "Dias", ylab = "Infectados",
                                        main = "Campo de pendientes")
    })
    
    #Calculo error relativo SI RK4
    output$plot1ErrorSI <- renderPlot({
      N = 1
      #estado inicial de los compartimentos
      init <- c(S = input$suceptiblesSI,
                I = input$infectadosSI)
      #par�metros del modelo (coeficientes de las variables)
      param <- c(beta = input$bethaSI,
                 gamma = input$gammaSI)
      
      si <- function(times, init, param) {
        with(as.list(c(init, param)), {
          #ecuaciones diferenciales   
          dS <- -beta * S * I / (S + I)
          dI <-  beta * S * I / (S + I)
          #dR <-                 gamma * I
          #resultados de las tasas de cambio    
          return(list(c(dS, dI)))
        })
      }
      times <- seq(0,input$diasSI, by = 1)
      #resolver el sistema de ecuaciones con funci�n 'ode'
      out <- ode(y = init, times = times, func = si, parms = param, method = "rk4")
      #cambiar out a un data.frame
      out <- as.data.frame(out*N) #aqui puede multiplicar 'out' por N
      attach(out)
      
      error <- c()
      i <- 1
      for(i in seq(1,input$diasSI+1, by = 1)){
        error <- c(error, (abs(total[i] - out$I[i]))/total[i])
      }
      plot(times, error, col = "purple", lwd = "2",type = "l", xlab = "Dias", ylab = "Error relativo", main = "Error", ylim = c(0, 10))
    })
    
    #Calculo Error relativo SI RK4 tabla 
    output$tablaErrorR <- renderDataTable({
      N = 1
      #estado inicial de los compartimentos
      init <- c(S = input$suceptiblesSI,
                I = input$infectadosSI)
      #par?metros del modelo (coeficientes de las variables)
      param <- c(beta = input$bethaSI,
                 gamma = input$gammaSI)
      
      si <- function(times, init, param) {
        with(as.list(c(init, param)), {
          #ecuaciones diferenciales   
          dS <- -beta * S * I / (S + I)
          dI <-  beta * S * I / (S + I)
          #dR <-                 gamma * I
          #resultados de las tasas de cambio    
          return(list(c(dS, dI)))
        })
      }
      times <- seq(0,input$diasSI, by = 1)
      #resolver el sistema de ecuaciones con funci?n 'ode'
      out <- ode(y = init, times = times, func = si, parms = param, method = "rk4")
      #cambiar out a un data.frame
      out <- as.data.frame(out*N) #aqui puede multiplicar 'out' por N
      attach(out)
      
      error <- c()
      i <- 1
      for(i in seq(1,input$diasSI+1, by = 1)){
        error <- c(error, (abs(total[i] - out$I[i]))/total[i])
      }

      valores <- data.frame(
        "Dia" = (1:(input$diasSI + 1 )),
        "Real" = round(total, 4),
        "Aproximado" = round(out$I, 4),
        "Error" = round(error,4)
      )
    })
    
    
    #Grafica SI con adams
    
    output$plot2SI <- renderPlot({
      N = 1
      #estado inicial de los compartimentos
      init <- c(S = input$suceptiblesSI,
                I = input$infectadosSI)
      #par�metros del modelo (coeficientes de las variables)
      param <- c(beta = input$bethaSI,
                 gamma = input$gammaSI)
      
      si <- function(times, init, param) {
        with(as.list(c(init, param)), {
          #ecuaciones diferenciales   
          dS <- -beta * S * I / (S + I)
          dI <-  beta * S * I / (S + I)
          #dR <-                 gamma * I
          #resultados de las tasas de cambio    
          return(list(c(dS, dI)))
        })
      }
      times <- seq(0,input$diasSI, by = 1)
      #resolver el sistema de ecuaciones con funci�n 'ode'
      out <- ode(y = init, times = times, func = si, parms = param, method = "adams")
      #cambiar out a un data.frame
      out <- as.data.frame(out*N) #aqui puede multiplicar 'out' por N
      attach(out)
      #grafica
      plot(dias, total, pch = 19, ylim = c(0, 800), xlim = c(0, input$diasSI),cex=1, col = "red")
      splineAjuste=splinefun(dias, total) # frontera natural
      curve(splineAjuste,add=T,lty=1,lwd=2, ylim = c(0, 800), xlim = c(0, input$diasSI), col= "blue")
      par(new=T)
      plot(out$time, out$S, type="l", col="green", ylim=c(0,800), xlab="Dias", ylab="Infectados",main = "Adams")
      par(new=T)
      plot(out$time, out$I ,col="red", type="l", xlab="Dias", ylab="Infectados", ylim = c(0,800))
      legend(x = "topright", legend=c("Susceptibles", "Infectados"), col=c("green", "red"), lty=rep(1, 2)) 
    })
    
    #Campo pendientes SI adams
    output$plot2PendSI <- renderPlot({
      scopeField <- function(t, p, parameters){
        k <- parameters[1]
        n <- parameters[2]
        dp <- k*(p*(n-p))
        list(dp)
      }
      
      scopeField.flowField <- flowField(scopeField, xlim = c(0, input$diasSI),
                                        ylim = c(0, input$suceptiblesSI), parameters = c(0.0005, 1000),
                                        system = "one.dim",
                                        add = FALSE, xlab = "Dias", ylab = "Infectados",
                                        main = "Campo de pendientes")
    })
    
    #Calculo error relativo SI adams
    output$plot2ErrorSI <- renderPlot({
      N = 1
      #estado inicial de los compartimentos
      init <- c(S = input$suceptiblesSI,
                I = input$infectadosSI)
      #par�metros del modelo (coeficientes de las variables)
      param <- c(beta = input$bethaSI,
                 gamma = input$gammaSI)
      
      si <- function(times, init, param) {
        with(as.list(c(init, param)), {
          #ecuaciones diferenciales   
          dS <- -beta * S * I / (S + I)
          dI <-  beta * S * I / (S + I)
          #dR <-                 gamma * I
          #resultados de las tasas de cambio    
          return(list(c(dS, dI)))
        })
      }
      times <- seq(0,input$diasSI, by = 1)
      #resolver el sistema de ecuaciones con funci�n 'ode'
      out <- ode(y = init, times = times, func = si, parms = param, method = "adams")
      #cambiar out a un data.frame
      out <- as.data.frame(out*N) #aqui puede multiplicar 'out' por N
      attach(out)
      
      error <- c()
      i <- 1
      for(i in seq(1,input$diasSI+1, by = 1)){
        error <- c(error, (abs(total[i] - out$I[i]))/total[i])
      }
      plot(times, error, col = "purple", lwd = "2", type = "l", xlab = "Dias", ylab = "Error relativo", main = "Error", ylim = c(0, 10))
    })
    
    #Calculo error relativo SI adams
    output$tablaErrorA <- renderDataTable({
      N = 1
      #estado inicial de los compartimentos
      init <- c(S = input$suceptiblesSI,
                I = input$infectadosSI)
      #par?metros del modelo (coeficientes de las variables)
      param <- c(beta = input$bethaSI,
                 gamma = input$gammaSI)
      
      si <- function(times, init, param) {
        with(as.list(c(init, param)), {
          #ecuaciones diferenciales   
          dS <- -beta * S * I / (S + I)
          dI <-  beta * S * I / (S + I)
          #dR <-                 gamma * I
          #resultados de las tasas de cambio    
          return(list(c(dS, dI)))
        })
      }
      times <- seq(0,input$diasSI, by = 1)
      #resolver el sistema de ecuaciones con funci?n 'ode'
      out <- ode(y = init, times = times, func = si, parms = param, method = "adams")
      #cambiar out a un data.frame
      out <- as.data.frame(out*N) #aqui puede multiplicar 'out' por N
      attach(out)
      
      error <- c()
      i <- 1
      for(i in seq(1,input$diasSI+1, by = 1)){
        error <- c(error, (abs(total[i] - out$I[i]))/total[i])
      }
      
      valores <- data.frame(
        "Dia" = (1:(input$diasSI + 1 )),
        "Real" = round(total, 4),
        "Aproximado" = round(out$I, 4),
        "Error" = round(error,4)
      )
    })
    
  }

  
  CalcularSIR <- function(){
    
    #Graficas SIR con RK4
    
    output$plot1SIR <- renderPlot({
      N = 1
      #estado inicial de los compartimentos
      init <- c(S = input$suceptiblesSIR,
                I = input$infectadosSIR,
                R = 0)
      #par�metros del modelo (coeficientes de las variables)
      param <- c(beta = input$bethaSIR/100,
                 gamma = input$gammaSIR)
      
      sir <- function(times, init, param) {
        with(as.list(c(init, param)), {
          #ecuaciones diferenciales   
          dS <- -beta * S * I 
          dI <-  beta * S * I - gamma * I
          dR <-                 gamma * I
          #resultados de las tasas de cambio    
          return(list(c(dS, dI, dR)))
        })
      }
      times <- seq(0,input$diasSIR, by = 1)
      #resolver el sistema de ecuaciones con funci�n 'ode'
      out <- ode(y = init, times = times, func = sir, parms = param, method = "rk4")
      #cambiar out a un data.frame
      out <- as.data.frame(out*N) #aqui puede multiplicar 'out' por N
      attach(out)
      
      #graficas
      plot(out$time, out$S, type="l", col="green", ylim=c(0,800), xlab="Dias", ylab="Infectados",main = "Runge Kutta 4")
      par(new=T)
      plot(out$time, out$I ,col="red", type="l", xlab="Dias", ylab="Infectados", ylim = c(0,800))
      par(new=T)
      plot(out$time, out$R ,type = "l", col="blue", xlab="Dias", ylab="Infectados", ylim = c(0, 800))
      legend(x = "topright", legend=c("Susceptibles", "Infectados", "Recuperados"), col=c("green", "red", "blue"), lty=rep(1, 2))
      
    })
    
    #Campo pendientes SIR RK4
    output$plot1PendSIR <- renderPlot({
      scopeField <- function(t, p, parameters){
        k <- parameters[1]
        n <- parameters[2]
        dp <- k*(p*(n-p))
        list(dp)
      }
      
      scopeField.flowField <- flowField(scopeField, xlim = c(0, input$diasSIR),
                                        ylim = c(0, input$suceptiblesSIR), parameters = c(0.3, 1),
                                        system = "one.dim",
                                        add = FALSE, xlab = "Dias", ylab = "Infectados",
                                        main = "Campo de pendientes")
    })
    
    #Calculo error relativo SIR RK4
    output$plot1ErrorSIR <- renderPlot({
      N = 1
      #estado inicial de los compartimentos
      init <- c(S = input$suceptiblesSIR,
                I = input$infectadosSIR,
                R = 0)
      #par�metros del modelo (coeficientes de las variables)
      param <- c(beta = input$bethaSIR,
                 gamma = input$gammaSIR)
      
      sir <- function(times, init, param) {
        with(as.list(c(init, param)), {
          #ecuaciones diferenciales   
          dS <- -beta * S * I 
          dI <-  beta * S * I - gamma * I
          dR <-                 gamma * I
          #resultados de las tasas de cambio    
          return(list(c(dS, dI, dR)))
        })
      }
      times <- seq(0,input$diasSIR, by = 1)
      #resolver el sistema de ecuaciones con funci�n 'ode'
      out <- ode(y = init, times = times, func = sir, parms = param, method = "lsoda")
      out2 <- ode(y = init, times = times, func = sir, parms = param, method = "adams")
      #cambiar out a un data.frame
      out <- as.data.frame(out*N) #aqui puede multiplicar 'out' por N
      out2 <- as.data.frame(out2*N)
      attach(out)
      attach(out2)
      
      error <- c()
      i <- 1
      for(i in seq(1,input$diasSIR+1, by = 1)){
        error <- c(error, (abs(out$I[i] - out2$I[i]))/out$I[i])
      }
      plot(times, error, col = "purple", lwd = "2", type = "l", xlab = "Dias", ylab = "Error relativo", main = "Error", ylim = c(0, 10))
    })
    
    #Calculo error relativo SIR RK4 tabla
    output$tablaErrorR2 <- renderDataTable({
      N = 1
      #estado inicial de los compartimentos
      init <- c(S = input$suceptiblesSIR,
                I = input$infectadosSIR,
                R = 0)
      #par�metros del modelo (coeficientes de las variables)
      param <- c(beta = input$bethaSIR,
                 gamma = input$gammaSIR)
      
      sir <- function(times, init, param) {
        with(as.list(c(init, param)), {
          #ecuaciones diferenciales   
          dS <- -beta * S * I 
          dI <-  beta * S * I - gamma * I
          dR <-                 gamma * I
          #resultados de las tasas de cambio    
          return(list(c(dS, dI, dR)))
        })
      }
      times <- seq(0,input$diasSIR, by = 1)
      #resolver el sistema de ecuaciones con funci�n 'ode'
      out <- ode(y = init, times = times, func = sir, parms = param, method = "lsoda")
      out2 <- ode(y = init, times = times, func = sir, parms = param, method = "adams")
      #cambiar out a un data.frame
      out <- as.data.frame(out*N) #aqui puede multiplicar 'out' por N
      out2 <- as.data.frame(out2*N)
      attach(out)
      attach(out2)
      
      error <- c()
      i <- 1
      for(i in seq(1,input$diasSIR+1, by = 1)){
        error <- c(error, (abs(out$I[i] - out2$I[i]))/out$I[i])
      }

      valores <- data.frame(
        "Dia" = (1:(input$diasSIR + 1 )),
        "Real" = round(out$I, 4),
        "Aproximado" = round(out2$I, 4),
        "Error" = round(error,4)
      )
    })
    
    #Graficas SIR con Adams
    
    output$plot2SIR <- renderPlot({
      N = 1
      #estado inicial de los compartimentos
      init <- c(S = input$suceptiblesSIR,
                I = input$infectadosSIR,
                R = 0)
      #par�metros del modelo (coeficientes de las variables)
      param <- c(beta = input$bethaSIR/100,
                 gamma = input$gammaSIR)
      
      sir <- function(times, init, param) {
        with(as.list(c(init, param)), {
          #ecuaciones diferenciales   
          dS <- -beta * S * I 
          dI <-  beta * S * I - gamma * I
          dR <-                 gamma * I
          #resultados de las tasas de cambio    
          return(list(c(dS, dI, dR)))
        })
      }
      times <- seq(0,input$diasSIR, by = 1)
      #resolver el sistema de ecuaciones con funci�n 'ode'
      out <- ode(y = init, times = times, func = sir, parms = param, method = "adams")
      #cambiar out a un data.frame
      out <- as.data.frame(out*N) #aqui puede multiplicar 'out' por N
      attach(out)
      
      #graficas
      plot(out$time, out$S, type="l", col="green", ylim=c(0,800), xlab="Dias", ylab="Infectados",main = "Adams")
      par(new=T)
      plot(out$time, out$I ,col="red", type="l", xlab="Dias", ylab="Infectados", ylim = c(0,800))
      par(new=T)
      plot(out$time, out$R ,type = "l", col="blue", xlab="Dias", ylab="Infectados", ylim = c(0, 800))
      legend(x = "topright", legend=c("Susceptibles", "Infectados", "Recuperados"), col=c("green", "red", "blue"), lty=rep(1, 2))
      
    })
    
    #Campo pendientes SIR adamas
    output$plot2PendSIR <- renderPlot({
      scopeField <- function(t, p, parameters){
        k <- parameters[1]
        n <- parameters[2]
        dp <- k*(p*(n-p))
        list(dp)
      }
      
      scopeField.flowField <- flowField(scopeField, xlim = c(0, input$diasSIR),
                                        ylim = c(0, input$suceptiblesSIR), parameters = c(0.3, 1),
                                        system = "one.dim",
                                        add = FALSE, xlab = "Dias", ylab = "Infectados",
                                        main = "Campo de pendientes")
    })
    
    #Calculo error relativo SIR adams
    output$plot2ErrorSIR <- renderPlot({
      N = 1
      #estado inicial de los compartimentos
      init <- c(S = input$suceptiblesSIR,
                I = input$infectadosSIR,
                R = 0)
      #par�metros del modelo (coeficientes de las variables)
      param <- c(beta = input$bethaSIR,
                 gamma = input$gammaSIR)
      
      sir <- function(times, init, param) {
        with(as.list(c(init, param)), {
          #ecuaciones diferenciales   
          dS <- -beta * S * I 
          dI <-  beta * S * I - gamma * I
          dR <-                 gamma * I
          #resultados de las tasas de cambio    
          return(list(c(dS, dI, dR)))
        })
      }
      times <- seq(0,input$diasSIR, by = 1)
      #resolver el sistema de ecuaciones con funci�n 'ode'
      out <- ode(y = init, times = times, func = sir, parms = param, method = "adams")
      #cambiar out a un data.frame
      out <- as.data.frame(out*N) #aqui puede multiplicar 'out' por N
      attach(out)
      
      error <- c()
      i <- 1
      for(i in seq(1,input$diasSIR+1, by = 1)){
        error <- c(error, (abs(total[i] - out$I[i]))/total[i])
      }
      plot(times, error, col = "purple", lwd = "2", type = "l", xlab = "Dias", ylab = "Error relativo", main = "Error", ylim = c(0, 10))
    })
    
    #Calculo error relativo SIR adams tabla
    output$tablaErrorA2 <- renderDataTable({
      N = 1
      #estado inicial de los compartimentos
      init <- c(S = input$suceptiblesSIR,
                I = input$infectadosSIR,
                R = 0)
      #par�metros del modelo (coeficientes de las variables)
      param <- c(beta = input$bethaSIR,
                 gamma = input$gammaSIR)
      
      sir <- function(times, init, param) {
        with(as.list(c(init, param)), {
          #ecuaciones diferenciales   
          dS <- -beta * S * I 
          dI <-  beta * S * I - gamma * I
          dR <-                 gamma * I
          #resultados de las tasas de cambio    
          return(list(c(dS, dI, dR)))
        })
      }
      times <- seq(0,input$diasSIR, by = 1)
      #resolver el sistema de ecuaciones con funci�n 'ode'
      out <- ode(y = init, times = times, func = sir, parms = param, method = "adams")
      out2 <- ode(y = init, times = times, func = sir, parms = param, method = "lsoda")
      #cambiar out a un data.frame
      out <- as.data.frame(out*N) #aqui puede multiplicar 'out' por N
      out2 <- as.data.frame(out2*N)
      attach(out)
      attach(out2)
      
      error <- c()
      i <- 1
      for(i in seq(1,input$diasSIR+1, by = 1)){
        error <- c(error, (abs(out$I[i] - out2$I[i]))/out$I[i])
      }

      valores <- data.frame(
        "Dia" = (1:(input$diasSIR + 1 )),
        "Real" = round(out$I, 4),
        "Aproximado" = round(out2$I, 4),
        "Error" = round(error,4)
      )
    })
  }
  
  
  observeEvent(input$botonCalcularSI, {
    CalcularSI()
  })
  
  observeEvent(input$botonCalcularSIR, {
    CalcularSIR()
  })

}

# Create Shiny app ----
shinyApp(ui, server)
